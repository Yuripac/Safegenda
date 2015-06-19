module Safegenda
  class CommandsSafegenda

    require 'safegenda'

    WHITE_LIST = %(add_activity remove_all_activity)

    def self.run_command(argv)
      command = argv.shift
      params = argv

      if WHITE_LIST.include?(command)
        Agenda.new.send(command, *params)
      else
        puts "Command not exists"
      end
    end

  end
end