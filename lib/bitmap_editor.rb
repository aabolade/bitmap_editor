class BitmapEditor

  attr_reader :image

  def initialize(image = Image)
    @image = image.new
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)
    puts output(file)
  end

  def output(file)
    File.open(file).each do |line|
      line = line.chomp
      parse_command(line)
    end
  end

  def create_image(rows,columns)
  end

  def parse_command(command)
    if (/^I (?<rows>\d+) (?<columns>\d+$)/ =~ command) == 0
      create_image(rows.to_i,columns.to_i)
    end
  end
end
