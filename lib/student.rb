class Student

  attr_accessor :name, :grade
  attr_reader :id
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

    def initialize(name, grade, id = nil)
      @name, @grade, @id = name, grade, id
    end

    def save
      DB[:conn].execute("INSERT INTO students (name, grade) VALUES (?, ?)", [@name, @grade])
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
    end

    def self.create_table
      DB[:conn].execute("CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, grade INTEGER);")
    end

    def self.create(name, grade, id=nil)
      self.new(name, grade, id).tap {|student| student.save}
    end

    def self.drop_table
      DB[:conn].execute("DROP TABLE students;")
    end

end
