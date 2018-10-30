class PostController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), "..")

  set :view, Proc.new { File.join(root, "views") }

  configure:development do
    register Sinatra::Reloader
  end

  get "/" do
    @title_for_the_page = "Title"
    @posts = Post.all
    erb :'posts/index'
  end
end
