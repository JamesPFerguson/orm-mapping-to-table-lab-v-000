class Student

  attr_accessor :name, :grade
  attr_reader :id
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

    def initialize(name, grade, id = nil)
      @name, @grade, @id = name, grade, id
    end

    def self.save
    end

    def self.create_table
      DB[:conn].execute("CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT, grade INTEGER);")
    end

    def self.create

    end

    def self.drop_table
    end

end
