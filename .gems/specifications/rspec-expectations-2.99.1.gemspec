# -*- encoding: utf-8 -*-
# stub: rspec-expectations 2.99.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rspec-expectations"
  s.version = "2.99.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Steven Baker", "David Chelimsky"]
  s.date = "2014-06-20"
  s.description = "rspec expectations (should[_not] and matchers)"
  s.email = "rspec-users@rubyforge.org"
  s.homepage = "http://github.com/rspec/rspec-expectations"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = "rspec"
  s.rubygems_version = "2.3.0"
  s.summary = "rspec-expectations-2.99.1"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<diff-lcs>, ["< 2.0", ">= 1.1.3"])
      s.add_development_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_development_dependency(%q<aruba>, ["~> 0.5"])
    else
      s.add_dependency(%q<diff-lcs>, ["< 2.0", ">= 1.1.3"])
      s.add_dependency(%q<rake>, ["~> 10.0.0"])
      s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
      s.add_dependency(%q<aruba>, ["~> 0.5"])
    end
  else
    s.add_dependency(%q<diff-lcs>, ["< 2.0", ">= 1.1.3"])
    s.add_dependency(%q<rake>, ["~> 10.0.0"])
    s.add_dependency(%q<cucumber>, ["~> 1.1.9"])
    s.add_dependency(%q<aruba>, ["~> 0.5"])
  end
end
