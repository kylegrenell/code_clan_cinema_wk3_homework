require_relative ("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

# Create
def save()
  sql = "INSERT INTO films (title, price) VALUES ('#{@title}', #{@price}) RETURNING *;"
  films = SqlRunner.run(sql).first
  @id = films['id'].to_i
end

# read
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

def customers()
  sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE film_id = #{id};"
  return Customer.map_items(sql)
end

#update
def update()
  sql = "UPDATE films SET title = '#{@title}', price = #{@price} WHERE id = #{id};"
  SqlRunner.run(sql)
end

# delete
def delete()
 sql = "DELETE FROM films WHERE id = #{@id};"
 SqlRunner.run(sql)
end

def self.delete_all()
  sql = "DELETE FROM films;"
  SqlRunner.run(sql)
end

end
