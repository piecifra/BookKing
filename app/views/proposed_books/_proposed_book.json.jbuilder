json.extract! proposed_book, :id, :nome, :autore, :genere, :stato, :anno, :ISBN, :user_id, :created_at, :updated_at
json.url proposed_book_url(proposed_book, format: :json)
