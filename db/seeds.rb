require_relative('../models/student.rb')
require_relative('../models/house.rb')

Student.delete_all
House.delete_all

house1 = House.new({'name' => "Hufflepuff", 'logo' => 'https://vignette1.wikia.nocookie.net/harrypotter/images/6/62/Download_%289%29.jpg/revision/latest?cb=20160729145653'})
house1.save

house2 = House.new({'name' => "Ravenclaw", 'logo' => "https://vignette4.wikia.nocookie.net/harrypotter/images/2/28/Download_%284%29.jpg/revision/latest?cb=20160729145945"})
house2.save

house3 = House.new({'name' => "Gryffindor", 'logo' => 'https://vignette2.wikia.nocookie.net/harrypotter/images/e/ee/Gryffindor_Crest-0.jpg/revision/latest?cb=20160729145529'})
house3.save

house4 = House.new({'name' => "Slytherin", 'logo' => 'https://vignette1.wikia.nocookie.net/harrypotter/images/7/72/Ccd53034-c798-452a-8032-f28e06250d8f.jpg/revision/latest/scale-to-width-down/160?cb=20160729150848'})
house4.save

house5 = House.new({'name' => "Codeclan", 'logo' => 'https://pbs.twimg.com/profile_images/606015765700091905/dv5RE0l9.jpg'})
house5.save

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