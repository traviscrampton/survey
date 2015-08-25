class AddTimestampsToSurveys < ActiveRecord::Migration
  def change
    add_column(:surveys, :timestamps, :datetime)
  end
end
