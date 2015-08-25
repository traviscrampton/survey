class RemoveTimestampsFromSurveys < ActiveRecord::Migration
  def change
    remove_column(:surveys, :timestamps, :datetime)
  end
end
