class AddActiveuserToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :activeuser, :string
  end
end
