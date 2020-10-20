class ThreadMessage < ApplicationRecord
  has_many :thread_messages
  belongs_to :project_thread
  validates(:message, presence: true)
end
