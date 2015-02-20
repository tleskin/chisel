class Chisel

  def take_in_text(text)
    text
  end

  def recognize_hashtag(text)
    this = text.start_with?('#')
  end

  def parse(document)
    document = document.split(/^\n/)
    encapsulate_text(document)
  end

  def encapsulate_text(document)
    document.map do |line|
      if line.start_with?('####')
        line.delete!("####")
        line = "<h4>#{line}</h4>"
      elsif line.start_with?('###')
        line.delete!("###")
        line = "<h3>#{line}</h3>"
      elsif line.start_with?("##")
        line.delete!("##")
        line = "<h2>#{line}</h2>"
      elsif line.start_with?('#')
        line.delete!("#")
        line = "<h1>#{line}</h1>"
      else
        line = "<p>#{line}</p>"
      end
    end
  end

end

chisel = Chisel.new
puts chisel.parse('# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."')
