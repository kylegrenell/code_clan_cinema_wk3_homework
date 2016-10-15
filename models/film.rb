require_relative ("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

def initialize(options)
  @id = options['id'].to_i
  @title = options['title']
  @price = options['price'].to_i
end

def save()
  sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING *;"
  films = SqlRunner.run(sql).first
  @id = films['id'].to_i
end

def self.all()
  sql = "SELECT * FROM films;"
  films = SqlRunner.run(sql)
  result = films.map { |films| Film.new(films)}
  return result
end

 def self.map_items(sql)
  films = SqlRunner.run(sql)
  result = films.map { |film| Film.new (film) }
   return result
 end

 def self.map_item(sql)
   film = Film.map_items(sql).first
   return film
 end

 def customer()
   sql = "SELECT * FROM customers WHERE id = #{@customer_id};"
   return Customer.map_item(sql)
 end

 def update()
  sql = "UPDATE films SET title = '#{@title}', price = #{@price} WHERE id = #{id};"
  SqlRunner.run(sql)
 end

 def delete()
   sql = "DELETE FROM films WHERE id = #{@id};"
   SqlRunner.run(sql)
 end

def self.delete_all()
  sql = "DELETE FROM films;"
  SqlRunner.run(sql)
end

end

