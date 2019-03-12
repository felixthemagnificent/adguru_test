class AddBlockReasonToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :block_reason, :string
  end
end
