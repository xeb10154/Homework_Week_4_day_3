require_relative("../models/students")
require_relative("../models/house")

Student.delete_all
House.delete_all()


house1 = House.new({
"name" => "Gryffindor"
})
house1.save()

house2 = House.new({
"name" => "Slytherin"
})
house2.save()

house3 = House.new({
"name" => "Hufflepuff"
})
house3.save()

house4 = House.new({
"name" => "Ravenclaw"
})
house4.save()

student1 = Student.new({
"first_name" => "Hadsan",
"last_name" => "Geele",
"house_id" => house1.id,
"age" => 18
})
student1.save()

student2 = Student.new({
"first_name" => "Raymond",
"last_name" => "Yau",
"house_id" => house2.id,
"age" => 18
})
student2.save()

House.find_all

House.find(house1.id)

student1.find_house
