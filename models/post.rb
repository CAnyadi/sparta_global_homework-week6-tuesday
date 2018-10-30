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
# for editing pages
  def self.find id
  # connecting to the database
    conn = self.open_connection
    sql = "SELECT * FROM books WHERE id = #{id}"
    result = conn.exec(sql)

    book = self.hydrate result[0]
    return book
  end
# for creating pages
  def self.hydrate book_data
  book = Book.new
  book.title = book_data['title']
  book.author = book_data['author']
  book.description = book_data['description']
  book.id = book_data['id']
  return book
  end

  # save function for creating a new page
  def save
    conn = Book.open_connection
    if (!self.id)
      sql = "INSERT INTO books (title,author,description) VALUES ('#{self.title}', '#{self.author}', '#{self.description}')"
    else
      sql = "UPDATE books SET title = '#{self.title}', author = '#{self.author}', description = '#{self.description}' WHERE id = '#{self.id}'"
    end
    conn.exec(sql)
  end

end
