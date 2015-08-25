require('spec_helper')

describe(Question) do
  it("belongs to a survey") do
    survey = Survey.create({:title => "survey", :topic => "survey topic"})
    question = Question.create({:description => "question 1", :survey_id => survey.id})
    expect(question.survey()).to(eq(survey))
  end
end
