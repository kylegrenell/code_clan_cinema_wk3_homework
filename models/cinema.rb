require_relative ('../db/sql_runner')
require_relative('./ticket')

class Cinema

def self.purchase_ticket(customer, film)
  if customer.funds < film.price
    puts "Not enough funds. Please choose another film."
  else
    customer.funds >= film.price
    puts "Enjoy the film!"
    # ticket_data = {
    #   'customer_id' => customer.id,
    #   'film_id' => film.id
    # }
    # ticket = Ticket.new( ticket_data )
    # ticket.save
    # customer.funds -= film.price
    # customer.update
  end
end

