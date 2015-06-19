module Safegenda
  class CommandsSafegenda

    require 'safegenda'

    def self.run_command(argv)
      command = argv.shift
      params = argv

      safegenda = Agenda.new

      if safegenda.respond_to?(command)
        safegenda.send(command, *params)
      else
        puts "Command not exists"
      end
    end

  end
end