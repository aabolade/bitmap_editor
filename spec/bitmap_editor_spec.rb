require 'bitmap_editor'

describe BitmapEditor do

  let(:editor) {described_class.new}
  let(:show) {"examples/show.txt"}
  it "displays a message when there is no image" do
    expect(editor.output(show)).to eq "There is no image"
  end

end
