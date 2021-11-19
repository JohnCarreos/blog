require 'rails_helper'

RSpec.describe Category, type: :model do
    let!(:category) {Category.new}

    context 'Validations' do
        it '1. Is not valid without name' do
            category.name = ''
            expect(category).to_not be_valid
            expect(category.errors).to be_present
            expect(category.errors.to_h.keys).to include(:name)
        end
    end
end

