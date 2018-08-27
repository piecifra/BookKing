class CreateProposedBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :proposed_books do |t|
      t.string :nome
      t.string :autore
      t.string :genere
      t.string :stato
      t.integer :anno
      t.integer :ISBN
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
