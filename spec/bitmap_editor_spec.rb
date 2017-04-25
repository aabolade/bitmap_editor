require 'bitmap_editor'

describe BitmapEditor do

  let(:editor) {described_class.new}
  let(:create_command) {"I 2 4"}

  it "I M N creates a new image" do
    expect(Image).to receive(:new).with(2,4)
    editor.parse_command(create_command)
  end

end
