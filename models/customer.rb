require_relative ('../db/sql_runner')

class Customer

  attr_reader :id 
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

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

 def film()
  sql = "SELECT * FROM customers WHERE id = #{@film_id};"
   return Film.map_item(sql)
 end

  def update()
    sql = "UPDATE customers SET name = '#{@name}',
    funds = #{@funds} WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM customers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

def self.delete_all()
  sql = "DELETE FROM customers;"
  SqlRunner.run(sql)
end

end