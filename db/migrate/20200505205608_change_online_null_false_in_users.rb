class ChangeOnlineNullFalseInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :online, :boolean, null: false
  end
end
