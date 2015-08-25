class CreateTopicTable < ActiveRecord::Migration
  def change
    create_table(:topics) do |t|
      t.column(:name, :string)
      t.timestamps()
    end
  end
end
