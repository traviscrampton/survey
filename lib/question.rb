class Question < ActiveRecord::Base
  has_many(:answers)
  belongs_to(:survey)
  validates(:description, :presence => true)
end
