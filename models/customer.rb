require_relative ('../db/sql_runner')

class Customer

  attr_reader :id 
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

# Create
  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

# Read
  def self.all()
    sql = "SELECT * FROM customers;"
    customers = SqlRunner.run(sql)
    result = Customer.map { |film| Customers.new(film)}
    return result
  end

  def self.map_items(sql)
    customers = SqlRunner.run(sql)
    items = customers.map { |customer| Customers.new (customer) }
    return items
  end

  def self.map_item(sql)
   customer = Customers.map_items(sql).first
   return customer
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = #{id};"
    return Film.map_items(sql)
  end

# Update
  def update()
    sql = "UPDATE customers SET name = '#{@name}',
    funds = #{@funds} WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

# Delete
def delete
  sql = "DELETE FROM customers WHERE id = #{@id};"
  SqlRunner.run(sql)
end

def self.delete_all()
  sql = "DELETE FROM customers;"
  SqlRunner.run(sql)
end


end