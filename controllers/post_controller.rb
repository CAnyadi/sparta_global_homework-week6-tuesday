class PostController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), "..")

  set :view, Proc.new { File.join(root, "views") }

  configure:development do
    register Sinatra::Reloader
  end

  get "/" do
    @title_for_the_page = "Title"
    @book = Book.all
    erb :'posts/index'
  end

  get "/new" do
    @book = Post.new
    erb :"posts/new"
  end 



end
