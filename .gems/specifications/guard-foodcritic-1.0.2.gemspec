# -*- encoding: utf-8 -*-
# stub: guard-foodcritic 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "guard-foodcritic"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chris Griego"]
  s.date = "2013-10-10"
  s.description = "Guard::Foodcritic automatically runs foodcritic."
  s.email = ["cgriego@gmail.com"]
  s.homepage = "https://github.com/cgriego/guard-foodcritic"
  s.rubygems_version = "2.3.0"
  s.summary = "Guard::Foodcritic automatically runs foodcritic."

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<guard>, ["< 3.0", ">= 1.0"])
      s.add_runtime_dependency(%q<foodcritic>, ["< 4.0", ">= 1.3"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
    else
      s.add_dependency(%q<guard>, ["< 3.0", ">= 1.0"])
      s.add_dependency(%q<foodcritic>, ["< 4.0", ">= 1.3"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 2.10"])
    end
  else
    s.add_dependency(%q<guard>, ["< 3.0", ">= 1.0"])
    s.add_dependency(%q<foodcritic>, ["< 4.0", ">= 1.3"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 2.10"])
  end
end
