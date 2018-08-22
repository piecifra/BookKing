class AddAnnoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :annonascita, :int
  end
end
