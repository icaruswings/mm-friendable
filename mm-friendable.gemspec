# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mm-friendable}
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Luke Cunningham"]
  s.date = %q{2011-04-14}
  s.description = %q{A very simple mongomapper plugin to add friendship functionality to your application}
  s.email = %q{luke@icaruswings.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/mm-friendable.rb",
    "lib/mongo_mapper/plugins/friendable.rb",
    "lib/mongo_mapper/plugins/friendable/friend_list.rb",
    "mm-friendable.gemspec",
    "spec/mm-friendable_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/models.rb"
  ]
  s.homepage = %q{http://github.com/icaruswings/mm-friendable}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{A very simple mongomapper plugin to add friendship functionaity to your application}
  s.test_files = [
    "spec/mm-friendable_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/models.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bson_ext>, ["= 1.3.0"])
      s.add_development_dependency(%q<mongo_mapper>, ["= 0.9.0"])
      s.add_development_dependency(%q<i18n>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<bson_ext>, ["= 1.3.0"])
      s.add_dependency(%q<mongo_mapper>, ["= 0.9.0"])
      s.add_dependency(%q<i18n>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_dependency(%q<yard>, ["~> 0.6.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<bson_ext>, ["= 1.3.0"])
    s.add_dependency(%q<mongo_mapper>, ["= 0.9.0"])
    s.add_dependency(%q<i18n>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.1.0"])
    s.add_dependency(%q<yard>, ["~> 0.6.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

