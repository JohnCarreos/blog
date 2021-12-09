require "rails_helper"

RSpec.describe "As a User, I want to edit a task to update task's details", type: :feature do
    before do
        sign_in create(:user)
    end

    before :each do
        category = Category.create!(name: "Work")
        task = Task.create!(category_id: category.id, name: "Manufacturing", body: "Buy materials", task_date: Date.today)
        visit edit_category_task_path(category.id, task.id)
    end

    it "successfully updates an article" do
        fill_in "Name", with: "Personal"
        fill_in "Body", with: "Read manga"
        fill_in 'task[task_date]', with: Date.today

        click_on "Update Task"

        expect(page).to have_text("Personal")
        expect(page).to have_text("Read manga")
        expect(page).to have_text("Showing selected task")
    end

    it "not successful in updating an article" do
        fill_in "Name", with: ""
        fill_in "Body", with: ""
        
        click_on "Update Task"

        expect(page).to have_text("Name")
        expect(page).to have_text("Body")
        expect(page).to have_text("Edit a Task")
    end
end