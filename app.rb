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
  erb(:topic_dash)
end

post('/topics/new') do
  name = params.fetch("name")
  topic = Topic.new(:name => name)
  topic.save()
  redirect("/topics")
end

patch('/topics/:id') do
  @topics = Topic.all()
  update_name = params.fetch("update_name")
  topic_to_update = Topic.find(params.fetch("id"))
  topic_to_update.update({:name => update_name})
  redirect("/topics")
end

delete('/topics/:id') do
  @topic = Topic.find(params.fetch("id").to_i())
  @topic.delete()
  @topics = Topic.all()
  redirect("/topics")
end

get('/topics/:id') do
  @topic = Topic.find(params.fetch("id").to_i())
  @surveys = Survey.all()
  erb(:survey_dash)
end

post('/surveys/new') do
  title = params.fetch("title")
  survey = Survey.new(:title => title)
  survey.save()
  topic_id = params.fetch("topic_id")
  redirect("/topics/#{topic_id}")
end

patch('/surveys/:id') do
  @surveys = Survey.all()
  update_title = params.fetch("update_title")
  survey_to_update = Survey.find(params.fetch("id"))
  survey_to_update.update({:title => update_title})
  topic_id = params.fetch("topic_id")
  redirect("/topics/#{topic_id}")
end

delete('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  @survey.delete()
  @surveys = Survey.all()
  topic_id = params.fetch("topic_id")
  redirect("/topics/#{topic_id}")
end

get("/surveys/:id") do
  @questions = Question.all()
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:question_add)
end

post('/questions/new') do
  description = params.fetch("description")
  question = Question.new(:description => description)
  question.save()
  survey_id = params.fetch("survey_id")
  redirect("/surveys/#{survey_id}")
end

patch('/questions/:id') do
  @questions = Question.all()
  update_description = params.fetch("update_description")
  question_to_update = Question.find(params.fetch('id'))
  question_to_update.update({:description => update_description})
  survey_id = params.fetch("survey_id")
  redirect("/surveys/#{survey_id}")
end

delete('/questions/:id') do
  @question = Question.find(params.fetch('id').to_i())
  @question.delete()
  @questions = Question.all()
  survey_id = params.fetch("survey_id")
  redirect("/surveys/#{survey_id}")
end
