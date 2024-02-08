class AddOccupationToAdoptionRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :adoption_requests, :occupation, :string
  end
end
