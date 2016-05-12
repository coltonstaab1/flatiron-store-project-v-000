class AddNameAndCurrentCartIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_cart_id, :integer
    add_column :users, :name, :string
  end
end
