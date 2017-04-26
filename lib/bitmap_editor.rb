require_relative 'image'

class BitmapEditor

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
    if (/^I (?<column>\d+) (?<row>\d+$)/ =~ command) == 0
      create_image(row.to_i,column.to_i)
    elsif command == "C"
      clear_table
    elsif command == "S"
      puts show_image
    elsif (/^L (?<column>\d+) (?<row>\d+) (?<colour>[A-Z]$)/ =~ command) == 0
      colour_pixel(row.to_i,column.to_i,colour)
    elsif (/^V (?<column>\d+) (?<start_row>\d+) (?<end_row>\d+) (?<colour>[A-Z]$)/ =~ command) == 0
      colour_column(column.to_i,start_row.to_i,end_row.to_i,colour)
    elsif (/^H (?<column_start>\d+) (?<column_end>\d+) (?<row>\d+) (?<colour>[A-Z]$)/ =~ command) == 0
      colour_row(row.to_i, column_start.to_i, column_end.to_i, colour)
    end
  end

  def create_image(rows,columns)
    image.create_pixels(rows,columns)
  end

  def clear_table
    image.clear_table
  end

  def show_image
    image.show_output
  end

  def colour_pixel(row,column,colour)
    image.colour_pixel(row,column,colour)
  end

  def colour_column(column,row_start,row_end,colour)
    image.colour_column(column,row_start,row_end,colour)
  end

  def colour_row(row,column_start,column_end,colour)
    image.colour_row(row,column_start,column_end,colour)
  end

end
