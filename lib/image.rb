class Image

  attr_reader :width, :height
  attr_accessor :pixels

  def initialize(width, height)
    @width = width
    @height = height
    @pixels = []
  end

  def create_pixels
    height.times {
      row = []
      width.times {row << "O"}
      pixels << row }
  end

  def colour_pixel(row,column,colour)
    check_errors(row,column)
    pixels[row-1][column-1] = colour
  end

  def colour_row(row,start_column,end_column,colour)
    (start_column..end_column).each {|x| colour_pixel(row,x,colour) }
  end

  private

  def check_errors(row,column)
    raise "row must be an integer" if  !row.is_a? Integer
    raise "column must be an integer" if !column.is_a? Integer
    raise "this co-ordinate is not available, please select another" if row > pixels.count || column > pixels.first.count
  end

end
