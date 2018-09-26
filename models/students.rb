require_relative("../db/SqlRunner")
require('pry-byebug')

class Student

  attr_accessor :first_name, :last_name, :house_id, :age
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id']
    @age = options["age"].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, house_id, age)
    VALUES
    (
      $1, $2, $3, $4
      )

      RETURNING id"

      values = [@first_name, @last_name, @house_id, @age]
      student_data = SqlRunner.run(sql,values).first
      @id = student_data["id"].to_i
 # binding.pry
  end

  # def self.all()
  #   sql = "SELECT * FROM students"
  #
  #   students = SqlRunner.run(sql)
  #   result = students.map {|student| Student.new(student)}
  #   return result
  # end

  def update()
    sql = "UPDATE students SET (first_name, last_name, house_id, age) = ($1, $2, $3, $4) WHERE id = $5"

    values = [@first_name, @last_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1"

    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"

    values = [id]
    students = SqlRunner.run(sql, values)
    result = Student.new(students.first)
    return result
  end

  def self.find_all()
    sql = "SELECT * FROM students"

    students = SqlRunner.run(sql)
    all_students = students.map {|student| Student.new(student)}
    return all_students
  end

  def find_house()
    sql = "SELECT * FROM houses WHERE id = $1"

    values = [@house_id]
    result = SqlRunner.run(sql, values).first
    return House.new(result)
  end

  # binding.pry
  # nil

end
