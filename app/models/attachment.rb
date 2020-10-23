class Attachment < ApplicationRecord
  has_one_attached :file
  belongs_to :project
  belongs_to :user

  validates(:file_name, presence: true)
  validates_uniqueness_of(:file_name)
end
