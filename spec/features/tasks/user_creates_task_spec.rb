require "rails_helper"

RSpec.describe "As a User, I want to create a task for a specific category so that I can organize tasks quicker", type: :feature do
    before do
        sign_in create(:user)
    end

    before :each do
        category = Category.create!(name: "Work")
        visit new_category_task_path(category.id)
    end

    it "successfully creates a new article" do
        fill_in "Name", with: "Meeting"
        fill_in "Body", with: "Plan for Christmas party"
        fill_in 'task[task_date]', with: "2021-12-23"
        
        click_on "Create Task"

        expect(page).to have_text("Showing selected task")
        expect(page).to have_text("Meeting")
        expect(page).to have_text("Plan for Christmas party")
    end

    it "not successful in creating a new article" do
        click_on "Create Task"

        expect(page).to have_text("New Task")
    end
end