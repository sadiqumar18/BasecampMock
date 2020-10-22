class ThreadMessage < ApplicationRecord
  has_many :thread_messages
  belongs_to :project_thread
  belongs_to :user
  validates(:message, presence: true)
end
