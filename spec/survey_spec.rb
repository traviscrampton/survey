require('spec_helper')

describe(Survey) do
  it("Has many questions") do
    survey = Survey.create({:title => "survey", :topic => "survey topic"})
    question1 = Question.create({:description => "question1", :survey_id => survey.id})
    question2 = Question.create({:description => "question2", :survey_id => survey.id})
    expect(survey.questions()).to(eq([question1, question2]))
  end
end
