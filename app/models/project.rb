class Project < ApplicationRecord
  validates(:name, presence: true)
  validates(:description, presence: true)
  validates_uniqueness_of(:name)

<<<<<<< HEAD
  has_many :tasks
  belongs_to :user
=======
    validates :name, presence: true
    validates :description, presence: true

    has_many :tasks
    belongs_to :user

    def day
        self.created_at.strftime("%b %e, %y")
    end
>>>>>>> 5d32f3c9a376c44f96e4b094d094a56d9acb09db
end
