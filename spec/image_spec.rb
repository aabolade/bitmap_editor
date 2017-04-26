require 'image'

describe Image do
  let(:width) {4}
  let(:height) {3}
  let(:image) {described_class.new}
  let(:pixel_image) {[["O","O","O","O"],["O","O","O","O"],["O","O","O","O"]]}
  let(:coloured_image) {[["O","O","A","O"],["O","O","O","O"],["O","O","O","O"]]}
  let(:coloured_row_image) {[["O","Z","Z","Z"],["O","O","O","O"],["O","O","O","O"]]}
  let(:coloured_column_image) {[["O","P","O","O"],["O","P","O","O"],["O","P","O","O"]]}

  before do
    image.create_pixels(height: height,width: width)
  end

  describe "creating pixels" do

    it "making a two dimension array" do
      expect(image.pixels).to eq pixel_image
    end

    it "size matches the image height" do
      expect(image.pixels.count).to eq height
    end

    it "size matches the image width" do
      expect(image.pixels.first.count).to eq width
    end

    it "removes the previous image" do
      image.create_pixels(height: 2, width: 2)
      expect(image.pixels).to eq [["O","O"],["O","O"]]
    end

  end

  describe "colouring a pixel" do

    it "inserts colour into the 2D array" do
        image.colour_pixel(row: 1,column: 3,colour: "A")
        expect(image.pixels).to eq coloured_image
    end

    it "throws an error when chosen co-ordinate is out of range" do
      expect{image.colour_pixel(row: 10, column: 10, colour: "A")}.to raise_error "this co-ordinate is not available, please select another"
    end

    it "throws an error if row is not an integer" do
      expect{image.colour_pixel(row: 1.2, column: 4, colour: "A")}.to raise_error "row must be an integer"
    end

    it "throws an error if column is not an integer" do
      expect{image.colour_pixel(row: 2, column: 4.3, colour: "A")}.to raise_error "column must be an integer"
    end
  end

  describe "drawing a horizontal segment" do
    it "changes the coulour of pixels between two points along a row" do
      image.colour_row(row:1, start_column: 2,end_column: 4,colour: "Z")
      expect(image.pixels).to eq coloured_row_image
    end
  end

  describe "drawing a vertical segment" do
    it "changes the coulour of pixels between two points along a column" do
      image.colour_column(column: 2,row_start: 1,row_end: 3,colour: "P")
      expect(image.pixels).to eq coloured_column_image
    end
  end

  describe "clearing the table" do
    it "resets all the pixels to white (O)" do
      image.colour_pixel(row: 2,column: 3,colour: "A")
      image.colour_row(row: 1,start_column: 1,end_column: 3,colour: "P")
      image.clear_table
      expect(image.pixels).to eq pixel_image
    end
  end

  describe "creating string output" do
    it "has a method to return 2D pixel array as a string" do
      image.pixels = [["O","Z","A","Z"],["O","O","G","O"],["O","F","F","O"]]
      expect(image.show_output).to eq "OZAZ\nOOGO\nOFFO"
    end

    it "returns error method if pixels array is empty" do
      image.pixels = []
      expect(image.show_output).to eq "There is no image to display"
    end
  end
 end
