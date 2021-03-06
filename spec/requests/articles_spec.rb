RSpec.describe "Articles", type: :request do
    describe "GET #index" do
      before do
        sign_in create(:user)
      end
  
      it "returns the index page" do
        get articles_path
        expect(response).to have_http_status(:success)
      end
    end
  end