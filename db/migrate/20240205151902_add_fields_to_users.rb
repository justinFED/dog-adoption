class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :string
    add_column :users, :contact_details, :string
  end
end
