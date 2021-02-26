class View
  def display(posts)
    posts.each_with_index do |post, index|
      puts "#{index + 1} - #{post.read? ? "[X]" : "[ ]"} #{post.title} - (#{post.author})"
    end  
  end

  def ask_user(string)
    puts "what is the #{string}"
    return gets.chomp
  end

  def display_post(post)
    puts "#{post.title}(#{post.author})"
    puts "#{post.content}"
  end
end