require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it "returns the index page" do
      get categories_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /categories" do
    it 'creates a new category' do
      expect do
        post categories_path, params: { category: {name: "Music"} }
      end.to change(Category, :count).by(1)
    end
  end

  describe "GET /new" do
    it "returns the new page" do
      get new_category_path
      expect(response).to have_http_status(200)
    end
  end
  
  describe "GET /edit" do
    it "returns the edit page" do
      get edit_category_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "returns the show page" 
  end

  describe "PUT /update" do
    it "updates name"
  end

  describe "PATCH /update" do
    it "updates name"
  end
end
