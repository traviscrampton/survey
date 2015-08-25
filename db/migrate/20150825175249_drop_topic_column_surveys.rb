class DropTopicColumnSurveys < ActiveRecord::Migration
  def change
    remove_column(:surveys, :topic, :string)
    add_column(:surveys, :topic_id, :integer)
  end
end
