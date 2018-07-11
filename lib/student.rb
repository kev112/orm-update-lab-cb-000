require_relative "../config/environment.rb"

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = SQL <<-
      id INTEGER PRIMARY KEY
      name STRING
      grade STRING
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute(sql)
  end

  def save
    DB[:conn].execute(sql)
  end

  def self.create
    DB[:conn].execute(sql)
  end

  def self.new_from_db
    DB[:conn].execute(sql)
  end

  def self.find_by_name
    DB[:conn].execute(sql)
  end

  def update
    DB[:conn].execute(sql)
  end


end
