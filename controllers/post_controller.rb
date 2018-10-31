class PostController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), "..")

  set :view, Proc.new { File.join(root, "views") }

  configure:development do
    register Sinatra::Reloader
  end
# PUT SPECIFIC ID'S BEFORE THE GENERAL ONES !! I.E /NEW, /
  get "/" do
    @title_for_the_page = "Books"
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

# show page
  # initial
  get "/:id_from_URL" do
    id = params[:id_from_URL].to_i
    @book = Book.find id
    erb :'posts/show'
  end
  # editing the page
  get "/:id_from_URL/edit" do
    id = params[:id_from_URL].to_i
    @book = Book.find id
    erb :'posts/edit'
  end

  put '/:id' do
    id = params[:id].to_i
    book = Book.find id
    book.title = params[:title]
    book.author = params[:author]
    book.description = params[:description]
    book.save
    redirect '/'
  end

  delete '/:id' do
    id = params[:id].to_i
    Book.remove id
    redirect '/'
  end 

end
