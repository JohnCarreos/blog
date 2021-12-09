require 'rails_helper'

RSpec.describe "Tasks", type: :request do
    before :each do
        sign_in create(:user)
    end

    describe "GET tasks#show" do
        it "returns task page" do
            task = Task.first
            get category_task_path(task.category_id, task.id)

            expect(response).to have_http_status(:success)
        end
    end

    describe "GET tasks#index" do
        it "returns all tasks" do
            category = Category.first
            get category_tasks_path(category.id)
            expect(response).to have_http_status(:success)
        end
    end

    describe "POST tasks#create" do
        it 'creates a new task' do
            category = Category.first
            expect do
                post category_tasks_path(category.id), params: { task: {category_id: category.id, name: "Manufacturing", body: "Buy materials", task_date: Date.today} }
            end.to change(Task, :count).by(1)
        end
    end

    describe "GET tasks#destroy" do
        it "returns the new page" do
            task = Task.first
            expect do
                get delete category_task_path(task.category_id, task.id), params: { task: {category_id: category.id, name: task.name, body: task.body, task_date: task.task_date} }
            end
        end
    end

    describe "GET tasks#new" do
        category = Category.first
        it "returns the new task" do
            get new_category_task_path(category.id)

            expect(response).to have_http_status(:success)
        end
    end
    
    describe "GET tasks#edit" do
        task = Task.first
        it "returns the edit page" do
            get edit_category_task_path(task.category_id, task.id)

            expect(response).to have_http_status(:success)
        end
    end
end
