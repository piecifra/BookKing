class ChangeIsbnToString < ActiveRecord::Migration[5.1]
  def change
  	change_column :desidered_books, :ISBN, :string, :limit => 13
  	change_column :proposed_books, :ISBN, :string, :limit => 13
  	
  end
end
