# -*- encoding: utf-8 -*-
# stub: chefspec 3.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "chefspec"
  s.version = "3.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andrew Crump", "Seth Vargo"]
  s.date = "2014-03-16"
  s.description = "ChefSpec is a unit testing and resource coverage (code coverage) framework for testing Chef cookbooks ChefSpec makes it easy to write examples and get fast feedback on cookbook changes without the need for virtual machines or cloud servers."
  s.email = ["andrew.crump@ieee.org", "sethvargo@gmail.com"]
  s.homepage = "http://code.sethvargo.com/chefspec"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9")
  s.rubygems_version = "2.3.0"
  s.summary = "Write RSpec examples and generate coverage reports for Chef recipes!"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chef>, ["~> 11.0"])
      s.add_runtime_dependency(%q<fauxhai>, ["~> 2.0"])
      s.add_runtime_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<chef-zero>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<redcarpet>, ["~> 3.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
      s.add_development_dependency(%q<aruba>, ["~> 0.5"])
    else
      s.add_dependency(%q<chef>, ["~> 11.0"])
      s.add_dependency(%q<fauxhai>, ["~> 2.0"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<chef-zero>, ["~> 1.7"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<redcarpet>, ["~> 3.0"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
      s.add_dependency(%q<aruba>, ["~> 0.5"])
    end
  else
    s.add_dependency(%q<chef>, ["~> 11.0"])
    s.add_dependency(%q<fauxhai>, ["~> 2.0"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<chef-zero>, ["~> 1.7"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<redcarpet>, ["~> 3.0"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
    s.add_dependency(%q<aruba>, ["~> 0.5"])
  end
end
