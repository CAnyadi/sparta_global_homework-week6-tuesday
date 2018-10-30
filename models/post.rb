class Book

  attr_accessor :title, :author, :description,:id

  def self.open_connection
    conn =PG.connect(dbname: "books", user: "postgres", password: "Acad3my1")
  end

#CONN = Connect
  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM books ORDER BY id"
    results = conn.exec(sql)

    posts = results.map do |tuple|
        self.hydrate tuple
    end
    return posts
  end

  def self.hydrate book_data
  book = Book.new
  book.title = book_data['title']
  book.author = book_data['author']
  book.description = book_data['description']
  book.id = book_data['id']
  return book
  end

end
