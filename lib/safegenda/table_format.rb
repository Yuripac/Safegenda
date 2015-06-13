module Safegenda
  class TableFormat

    def self.create_row(activity, time = nil)
      time = time || DEFAULT_TIME

      max_space  = 24
      space_a = (max_space - activity.length)
      space_t = (max_space - time.length)

      blank_space_a = " " * space_a
      blank_space_t = " " * space_t

      row =  "|  #{activity + blank_space_a}"
      row << "|  #{time     + blank_space_t}|\n"
      row << "|#{'-' * (row.length - 3)}|\n"

    end

  end
end