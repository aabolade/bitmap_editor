class Image

  attr_accessor :pixels

  def initialize
    @pixels = []
  end

  def create_pixels(args)
    args[:height].times {
      row = []
      args[:width].times {row << "O"}
      pixels << row }
  end

  def colour_pixel(args)
    check_errors(args[:row],args[:column])
    pixels[args[:row]-1][args[:column]-1] = args[:colour]
  end

  def colour_row(args)
    (args[:start_column]..args[:end_column]).each {|x| colour_pixel(row: args[:row],column: x,colour: args[:colour]) }
  end

  def colour_column(args)
    (args[:row_start]..args[:row_end]).each {|x| colour_pixel(row: x,column: args[:column],colour: args[:colour])}
  end

  def clear_table
    pixels.map! {|x| x.map! {|y| y = "O"}}
  end

  def show_output
    return "There is no image to display" if pixels.empty?
    pixels.map {|x| x.join("") }.join("\n")
  end

  private

  def check_errors(row,column)
    raise "row must be an integer" if  !row.is_a? Integer
    raise "column must be an integer" if !column.is_a? Integer
    raise "this co-ordinate is not available, please select another" if row > pixels.count || column > pixels.first.count
  end

end
