require_relative ("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id 

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

# Create
  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES (#{@customer_id}, #{@film_id}) RETURNING *;"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end

# Read
  def self.all()
    sql = "SELECT * FROM tickets;"
    return Tickets.map_items(sql)
  end

  def self.map_items(sql)
    tickets = SqlRunner.run(sql)
    result = tickets.map {|ticket| Tickets.new(ticket)}
    return result
  end

  def self.map_item(sql)
    result = Tickets.map_items(sql)
    return result.first
  end

  def customers()
    sql = "SELECT * FROM customers WHERE id = #{@customer_id};"
    return Customer.map_item(sql)
  end

  def films()
    sql = "SELECT * FROM films WHERE id = #{@film_id};"
    return Film.map_item(sql)
  end

# Update
def update
  sql = "UPDATE tickets SET customer_id = '#{@customer_id}', film_id = '#{@film_id}' WHERE id = #{@id};"
  SqlRunner.run(sql)
  return nil
end

# Delete
  def delete()
    sql = "DELETE FROM tickets WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = 'DELETE FROM tickets;'
    SqlRunner.run(sql)
  end  


end