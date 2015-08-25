require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require('sinatra/activerecord')
require("./lib/question")
require("./lib/survey")
require("./lib/topic")
require("./lib/answer")
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
  topic = Topic.create({:name => name})
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
  topic_id = params.fetch("topic_id")
  survey = Survey.create({:title => title, :topic_id => topic_id})
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
  survey_id = params.fetch("survey_id")
  question = Question.create({:description => description, :survey_id => survey_id})
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

get('/taker') do
  @topics = Topic.all()
  erb(:taker_topics)
end

get('/taker/topic/:id') do
  @topic = Topic.find(params.fetch("id").to_i())
  erb(:taker_topic_selection)
end

get('/taker/topic/:id/survey/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:taker_survey_selection)
end

post('/survey/take') do
  survey_id = params.fetch("survey_id").to_i()
  survey = Survey.find(survey_id)

  survey.questions.each do |question|
  response = params.fetch("response")
  question_id = params.fetch("question_id")
  new_answer = Answer.create({:response => response, :question_id => question_id})
  end
  erb(:thanks)
end
