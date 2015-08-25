require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('sinatra/activerecord')
require("./lib/question")
require("./lib/survey")
require("pg")


get('/') do
  erb(:index)
end

get('/survey') do
  @surveys = Survey.all()
  erb(:survey_dash)
end
