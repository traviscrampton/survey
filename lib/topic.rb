class Topic < ActiveRecord::Base
  has_many(:surveys)
  validates(:name, :presence => true)

  scope(:not_done, -> do
    where({:done => false})
  end)

end
