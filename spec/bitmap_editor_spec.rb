require 'bitmap_editor'

describe BitmapEditor do

  let(:editor) {described_class.new}
  let(:create_command) {"I 2 4"}
  let(:clear_command) {"C"}

  describe "create instruction" do

    it "I M N calls the create image method" do
      expect(editor).to receive(:create_image).with(2,4)
      editor.parse_command(create_command)
    end

    it "create image calls method on image" do
      expect(editor.image).to receive(:create_pixels).with(2,4)
      editor.create_image(2,4)
    end
  end

  describe "clear instruction" do
    it "C clears the table" do
      expect(editor).to receive(:clear_table)
      editor.parse_command(clear_command)
    end

    it "clear table calls method on image" do
      expect(editor.image).to receive(:clear_table)
      editor.clear_table
    end
  end

end
