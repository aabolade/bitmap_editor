require_relative 'image'

class BitmapEditor

  COMMANDS = {:create => /^I (\d+) (\d+$)/,
              :colour_pixel => /^L (\d+) (\d+) ([A-Z]$)/,
              :colour_horizontal_segment => /^H (\d+) (\d+) (\d+) ([A-Z]$)/,
              :colour_vertical_segment => /^V (\d+) (\d+) (\d+) ([A-Z]$)/ }

  attr_reader :image

  def initialize(image = Image)
    @image = image.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)
    output(file)
  end

  def output(file)
    File.open(file).each do |line|
      line = line.chomp
      parse_command(line)
    end
  end

  def parse_command(command)
    if match = command.match(COMMANDS[:create])
      create_image(match)
    elsif command == "C"
      clear_table
    elsif command == "S"
      puts show_image
    elsif match = command.match(COMMANDS[:colour_pixel])
      colour_pixel(match)
    elsif match = command.match(COMMANDS[:colour_vertical_segment])
      colour_column(match)
    elsif match = command.match(COMMANDS[:colour_horizontal_segment])
      colour_row(match)
    end
  end

  def create_image(match)
    columns, rows = match.captures
    image.create_pixels(rows.to_i,columns.to_i)
  end

  def clear_table
    image.clear_table
  end

  def show_image
    image.show_output
  end

  def colour_pixel(match)
    column, row, colour = match.captures
    image.colour_pixel(row.to_i,column.to_i,colour)
  end

  def colour_column(match)
    column, row_start, row_end, colour = match.captures
    image.colour_column(column.to_i,row_start.to_i,row_end.to_i,colour)
  end

  def colour_row(match)
    column_start, column_end, row, colour = match.captures
    image.colour_row(row.to_i,column_start.to_i,column_end.to_i,colour)
  end

end
