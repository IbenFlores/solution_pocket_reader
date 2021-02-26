require 'csv'
require_relative 'post'

class Repository
  def initialize(csv_file)
    @csv_file = csv_file
    @posts = []
    load_csv if File.exist?(csv_file) 
  end

  def all
    @posts
  end

  def add_post(post)
    @posts << post
    save_csv
  end

  def read_post(index)
    @posts[index].mark_as_read!
    save_csv
  end

  def find_post(index)
    @posts[index]
  end
  
  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      path    = row[0]
      title   = row[1]
      content = row[2]
      author  = row[3]
      read    = row[4]
      new_post = Post.new(path, title, content, author, read)
      @posts << new_post
    end
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      @posts.each do |post|
        csv << [post.path, post.title, post.content, post.author, post.read?]
      end
    end
  end
end