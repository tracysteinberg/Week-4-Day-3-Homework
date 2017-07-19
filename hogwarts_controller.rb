require('sinatra')
require('sinatra/contrib/all') if development?
also_reload( './models/*.rb') if development?
require_relative('./models/house.rb')
require_relative('./models/student.rb')

get '/students' do
  @result = Student.all
  erb(:index)
end

get '/students/new' do
  @houses = House.all
erb(:new)
end

post '/students' do
 student1 = Student.new(params)
 student1.save
 redirect '/students'
end