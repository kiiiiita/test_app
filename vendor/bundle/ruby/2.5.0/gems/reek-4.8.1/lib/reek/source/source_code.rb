# frozen_string_literal: true

require_relative '../cli/silencer'
Reek::CLI::Silencer.silently do
  require 'parser/ruby25'
end
require_relative '../tree_dresser'
require_relative '../ast/node'
require_relative '../ast/builder'

# Opt in to new way of representing lambdas
Reek::AST::Builder.emit_lambda = true

module Reek
  module Source
    #
    # A +Source+ object represents a chunk of Ruby source code.
    #
    class SourceCode
      # Consume and store parser diagnostics
      class DiagnosticsConsumer
        def initialize
          @diagnostics = []
        end

        def call(item)
          @diagnostics << item
        end

        def result
          @diagnostics
        end
      end

      IO_IDENTIFIER     = 'STDIN'.freeze
      STRING_IDENTIFIER = 'string'.freeze

      attr_reader :origin

      # Initializer.
      #
      # code   - Ruby code as String
      # origin - 'STDIN', 'string' or a filepath as String
      # parser - the parser to use for generating AST's out of the given code
      def initialize(code:, origin:, parser: self.class.default_parser)
        @origin = origin
        @parser = parser
        code.force_encoding(Encoding::UTF_8)
        @code = code
      end

      # Initializes an instance of SourceCode given a source.
      # This source can come via 4 different ways:
      # - from Files or Pathnames a la `reek lib/reek/`
      # - from IO (STDIN) a la `echo "class Foo; end" | reek`
      # - from String via our rspec matchers a la `expect("class Foo; end").to reek`
      #
      # @param source [File|IO|String] - the given source
      #
      # @return an instance of SourceCode
      # :reek:DuplicateMethodCall: { max_calls: 2 }
      def self.from(source)
        case source
        when File     then new(code: source.read,           origin: source.path)
        when IO       then new(code: source.readlines.join, origin: IO_IDENTIFIER)
        when Pathname then new(code: source.read,           origin: source.to_s)
        when String   then new(code: source,                origin: STRING_IDENTIFIER)
        end
      end

      def diagnostics
        parse_result.last
      end

      def syntax_tree
        parse_result.first
      end

      def self.default_parser
        Parser::Ruby25.new(AST::Builder.new).tap do |parser|
          diagnostics = parser.diagnostics
          diagnostics.all_errors_are_fatal = false
          diagnostics.ignore_warnings      = false
          diagnostics.consumer = DiagnosticsConsumer.new
        end
      end

      private

      def parse_result
        @parse_result ||= parse
      end

      attr_reader :code
      attr_reader :parser

      # Parses the given code into an AST and associates the source code comments with it.
      # This AST is then traversed by a TreeDresser which adorns the nodes in the AST
      # with our SexpExtensions.
      # Finally this AST is returned where each node is an anonymous subclass of Reek::AST::Node
      #
      # Important to note is that Reek will not fail on unparseable files but rather register a
      # parse error to @diagnostics and then just continue.
      #
      # Given this @code:
      #
      #   # comment about C
      #   class C
      #     def m
      #       puts 'nada'
      #     end
      #   end
      #
      # this method would return something that looks like
      #
      #   (class
      #     (const nil :C) nil
      #     (def :m
      #       (args)
      #       (send nil :puts
      #         (str "nada"))))
      #
      # where each node is possibly adorned with our SexpExtensions (see ast/ast_node_class_map
      # and ast/sexp_extensions for details).
      #
      # @return [Anonymous subclass of Reek::AST::Node, Array] the AST presentation
      #         for the given code, List of diagnostics messages
      def parse
        buffer = Parser::Source::Buffer.new(origin, 1)
        buffer.source = code
        ast, comments = parser.parse_with_comments(buffer)

        # See https://whitequark.github.io/parser/Parser/Source/Comment/Associator.html
        comment_map = Parser::Source::Comment.associate(ast, comments)
        [TreeDresser.new.dress(ast, comment_map), parser.diagnostics.consumer.result]
      end
    end
  end
end
