require 'image'

describe Image do
  let(:width) {4}
  let(:height) {3}
  let(:image) {described_class.new(width, height)}
  let(:pixel_image) {[["O","O","O","O"],["O","O","O","O"],["O","O","O","O"]]}
  let(:coloured_image) {[["O","O","A","O"],["O","O","O","O"],["O","O","O","O"]]}
  let(:coloured_row_image) {[["O","Z","Z","Z"],["O","O","O","O"],["O","O","O","O"]]}
  let(:coloured_column_image) {[["O","Z","Z","Z"],["O","O","O","O"],["O","O","O","O"]]}

  it "has a width" do
    expect(image.width).to eq width
  end

  it "has a height" do
    expect(image.height).to eq height
  end

  it "has an array of pixels" do
    expect(image.pixels).to eq []
  end

  describe "creating pixels" do
    before do
      image.create_pixels
    end

    it "making a two dimension array" do
      expect(image.pixels).to eq pixel_image
    end

    it "size matches the image height" do
      expect(image.pixels.count).to eq height
    end

    it "size matches the image width" do
      expect(image.pixels.first.count).to eq width
    end

  end

  describe "colouring a pixel" do

    before do
      image.create_pixels
    end

    it "inserts colour into the 2D array" do
        image.colour_pixel(1,3,"A")
        expect(image.pixels).to eq coloured_image
    end

    it "throws an error when chosen co-ordinate is out of range" do
      expect{image.colour_pixel(10,10,"A")}.to raise_error "this co-ordinate is not available, please select another"
    end

    it "throws an error if row is not an integer" do
      expect{image.colour_pixel(1.2, 4, "A")}.to raise_error "row must be an integer"
    end

    it "throws an error if column is not an integer" do
      expect{image.colour_pixel(2, 4.3, "A")}.to raise_error "column must be an integer"
    end
  end

  describe "drawing a horizontal segment" do
    before do
      image.create_pixels
    end

    it "changes the coulour of pixels between two points along a row" do
      image.colour_row(1,2,4,"Z")
      expect(image.pixels).to eq coloured_row_image
    end

  end

  describe "drawing a vertical segment" do
    before do
      image.create_pixels
    end

    it "changes the coulour of pixels between two points along a row" do
      image.colour_row(1,2,4,"Z")
      expect(image.pixels).to eq coloured_row_image
    end

  end

end
