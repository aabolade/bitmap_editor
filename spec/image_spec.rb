require 'image'

describe Image do
  let(:width) {3}
  let(:height) {2}
  let(:image) {described_class.new(width, height)}
  let(:pixel_image) {[["O","O","O"],["O","O","O"]]}
  let(:coloured_image) {[["O","O","A"],["O","O","O"]]}

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
    it "inserts colour into the 2D array" do
        image.create_pixels
        p image.colour_pixel(1,3,"A")
        expect(image.pixels).to eq coloured_image
    end
  end
end
