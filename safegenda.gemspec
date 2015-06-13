Gem::Specification.new do |spec|
	spec.name =	"safegenda"
	spec.version =	"0.0.4"
	spec.authors =	["Yuri Matheus"]
	spec.description = "Add a new activity in your agenda."
	spec.email =	["yuri_dias_@hotmail.com"]
	spec.date =	"2015-06-12"

	spec.files = ["lib/safegenda.rb","lib/safegenda/table_format.rb"]
	spec.executables = ['add_activity','remove_all_activity']
	spec.require_paths =	["lib"]
	spec.rubyforge_project = "safegenda"
	spec.rubygems_version	= "2.4.6"
	spec.summary = "with no summary"
end