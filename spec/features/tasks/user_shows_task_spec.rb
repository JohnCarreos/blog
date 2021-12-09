require "rails_helper"

RSpec.describe "As a User, I want to view a task to show task's details", type: :feature do
    before do
        sign_in create(:user)
    end
    it "shows task" do
        category = Category.create!(name: "Work")
        task = Task.create!(category_id: category.id, name: "Manufacturing", body: "Buy materials", task_date: Date.today)
        
        visit category_path(category.id)

        click_on("Show")

        expect(page).to have_text("Manufacturing")
        expect(page).to have_text("Buy materials")
        expect(page).to have_text("Showing selected task")
    end
end