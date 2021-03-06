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
 customer4 = Customer.new({ 'name' => 'Eddie', 'funds' => 50 })
 customer4.save()


 film1 = Film.new({ 'title' => 'Bad Boys 37', 'price' => 10})
 film1.save()
 film2 = Film.new({ 'title' => 'Bad Boys 42', 'price' => 15})
 film2.save()
 film3 = Film.new({ 'title' => 'Star Wars VIII: Advance Screening', 'price' => 20})
 film3.save()
 film4 = Film.new({ 'title' => 'Super Troopers 2', 'price' => 15})
 film4.save()
 film5 = Film.new({ 'title' => 'Movie Marathon: 3 films in one evening', 'price' => 30})
 film5.save() 
 

 ticket1 = Ticket.new( { 'customer_id' => customer1.id, 'film_id' => film3.id, 'film_time' => "14.25" } )
 ticket1.save()
 ticket2 = Ticket.new( { 'customer_id' => customer2.id, 'film_id' => film1.id, 'film_time' => "17.15" } )
 ticket2.save()
 ticket3 = Ticket.new( { 'customer_id' => customer3.id, 'film_id' => film4.id, 'film_time' => "18.15" } )
 ticket3.save()
 ticket4 = Ticket.new( { 'customer_id' => customer4.id, 'film_id' => film3.id, 'film_time' => "19.30" } )
 ticket4.save()
 #movie marathon ticket
 ticket5 = Ticket.new( { 'customer_id' => customer4.id, 'film_id' => film5.id, 'film_time' => "20.00"  } )
 ticket5.save()


 customer1.delete
 customer2.funds = 50
 customer2.update
 customer3.name = "Miss Lexi Cinemar-Goer"
 customer3.update
 customer1.films() # retruns [ ] as could not afford
 customer2.films() # returns @title="Bad Boys 37"
 customer1.purchase(film1)
 customer2.customer_can_afford(film3)

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







