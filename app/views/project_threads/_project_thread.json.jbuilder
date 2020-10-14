json.extract! project_thread, :id, :project_id, :owner_id, :thread_title, :created_at, :updated_at
json.url project_thread_url(project_thread, format: :json)
