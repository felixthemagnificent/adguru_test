class SetDefaultBalanceInUsers < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :balance, :integer, default: 0
  end
  def down
  end
end
