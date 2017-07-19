require('sinatra')
require('sinatra/contrib/all') if development?
also_reload( './models/*.rb') if development?
require_relative('./models/house.rb')
require_relative('./models/student.rb')

get '/students' do
  @result = Students.all
  erb(:index)
end