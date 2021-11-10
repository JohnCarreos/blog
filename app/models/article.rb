class Article < ApplicationRecord
    validates :name, presence: true
    validates :body, presence: true, length: { minimum: 180 }
end
