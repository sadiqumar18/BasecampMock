json.extract! attachment, :id, :project_id, :uploaded_by, :file_name, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)
