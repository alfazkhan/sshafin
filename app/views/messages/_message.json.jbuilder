json.extract! message, :id, :name, :email, :phone, :message, :created_at, :updated_at
json.url message_url(message, format: :json)
