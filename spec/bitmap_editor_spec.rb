require 'bitmap_editor'

describe BitmapEditor do

  let(:editor) {described_class.new}
  let(:create_command) {"I 2 4"}
  let(:clear_command) {"C"}
  let(:colour_command) {"L 2 3 J"}
  let(:vertical_segment_command) {"V 1 2 3 R"}
  let(:horizontal_segment_command) {"H 1 4 2 U"}
  let(:show_command) {"S"}

  describe "Parsing commands" do

    it "I M N calls the create image method" do
      expect(editor.image).to receive(:create_pixels).with(height: 4,width: 2)
      editor.parse_command(create_command)
    end

    it "C calls the clear table method" do
      expect(editor.image).to receive(:clear_table)
      editor.parse_command(clear_command)
    end

    it "L X Y C calls the colour pixel method" do
      expect(editor.image).to receive(:colour_pixel).with(row: 3,column: 2,colour: "J")
      editor.parse_command(colour_command)
    end

    it "V X Y1 Y2 C calls the colour column method" do
      expect(editor.image).to receive(:colour_column).with(column: 1,row_start: 2,row_end: 3,colour: "R")
      editor.parse_command(vertical_segment_command)
    end

    it "H X1 X2 Y C calls the colour row method" do
      expect(editor.image).to receive(:colour_row).with(row: 2,start_column: 1,end_column: 4,colour: "U")
      editor.parse_command(horizontal_segment_command)
    end

    it "S calls the show output method" do
      expect(editor.image).to receive(:show_output)
      editor.parse_command(show_command)
    end
  end

end
