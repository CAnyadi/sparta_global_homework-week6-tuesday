class Post

  attr_accessor :title, :author, :description

  def self.open_connection
    conn =PG.connect(dbname: "books", user: "postgres", password: "Acad3my1")
  end

#CONN = Connect
  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM books ORDER BY id"
    results = conn.exec(sql)
  end
end
