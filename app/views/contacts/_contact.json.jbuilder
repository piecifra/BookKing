json.extract! contact, :id, :comment, :email, :nome, :created_at, :updated_at
json.url contact_url(contact, format: :json)
