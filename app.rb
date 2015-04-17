require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :database => "todo"
)

require './models/todo.rb'


get '/' do
  erb :index
end


get '/api/todos' do
  content_type :json
  todos = Todo.all
  todos.to_json
end

get '/api/todo/:id' do
  content_type :json
  todo = Todo.find(params[:id].to_i)
  todo.to_json
end

post '/api/todos' do
  content_type :json
  todo = Todo.create({task: params[:task], complete: params[:complete], due_date: params[:due_date]})
  todo.to_json
end

# put '/api/todo/:id' do
#   content_type :json
#   todo = Todo.update({task: params[:task], complete: params[:complete], due_date: params[:due_date]})
#   todo.to_json
# end

delete '/api/todo/:id' do
  content_type :json
  todo = Todo.delete(params[:id].to_i)
  todo.to_json
end







# CREATE TABLE stuff (id SERIAL PRIMARY KEY, task VARCHAR(255), complete BOOLEAN, due_date TIMESTAMP);
