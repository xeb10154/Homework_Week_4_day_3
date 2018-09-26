require_relative("../db/SqlRunner")
require('pry-byebug')

class House

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options["id"] if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO houses (name) Values ($1)
    RETURNING id"

    values = [@name]
    house_id = SqlRunner.run(sql, values).first
    @id = house_id["id"].to_i
  end


  def self.find_all
    sql = "SELECT * FROM houses"
    houses_hash = SqlRunner.run(sql)
    all_houses = houses_hash.map {|house| House.new(house)}
    # binding.pry
    return all_houses
  end


  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"

    values = [id]
    result = SqlRunner.run(sql, values).first
    # binding.pry
    return House.new(result)
  end

  def self.delete_all
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

end
