class Dogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.string :breed
      t.string :picture
      t.integer :age
      t.string :gender
      t.text :oth_details
      t.boolean :isActive
      t.timestamps # Adds created_at and updated_at columns
    end
  end
end
