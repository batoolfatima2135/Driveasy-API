# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


car1 = Car.create(name: "Ferrari", color: "Blue", model: "FR23-A2020", price: 60 )
car1.image.attach(io: File.open(Rails.root.join('app/assets/images/10.jpg')), filename: '10.jpg'); 

car2 = Car.create(name: "Mercedes-Benz", color: "Black", model: "M12-2020", price: 60 )
car2.image.attach(io: File.open(Rails.root.join('app/assets/images/1.jpg')), filename: '1.jpg');

car4 = Car.create(name: "Audi", color: "grey-orange", model: "AOR-2023", price: 65 )
car4.image.attach(io: File.open(Rails.root.join('app/assets/images/3.jpg')), filename: '3.jpg'); 

car8 = Car.create(name: "Lamborghini", color: "White", model: "LAM2-3031", price: 45 )
car8.image.attach(io: File.open(Rails.root.join('app/assets/images/9.jpg')), filename: '9.jpg');

car3 = Car.create(name: "BMW", color: "Grey", model: "RR-2020A", price: 53 )
car3.image.attach(io: File.open(Rails.root.join('app/assets/images/5.jpg')), filename: '5.jpg');

car7 = Car.create(name: "Ford", color: "Yellow", model: "FYL-23202", price: 60 )
car7.image.attach(io: File.open(Rails.root.join('app/assets/images/6.jpg')), filename: '6.jpg');

car5 = Car.create(name: "Range Rover", color: "Grey", model: "RR-2020A", price: 53 )
car5.image.attach(io: File.open(Rails.root.join('app/assets/images/7.jpg')), filename: '7.jpg');


car6 = Car.create(name: "VolksWagen", color: "White", model: "VWA-2023", price: 70 )
car6.image.attach(io: File.open(Rails.root.join('app/assets/images/8.jpg')), filename: '8.jpg');

car9 = Car.create(name: "Tesla", color: "Red", model: "TES-43A-2020", price: 55 )
car9.image.attach(io: File.open(Rails.root.join('app/assets/images/4.jpg')), filename: '4.jpg');

car10 = Car.create(name: "Porshe", color: "Black", model: "P12-AR2021", price: 50 )
car10.image.attach(io: File.open(Rails.root.join('app/assets/images/2.jpg')), filename: '2.jpg');
