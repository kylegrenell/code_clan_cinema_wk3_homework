require_relative ('models/film')
require_relative ('models/customer')
require_relative ('models/ticket')
require ('pry-byebug')

Film.delete_all()
Ticket.delete_all()
Customer.delete_all()

            # class initialize   hash key and values

 customer1 = Customer.new({ 'name' => 'Jerome', 'funds' => 10 })
 customer1.save()
 customer2 = Customer.new({ 'name' => 'Otis', 'funds' => 15 })
 customer2.save()
 customer3 = Customer.new({ 'name' => 'Lexi', 'funds' => 30 })
 customer3.save()

 film1 = Film.new({ 'title' => 'Bad Boys 37', 'price' => 10})
 film1.save()
 film2 = Film.new({ 'title' => 'Bad Boys 42', 'price' => 15})
 film2.save()
 film3 = Film.new({ 'title' => 'Star Wars VIII: Advance Screening', 'price' => 20})
 film3.save()
 
 ticket1 = Ticket.new( { 'customer_id' => customer1.id, 'film_id' => film3.id } )
 ticket1.save()
 ticket2 = Ticket.new( { 'customer_id' => customer2.id, 'film_id' => film1.id } )
 ticket2.save()
 ticket3 = Ticket.new( { 'customer_id' => customer3.id, 'film_id' => film2.id } )
 ticket3.save()

 customer1.delete
 customer2.funds = 50
 customer2.update
 customer3.name = "Miss Lexi Cinemar-Goer"
 customer3.update
 customer1.films() # retruns [ ] as could not afford
 customer2.films() # returns @title="Bad Boys 37"


 film3.title = "Star Wars VIII: Advance screening 3D"
 film3.update
 film2.price = 20
 film2.update


 ticket1.films # returns @id=6, @price=20, @title="Star Wars VIII: Advance screening 3D"
 ticket2.id
 ticket3.delete

# In psql SELECT * FROM customers/films/tickets; to see updated tables.

 binding.pry
 nil







