class AddFirstNameAndLastNameToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :last_name if column_exists?(:users, :last_name)
    add_column :users, :last_name, :string
<<<<<<< HEAD
    
=======
>>>>>>> main
  end
end
