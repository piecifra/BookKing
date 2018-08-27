json.extract! desidered_book, :id, :nome, :autore, :genere, :anno, :ISBN, :user_id, :created_at, :updated_at
json.url desidered_book_url(desidered_book, format: :json)
