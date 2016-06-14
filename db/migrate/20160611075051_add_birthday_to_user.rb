class AddBirthdayToUser < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :Date
  end
end
