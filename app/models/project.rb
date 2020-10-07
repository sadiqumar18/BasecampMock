class Project < ApplicationRecord

    validates :name, presence: true
    validates :description, presence: true

    has_many :tasks
    belongs_to :user

    def day
        self.created_at.strftime("%b %e, %y")
    end
end
