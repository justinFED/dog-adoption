class AdoptionRequest < ActiveRecord::Migration[7.1]
  def change
    create_table :adoption_requests do |t|
      t.integer :user_id
      t.integer :dog_id
      t.text :adoption_essay
      t.boolean :isApproved

      t.timestamps
    end
    add_index :adoption_requests, :user_id
    add_index :adoption_requests, :dog_id
  end
end
