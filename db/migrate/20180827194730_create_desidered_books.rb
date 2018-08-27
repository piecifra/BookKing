class CreateDesideredBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :desidered_books do |t|
      t.string :nome
      t.string :autore
      t.string :genere
      t.integer :anno
      t.integer :ISBN
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
