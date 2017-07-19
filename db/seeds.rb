require_relative('../models/student.rb')
require_relative('../models/house.rb')

Student.delete_all
House.delete_all

house1 = House.new({'name' => "Hufflepuff"})
house1.save

house2 = House.new({'name' => "Ravenclaw"})
house2.save

house3 = House.new({'name' => "Gryffindor"})
house3.save

house4 = House.new({'name' => "Slytherin"})
house4.save

student1 = Student.new( {
  'first_name' => 'Harry',
  'last_name' => 'Potter',
  'age' => '11',
  'house_id' => house3.id
  } )
student1.save

student2 = Student.new( {
  'first_name' => 'Cedric',
  'last_name' => 'Diggory',
  'age' => '17',
  'house_id' => house1.id
  } )
student2.save

student3 = Student.new( {
  'first_name' => 'Luna',
  'last_name' => 'Lovegood',
  'age' => '11',
  'house_id' => house2.id
  } )
student3.save

student3 = Student.new( {
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'age' => '11',
  'house_id' => house4.id
  } )
student3.save

# student1.age = 12
# student1.update
# p student1
# student1.delete
# p Student.find(23)
# p House.all

# puts student1.house
# p house1.students