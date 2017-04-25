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
    raise "this co-ordinate is not available, please select another" if row > pixels.count || column > pixels.first.count
    pixels[row-1][column-1] = colour
  end

end
