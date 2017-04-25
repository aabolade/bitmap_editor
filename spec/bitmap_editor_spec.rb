require 'bitmap_editor'

describe BitmapEditor do

  let(:editor) {described_class.new}
  let(:create_command) {"I 2 4"}

  describe "create instruction" do

    it "I M N calls the create image method" do
      expect(editor).to receive(:create_image).with(2,4)
      editor.parse_command(create_command)
    end

  end

end
