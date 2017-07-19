require_relative('../db/sql_runner.rb')

  
class House

  attr_reader(:id, :name, :logo)

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
    @logo = details['logo']
  end

  def save()
      sql = "INSERT INTO houses 
      (name, logo) 
      VALUES 
      ($1, $2) 
      RETURNING id;"
      values = [@name, @logo]
      house = SqlRunner.run(sql, values)
      @id = house[0]['id'].to_i
    end

    def students
      sql = "SELECT * FROM students
             WHERE house_id = $1;"
      values = [@id]
      result = Student.map_items(sql, values)
      return result
    end

    def self.all()
      sql = "SELECT * FROM houses;"
      values = nil
      result = self.map_items(sql, values)
      return result
    end

    def self.find(id)
      sql = "SELECT * FROM houses WHERE id = $1;"
      values = [@id]
      result = self.map_items(sql, values).first
      return result
    end

    def self.map_items(sql, values)
      houses = SqlRunner.run( sql, values )
      result = houses.map { |house| House.new( house ) }
      return result
    end

    def self.delete_all()
      sql = "DELETE FROM houses;"
      values = nil
      SqlRunner.run(sql, values)
    end



end