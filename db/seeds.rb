require_relative("../models/students")

student1 = Student.new({
  "first_name" => "Hadsan",
  "last_name" => "Geele",
  "house" => "Gryffindor",
  "age" => 18
  })

  student1.save()

  student2 = Student.new({
    "first_name" => "Raymond",
    "last_name" => "Yau",
    "house" => "Slytherin",
    "age" => 18
    })
    student2.save()
