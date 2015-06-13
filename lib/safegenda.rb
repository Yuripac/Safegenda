require 'safegenda/table_format'

module Safegenda
	class Agenda

		DEFAULT_NAME = "my_agenda"
		DEFAULT_DIR  = "/home/#{ENV['USER']}/Documents/"
		DEFAULT_TIME = "NONE"

		attr_accessor :directory, :name

		def initialize(locals = {})
			default_locals = {
				name: 			DEFAULT_NAME,
				directory:  DEFAULT_DIR
			}
			locals = default_locals.merge(locals)
			
			@directory = locals[:directory]
			@file_name = locals[:name]

			init_file if File.zero?(file_agenda)
		end

		def add_activity(activity, time = nil)
			time = time || DEFAULT_TIME

			File.open(file_agenda, 'a') do |file|
				file << TableFormat.create_row(activity, time)
			end
		end

		def remove_activity(activity)
			# looks for the activity and then removes the row.
		end

		def remove_all_activity
			init_file
		end

		def file_agenda
			@directory + @file_name
		end

		private

		def init_file
			File.open(file_agenda, 'w') do |file|
				file << TableFormat.create_row("ATIVIDADE", "HORARIO")
			end
		end

	end
end