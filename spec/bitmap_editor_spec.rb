require 'bitmap_editor'

describe BitmapEditor do

  let(:editor) {described_class.new}
  let(:show) {"examples/show.txt"}
  let(:unrecognised) {"examples/unrecognised.txt"}

  it "displays a message when there is no image" do
    expect(editor.output(show)).to eq "There is no image"
  end

  it "returns a message for an unrecognised command" do
    expect(editor.output(unrecognised)).to eq "unrecognised command :("
  end

end
