class Attachment < ApplicationRecord
  # has_many :thread_messages
  belongs_to :project
  belongs_to :user
end
