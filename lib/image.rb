class Image

  attr_reader :width, :height
  attr_accessor :pixels

  def initialize(width, height)
    @width = width
    @height = height
    @pixels = []
  end

  def create_pixels
    row = []
    width.times {row << "O"}
    height.times {pixels << row}
  end

end
