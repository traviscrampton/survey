class CreateSurveys < ActiveRecord::Migration
  def change
    create_table(:surveys) do |t|
      t.column(:title, :string)
      t.column(:topic, :string)

      t.timestamp()
    end
  end
end
