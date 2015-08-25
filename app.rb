require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('sinatra/activerecord')
require("./lib/question")
require("./lib/survey")
require("./lib/topic")
require("pg")


get('/') do
  erb(:index)
end

get('/topics') do
  @topics = Topic.all()
  erb(:survey_dash)
end
