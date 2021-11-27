require 'rails_helper'

RSpec.describe Category, type: :model do
    let!(:category) {Category.new}

    context 'Validations' do

        it 'Is valid with name' do
            category.name = 'John'
            expect(category).to be_valid
        end

        it 'Is not valid without name' do
            category.name = ''
            expect(category).to_not be_valid
            expect(category.errors).to be_present
            expect(category.errors.to_h.keys).to include(:name)
        end

        it 'Is at least 3 characters long' do
            category.name = 'J'
            expect(category).to_not be_valid

            category.name = 'abc'
            expect(category).to be_valid
        end
    end
    
    it 'updates the name' do
        category.name = "Name"
        category.update(name: "Sample Updated Name")
        expect(category.name).to eq("Sample Updated Name")
    end
end

