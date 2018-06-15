Gem::Specification.new do |s|
  s.name        = "airtable-rails"
  s.version     = "1.1"
  s.date        = "2018-06-15"
  s.summary     = "Airtable client from Rails"
  s.description = "Airtable client from Rails"
  s.authors     = ["Joel Cogen"]
  s.email       = "_@jole.io"
  s.files       = ["lib/airtable-rails.rb", "lib/airtable_rails/table.rb"]
  s.homepage    = "https://github.com/joelcogen/airtable-rails"
  s.license     = "MIT"

  s.add_runtime_dependency "rails", ">= 4.0.0"
  s.add_runtime_dependency "airtable", ">= 0.0.9"
end
