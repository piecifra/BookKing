class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.references :mittente, foreign_key: false
      t.references :destinatario, foreign_key: false
      t.references :libromittente, foreign_key: false
      t.references :librodestinatario, foreign_key: false

      t.timestamps
    end
    add_foreign_key :proposals, :proposed_book, column: :librodestinatario
    add_foreign_key :proposals, :user, column: :destinatario
    add_foreign_key :proposals, :proposed_book, column: :libromittente
    add_foreign_key :proposals, :user, column: :mittente
  end
end
