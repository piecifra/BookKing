class AddIndirizzoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :indirizzo, :string
  end
end
