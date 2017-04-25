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
    pixels[row-1][column-1] = colour
  end

end
