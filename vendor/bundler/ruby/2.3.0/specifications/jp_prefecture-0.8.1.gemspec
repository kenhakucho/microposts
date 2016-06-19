# -*- encoding: utf-8 -*-
# stub: jp_prefecture 0.8.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jp_prefecture"
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["chocoby"]
  s.date = "2016-03-30"
  s.description = "Convert japan prefecture code(JIS X 0402 based) into prefecture name."
  s.email = ["chocoby@gmail.com"]
  s.homepage = "https://github.com/chocoby/jp_prefecture"
  s.rubygems_version = "2.5.1"
  s.summary = "Convert japan prefecture code into prefecture name"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.1"])
      s.add_development_dependency(%q<activerecord>, [">= 3.2.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 3.1"])
      s.add_dependency(%q<activerecord>, [">= 3.2.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 3.1"])
    s.add_dependency(%q<activerecord>, [">= 3.2.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
