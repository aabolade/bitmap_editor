class BitmapEditor

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

  def parse_command(command)
    /^I (?<rows>\d+) (?<columns>\d+$)/ =~ command
    Image.new(rows.to_i,columns.to_i)
  end
end
