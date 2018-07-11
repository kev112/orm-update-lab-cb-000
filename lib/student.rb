require_relative "../config/environment.rb"

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :id, :name, :grade

  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = SQL <<-
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
      )
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = SQL <<-
      DROP TABLE IF EXISTS students
    SQL
    DB[:conn].execute(sql)
  end

  def self.create(name, grade)
    student = self.new(name, grade)
    student.save
  end

  def self.new_from_db(student)
    self.new(student[0], student[1], student[2])
  end

  def self.find_by_name(name)
    sql = SQL <<-

    SQL
    DB[:conn].execute(sql, name)
  end

  def update
    sql = SQL <<-
      name = ?
      grade = ?
    SQL
    DB[:conn].execute(sql, self.id, self.name, self.grade)
  end

  def save
    if self.id
      self.update
    else
      sql = SQL <<-

      SQL
      row = DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM songs")[0][0]
    end
  end
end
