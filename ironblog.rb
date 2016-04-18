require 'pry'
class Blog
  def initialize
    @container = []
  end

  def publish_front_page
    puts "=" * 20
    puts "IronBlog"
    puts "=" * 20
    puts "\n\n"
    post_sorting
    #puts @container.inspect
    #binding.pry
    @container.each do |post|
      puts post.title
      puts "*" * post.title.size
      puts post.text
      puts "-" * 50
    end
  end

  def post_sorting
    @container = @container.sort {|post1, post2| post1.date <=> post2.date}
  end

  def add_post(post)
    @container << post
  end
end

class Post
  attr_accessor(:title, :date, :text)
  def initialize(title, date, text)
    @title = title
    @date = date
    @text = text
  end
end

blog1 = Blog.new
post2 = Post.new("Hello World", Time.new(2016,4,3), "Hello World, this is the second post")
post1 = Post.new("Hola Mundo", Time.new(2016,4,7), "Hola mundo este es el primer post")

blog1.add_post(post1)
blog1.add_post(post2)
blog1.publish_front_page
