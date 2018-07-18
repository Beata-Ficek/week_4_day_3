require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/hogwarts' do
  @students = Student.all()
  erb(:index)
end

# new
get '/hogwarts/new' do
  erb(:new)
end

# create
post '/hogwarts' do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

# show
get '/hogwarts/:id' do
  @student = Student.find(params['id'])
  erb(:show)
end

# edit
get '/hogwarts/:id/edit' do
  # @house_names = ['gryffindor', 'hufflepuff', 'ravenclaw', 'slytherin']
  @houses = House.all()
  @student = Student.find(params['id'])
  erb(:edit)
end

# update
post '/hogwarts/:id' do
  student = Student.new(params)
  student.update
  redirect to "hogwarts/" + params['id']
end

# destroy
post '/hogwarts/:id/delete' do
  @student = Student.find(params['id'])
  @student.delete()
  redirect to "hogwarts"
end
