class CreateExchanges < ActiveRecord::Migration[5.1]
  def change
    create_table :exchanges do |t|
      t.references :mittente, foreign_key: false
      t.references :destinatario, foreign_key: false
      t.string :libromittente
      t.string :librodestinatario

      t.timestamps
    end
    add_foreign_key :exchanges, :user, column: :mittente
    add_foreign_key :exchanges, :user, column: :destinatario
  end
end
