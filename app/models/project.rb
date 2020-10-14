class Project < ApplicationRecord
  has_many :tasks
  has_many :project_threads
  has_many :attachments
  belongs_to :user
  validates(:name, presence: true)
  validates(:description, presence: true)
  validates_uniqueness_of(:name)

  def day
    self.created_at.strftime("%b %e, %y")
  end
end
