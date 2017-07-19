require_relative('../db/sql_runner.rb')

  
class Student

  attr_reader(:id, :first_name, :last_name, :age)
  attr_accessor()

  def initialize(details)
    @id = details['id'].to_i
    @first_name = details['first_name']
    @last_name = details['last_name']
    @age = details['age'].to_i
    @house_id = details['house_id'].to_i
  end

  def save()
      sql = "INSERT INTO students 
      (first_name, last_name, age, house_id) 
      VALUES 
      ($1, $2, $3, $4)
      RETURNING id;"
      values = [@first_name, @last_name, @age, @house_id]
      student = SqlRunner.run(sql, values)
      @id = student[0]['id'].to_i
    end

    def update()
      sql = "UPDATE students 
      SET
      first_name = $1,
      last_name = $2,
      age = $3,
      house_id = $4
      WHERE id = $5;"
      values = [@first_name, @last_name, @age, @house_id, @id]
      SqlRunner.run( sql, values )
    end

    def delete()
      sql = "DELETE FROM students WHERE id = $1;"
      values = [@id]
      SqlRunner.run( sql, values)
    end

    def house
      sql = "SELECT houses.* FROM houses
             INNER JOIN students
             ON house_id = houses.id
             WHERE $1 = students.id;"
      values = [@id]
      result = House.map_items(sql, values)[0]
      return result.name
    end

    def self.all()
      sql = "SELECT * FROM students;"
      values = nil
      result = self.map_items(sql, values)
      return result
    end

    def self.find(id)
      sql = "SELECT * FROM students WHERE id = $1;"
      values = [id]
      result = self.map_items(sql, values).first
      return result
    end

    def self.map_items(sql, values)
      students = SqlRunner.run( sql, values )
      result = students.map { |student| Student.new( student ) }
      return result
    end

    def self.delete_all
      sql = "DELETE FROM students;"
      values = nil
      SqlRunner.run(sql, values)
    end

end