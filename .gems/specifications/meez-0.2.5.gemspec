# -*- encoding: utf-8 -*-
# stub: meez 0.2.5 ruby lib

Gem::Specification.new do |s|
  s.name = "meez"
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Paul Czarkowski"]
  s.date = "2014-01-08"
  s.description = "`Meez` (slang for `mise en place`) will create an opinionated chef cookbook skeleton complete with testing suite including:\n    berkshelf, chefspec, test kitchen, foodcritic, server spec\n\n"
  s.email = "paul.czarkowski@rackspace.com"
  s.executables = ["meez"]
  s.files = ["bin/meez"]
  s.homepage = "http://github.com/paulczar/meez"
  s.licenses = ["apache2"]
  s.rubygems_version = "2.3.0"
  s.summary = "Initializes a chef cookbook with TDD framework"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef>, ["~> 11.8"])
      s.add_runtime_dependency(%q<test-kitchen>, ["~> 1.2"])
      s.add_runtime_dependency(%q<bundler>, ["~> 1.5"])
      s.add_runtime_dependency(%q<berkshelf>, ["~> 3.1"])
    else
      s.add_dependency(%q<chef>, ["~> 11.8"])
      s.add_dependency(%q<test-kitchen>, ["~> 1.2"])
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<berkshelf>, ["~> 3.1"])
    end
  else
    s.add_dependency(%q<chef>, ["~> 11.8"])
    s.add_dependency(%q<test-kitchen>, ["~> 1.2"])
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<berkshelf>, ["~> 3.1"])
  end
end
