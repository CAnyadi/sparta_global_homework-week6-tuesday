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
    @book = Book.new
    erb :"posts/new"
  end

  # post for creating a new page
  post "/" do
    book = Book.new
    book.title = params[:title]
    book.author = params[:author]
    book.description = params[:description]
    book.save
    redirect "/"
  end

end
