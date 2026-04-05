class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description

      t.date :deleted_at
      t.timestamps
    end
  end
end
