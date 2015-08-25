class Survey < ActiveRecord::Base
  has_many(:questions)
  belongs_to(:topic)

  validates(:title, :presence => true)
  scope(:not_done, -> do
    where({:done => false})
  end)
end
