require 'image'

describe Image do
  let(:width) {double("width")}
  let(:height) {double("height")}
  let(:image) {described_class.new(width, height)}

  it "has a width" do
    expect(image.width).to eq width
  end

  it "has a height" do
    expect(image.height).to eq height
  end

end
