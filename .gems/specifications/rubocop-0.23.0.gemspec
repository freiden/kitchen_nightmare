# -*- encoding: utf-8 -*-
# stub: rubocop 0.23.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop"
  s.version = "0.23.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bozhidar Batsov"]
  s.date = "2014-06-02"
  s.description = "    Automatic Ruby code style checking tool.\n    Aims to enforce the community-driven Ruby Style Guide.\n"
  s.email = "bozhidar@batsov.com"
  s.executables = ["rubocop"]
  s.extra_rdoc_files = ["LICENSE.txt", "README.md"]
  s.files = ["LICENSE.txt", "README.md", "bin/rubocop"]
  s.homepage = "http://github.com/bbatsov/rubocop"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = "2.3.0"
  s.summary = "Automatic Ruby code style checking tool."

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rainbow>, ["< 3.0", ">= 1.99.1"])
      s.add_runtime_dependency(%q<parser>, ["~> 2.1.9"])
      s.add_runtime_dependency(%q<powerpack>, ["~> 0.0.6"])
      s.add_runtime_dependency(%q<json>, ["< 2", ">= 1.7.7"])
      s.add_runtime_dependency(%q<ruby-progressbar>, ["~> 1.4"])
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7"])
    else
      s.add_dependency(%q<rainbow>, ["< 3.0", ">= 1.99.1"])
      s.add_dependency(%q<parser>, ["~> 2.1.9"])
      s.add_dependency(%q<powerpack>, ["~> 0.0.6"])
      s.add_dependency(%q<json>, ["< 2", ">= 1.7.7"])
      s.add_dependency(%q<ruby-progressbar>, ["~> 1.4"])
      s.add_dependency(%q<rake>, ["~> 10.1"])
      s.add_dependency(%q<rspec>, ["~> 2.14"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<simplecov>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<rainbow>, ["< 3.0", ">= 1.99.1"])
    s.add_dependency(%q<parser>, ["~> 2.1.9"])
    s.add_dependency(%q<powerpack>, ["~> 0.0.6"])
    s.add_dependency(%q<json>, ["< 2", ">= 1.7.7"])
    s.add_dependency(%q<ruby-progressbar>, ["~> 1.4"])
    s.add_dependency(%q<rake>, ["~> 10.1"])
    s.add_dependency(%q<rspec>, ["~> 2.14"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<simplecov>, ["~> 0.7"])
  end
end
