class Article < ApplicationRecord
    validates :name, presence: true
    validates :body, presence: true, length: { minimum: 20 }
    
    has_many :comments
end
