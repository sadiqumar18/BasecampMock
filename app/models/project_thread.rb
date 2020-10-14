class ProjectThread < ApplicationRecord
  has_many :thread_messages
  belongs_to :project
end
