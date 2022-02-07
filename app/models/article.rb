class Article < ApplicationRecord
    validates :name, presence: true
    validates :body, presence: true, length: { minimum: 20 }
    
    has_many :comments
    belongs_to :user, optional: true
end
