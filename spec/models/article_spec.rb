require 'rails_helper'

RSpec.describe Article, type: :model do

    let!(:article) {Article.new}

    context 'Validations' do
        it '1. Is not valid without name' do
            article.body = 'Sample body'
            article.name = nil

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_h.keys).to include(:name)
        end

        it '2. is not valid without body' do
            article.name = 'Sample name'
            article.body = nil

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_h.keys).to include(:body)
        end

        it '3. body has a minimum of 20 characters' do
            article.name = 'Sample name'
            article.body = ''

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_h.keys).to include(:body)
        end
    end
end