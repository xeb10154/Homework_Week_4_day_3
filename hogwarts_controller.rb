require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("./models/students")
require_relative("./models/house")
also_reload("./models/*")

get "/students" do
  @students = Student.find_all()
  erb(:index)
end

get '/students/new' do
@house = House.find_all
# binding.pry
erb(:new)
end

get "/students/:id" do
  @student = Student.find(params[:id])
  erb(:show)
end

#edit existing student
get "/students/:id/edit" do
  @student = Student.find(params[:id])
  erb(:edit)
end

#new
post '/students' do
 @student = Student.new(params)
 @student.save()
 erb(:create)
end

#update
post "/students/:id" do
 order = Student.new(params)
 order.update()
 redirect to "/students"
end

# destroy or DELETE
post '/students/:id/delete' do
   student = Student.find(params[:id])
  student.delete()

redirect to "/students"
end
