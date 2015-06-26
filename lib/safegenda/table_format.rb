module Safegenda
  class TableFormat

    MAX_SPACE = 18

    def self.create_row(activity, time = nil)
      time = time || DEFAULT_TIME

      space_a = MAX_SPACE - activity.length
      space_t = MAX_SPACE - time.length

      blank_space_a = " " * space_a
      blank_space_t = " " * space_t

      row =  "|  #{activity + blank_space_a}"
      row << "|  #{time     + blank_space_t}|\n"
      row << "|#{'-' * (row.length - 3)}|\n"
    end

    # it takes the params and creates a header for the table.
    def self.create_table(*words)
      row_aux = '|'
      words.each do |word|
        blank_space = " " * (MAX_SPACE - word.length)
        row_aux << "  #{word + blank_space}|"
      end
      row_aux << "\n"
      row_div = "|#{'-' * (row_aux.chomp.length - 2)}|\n"

      row = ""
      row << row_div
      row << row_aux
      row << row_div
      row << row_div
    end

  end
end