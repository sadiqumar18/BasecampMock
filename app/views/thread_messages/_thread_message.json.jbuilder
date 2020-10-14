json.extract! thread_message, :id, :thread_id, :message, :created_at, :updated_at
json.url thread_message_url(thread_message, format: :json)
