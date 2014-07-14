# -*- encoding: utf-8 -*-
# stub: fauxhai 2.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "fauxhai"
  s.version = "2.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Seth Vargo"]
  s.date = "2014-04-27"
  s.description = "Easily mock out ohai data"
  s.email = ["sethvargo@gmail.com"]
  s.executables = ["fauxhai"]
  s.files = ["bin/fauxhai"]
  s.homepage = "https://github.com/customink/fauxhai"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubygems_version = "2.3.0"
  s.summary = "Fauxhai provides an easy way to mock out your ohai data for testing with chefspec!"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<net-ssh>, [">= 0"])
      s.add_runtime_dependency(%q<ohai>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<net-ssh>, [">= 0"])
      s.add_dependency(%q<ohai>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<net-ssh>, [">= 0"])
    s.add_dependency(%q<ohai>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
