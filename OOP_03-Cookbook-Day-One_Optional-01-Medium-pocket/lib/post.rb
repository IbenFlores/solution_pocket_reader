class Post
  attr_accessor :path, :title, :content, :read, :author
  def initialize(path, title, content, author, read)  # "true" "false"
    @author = author
    @path = path
    @title = title
    @content = content
    @read = read == "true"
  end

  def read?
    @read
  end

  def mark_as_read!
    @read = true
  end
end
