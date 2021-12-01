class Task < ApplicationRecord
    validates :name, presence: true
    validates :body, presence: true
    
    belongs_to :categories
end
