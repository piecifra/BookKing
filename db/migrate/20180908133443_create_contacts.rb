class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.text :comment
      t.string :email
      t.string :nome

      t.timestamps
    end
  end
end
