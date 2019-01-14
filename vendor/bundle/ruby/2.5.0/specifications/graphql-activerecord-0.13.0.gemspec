# -*- encoding: utf-8 -*-
# stub: graphql-activerecord 0.13.0 ruby lib

Gem::Specification.new do |s|
  s.name = "graphql-activerecord".freeze
  s.version = "0.13.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Foster".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-04-19"
  s.description = "Build Relay-compatible GraphQL schemas based on ActiveRecord models".freeze
  s.email = ["theorygeek@gmail.com".freeze]
  s.homepage = "http://github.com/goco-inc/graphql-activerecord".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "ActiveRecord helpers for GraphQL + Relay".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>.freeze, ["< 6", ">= 4.2"])
      s.add_runtime_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.2"])
      s.add_runtime_dependency(%q<graphql>.freeze, ["< 2", ">= 1.7.5"])
      s.add_runtime_dependency(%q<graphql-batch>.freeze, [">= 0.2.4"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    else
      s.add_dependency(%q<activerecord>.freeze, ["< 6", ">= 4.2"])
      s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.2"])
      s.add_dependency(%q<graphql>.freeze, ["< 2", ">= 1.7.5"])
      s.add_dependency(%q<graphql-batch>.freeze, [">= 0.2.4"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>.freeze, ["< 6", ">= 4.2"])
    s.add_dependency(%q<activesupport>.freeze, ["< 6", ">= 4.2"])
    s.add_dependency(%q<graphql>.freeze, ["< 2", ">= 1.7.5"])
    s.add_dependency(%q<graphql-batch>.freeze, [">= 0.2.4"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.11"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
  end
end
