class Project < ApplicationRecord
  validates(:name, presence: true)
  validates(:description, presence: true)
  validates_uniqueness_of(:name)

  has_many :tasks
  belongs_to :user
end
