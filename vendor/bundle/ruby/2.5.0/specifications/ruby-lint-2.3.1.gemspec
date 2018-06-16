# -*- encoding: utf-8 -*-
# stub: ruby-lint 2.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-lint".freeze
  s.version = "2.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yorick Peterse".freeze]
  s.date = "2016-10-17"
  s.description = "A linter and static code analysis tool for Ruby.".freeze
  s.email = "yorickpeterse@gmail.com".freeze
  s.executables = ["ruby-lint".freeze]
  s.files = ["bin/ruby-lint".freeze]
  s.homepage = "https://github.com/yorickpeterse/ruby-lint/".freeze
  s.licenses = ["MPL-2.0".freeze]
  s.post_install_message = "Please report any issues at: https://github.com/YorickPeterse/ruby-lint/issues/new".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.7.6".freeze
  s.summary = "A linter and static code analysis tool for Ruby.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<parser>.freeze, ["~> 2.2"])
      s.add_runtime_dependency(%q<slop>.freeze, [">= 3.4.7", "~> 3.4"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<yard>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<kramdown>.freeze, [">= 0"])
      s.add_development_dependency(%q<redcard>.freeze, [">= 0"])
    else
      s.add_dependency(%q<parser>.freeze, ["~> 2.2"])
      s.add_dependency(%q<slop>.freeze, [">= 3.4.7", "~> 3.4"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<yard>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<kramdown>.freeze, [">= 0"])
      s.add_dependency(%q<redcard>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<parser>.freeze, ["~> 2.2"])
    s.add_dependency(%q<slop>.freeze, [">= 3.4.7", "~> 3.4"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<yard>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<kramdown>.freeze, [">= 0"])
    s.add_dependency(%q<redcard>.freeze, [">= 0"])
  end
end
