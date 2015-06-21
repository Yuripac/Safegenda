Gem::Specification.new do |spec|
  spec.name = "safegenda"
  spec.version =  "1.0.0"
  spec.authors =  ["Yuri Matheus"]
  spec.description = "Add a new activity in your agenda."
  spec.email =  ["yuri_dias_@hotmail.com"]
  spec.date = "2015-06-19"

  spec.files = ["lib/safegenda.rb",
                "lib/safegenda/table_format.rb",
                "lib/safegenda/application.rb",
                "lib/safegenda/commands_safegenda.rb"
               ]
  spec.executables = ['safegenda']
  spec.require_paths =  ["lib"]
  spec.rubyforge_project = "safegenda"
  spec.rubygems_version = "2.4.6"
  spec.summary = "with no summary"
end