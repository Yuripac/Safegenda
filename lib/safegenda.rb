require 'safegenda/table_format'

module Safegenda
  class Agenda

    DEFAULT_NAME = "my_agenda"
    DEFAULT_DIR  = "/home/#{ENV['USER']}/Documents/"
    DEFAULT_TIME = "NONE"

    attr_accessor :directory, :name

    def initialize(locals = {})
      default_locals = {
        name:       DEFAULT_NAME,
        directory:  DEFAULT_DIR
      }
      locals = default_locals.merge(locals)

      @directory = locals[:directory]
      @file_name = locals[:name]

      init_safegenda_file if File.zero?(file_agenda) || !File.exist?(file_agenda)
    end

    def add(activity, time = nil)
      time = time || DEFAULT_TIME

      delete_last_line

      File.open(file_agenda, 'a') do |file|
        file << TableFormat.create_row(activity, time)
      end
    end

    # looks for the activity and then removes the row.
    def remove(activity)
      file_text = []

      readlines {|row| file_text << row if row !~ /#{activity}/}
      write(file_text)
    end

    def remove_all
      init_safegenda_file
    end

    def file_agenda
      @directory + @file_name
    end

    # reads all rows
    def readlines
      File.open(file_agenda) do |file|
        if block_given?
          file.each {|row| yield row}
        else
          file.map {|row| row}
        end
      end
    end

    # overrides the text with a new text
    def write(text)
      File.open(file_agenda, 'w') do |file|
        text.each {|row| file << row}
      end
    end

    private

    # create a new file
    def init_safegenda_file
      text = [TableFormat.create_table("ATIVIDADE", "HORARIO")]
      write(text)
    end

    def delete_last_line
      lines = readlines
      lines.pop
      write(lines)
    end
  end
end
