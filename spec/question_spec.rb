require('spec_helper')

describe(Question) do
  it("belongs to a survey") do
    topic = Topic.create({:name => "topic"})
    survey = Survey.create({:title => "survey", :topic_id => topic.id})
    question = Question.create({:description => "question 1", :survey_id => survey.id})
    expect(question.survey()).to(eq(survey))
  end
end

describe(Question) do
  it('Validates the presence of a description') do
    question = Question.new({:description => ''})
    expect(question.save()).to eq(false)
  end
end
