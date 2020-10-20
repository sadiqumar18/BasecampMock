class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user_id, presence: {message: "Please provide a user email"}
end
