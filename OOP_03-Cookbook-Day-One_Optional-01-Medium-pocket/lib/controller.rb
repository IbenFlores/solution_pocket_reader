require_relative 'view'
require_relative 'post'
require 'nokogiri'
require 'open-uri'

class Controller
  BASE_URL = "https://dev.to/"

  def initialize(repo)
    @repo = repo
    @view = View.new
  end

  def list
    posts = @repo.all
    @view.display(posts)
  end

  def create
    path = @view.ask_user("path")
    file = open("#{BASE_URL}#{path}").read
    doc = Nokogiri::HTML(file)
    title = doc.search("h1").first.text.strip
    paragraphs = doc.search("#article-body p")
    content = paragraphs.map(&:text).join("\n\n")
    author = doc.search(".crayons-article__subheader a").text.strip
    post = Post.new(path, title, content, author, "false")
    @repo.add_post(post)
    list
  end

  def show
    list
    index = @view.ask_user("index").to_i - 1
    post = @repo.find(index)
    @view.display_post(post)
  end

  def mark_as_read
    list
    index = @view.ask_user("index").to_i - 1
    @repo.read_post(index)
    list
  end
end