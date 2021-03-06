# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{graft}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Patrick Reagan"]
  s.date = %q{2010-01-25}
  s.email = %q{reaganpr@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "lib/graft", "lib/graft/core_ext", "lib/graft/core_ext/hash.rb", "lib/graft/json", "lib/graft/json/attribute.rb", "lib/graft/json/model.rb", "lib/graft/json.rb", "lib/graft/model.rb", "lib/graft/version.rb", "lib/graft/xml", "lib/graft/xml/attribute.rb", "lib/graft/xml/model.rb", "lib/graft/xml/type.rb", "lib/graft/xml.rb", "test/test_helper.rb", "test/unit", "test/unit/core_ext", "test/unit/core_ext/hash_test.rb", "test/unit/json", "test/unit/json/attribute_test.rb", "test/unit/json/model_test.rb", "test/unit/xml", "test/unit/xml/attribute_test.rb", "test/unit/xml/model_test.rb", "test/unit/xml/type_test.rb"]
  s.homepage = %q{http://sneaq.net/}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Graft provides an easy way to map XML and JSON data onto your Ruby classes}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0.6.164"])
      s.add_runtime_dependency(%q<tzinfo>, [">= 0.3.12"])
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.0"])
      s.add_runtime_dependency(%q<json>, [">= 1.1.7"])
    else
      s.add_dependency(%q<hpricot>, [">= 0.6.164"])
      s.add_dependency(%q<tzinfo>, [">= 0.3.12"])
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<activesupport>, [">= 2.0"])
      s.add_dependency(%q<json>, [">= 1.1.7"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0.6.164"])
    s.add_dependency(%q<tzinfo>, [">= 0.3.12"])
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<activesupport>, [">= 2.0"])
    s.add_dependency(%q<json>, [">= 1.1.7"])
  end
end
