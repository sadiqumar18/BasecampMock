class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user_id, uniqueness: {message: "User is already part of the project"}
end
