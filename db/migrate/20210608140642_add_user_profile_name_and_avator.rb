class AddUserProfileNameAndAvator < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :avator, :string
  end
end
