class BitmapEditor

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)
    puts output(file)
  end

  def output(file)
    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
          return "There is no image"
      else
          return 'unrecognised command :('
      end
    end
  end
end
