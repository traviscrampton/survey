require('spec_helper')

describe(Survey) do
  it("Has many questions") do
    topic = Topic.create({:name => "topic"})
    survey = Survey.create({:title => "survey", :topic_id => topic.id})
    question1 = Question.create({:description => "question1", :survey_id => survey.id})
    question2 = Question.create({:description => "question2", :survey_id => survey.id})
    expect(survey.questions()).to(eq([question1, question2]))
  end
end

describe(Survey) do
  it("validates presence of title") do
    survey = Survey.new({:title => ''})
    expect(survey.save()).to(eq(false))
  end
end
