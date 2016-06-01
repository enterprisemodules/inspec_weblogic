# -*- encoding: utf-8 -*-
# stub: inspec-weblogic 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "inspec-weblogic"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Bert Hajee"]
  s.date = "2016-05-25"
  s.description = "    Inspec Library to test Oracle settings\n"
  s.email = "bert.hajee@enterprisemodules.com"
  s.files = ["README.md", "lib/inspec", "lib/inspec/weblogic", "lib/inspec/weblogic.rb", "lib/inspec/weblogic/matchers", "lib/inspec/weblogic/resources", "lib/inspec/weblogic/resources/wls_managed_server.rb", "lib/inspec/weblogic/utils", "lib/inspec/weblogic/utils/execute.py.erb", "lib/inspec/weblogic/utils/helpers.rb", "lib/inspec/weblogic/utils/object.rb", "lib/inspec/weblogic/utils/string.rb", "lib/inspec/weblogic/utils/wls_resource.rb", "lib/inspec/weblogic/version.rb"]
  s.homepage = "https://github.com/enterprisemodules/inspec-weblogic"
  s.licenses = [""]
  s.rubygems_version = "2.2.5"
  s.summary = "Inspec Library to test WebLogic settings"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<inspec>, ["~> 0.16.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-its>, ["~> 1.0"])
      s.add_development_dependency(%q<rspec-collection_matchers>, ["~> 1.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rubygems-tasks>, [">= 0"])
    else
      s.add_dependency(%q<inspec>, ["~> 0.16.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rspec-its>, ["~> 1.0"])
      s.add_dependency(%q<rspec-collection_matchers>, ["~> 1.0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rubygems-tasks>, [">= 0"])
    end
  else
    s.add_dependency(%q<inspec>, ["~> 0.16.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rspec-its>, ["~> 1.0"])
    s.add_dependency(%q<rspec-collection_matchers>, ["~> 1.0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rubygems-tasks>, [">= 0"])
  end
end
