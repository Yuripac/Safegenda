module Safegenda
  class Application

    require 'safegenda/commands_safegenda'

    def self.run(argv)
      CommandsSafegenda.run_command(argv)
    end

  end
end