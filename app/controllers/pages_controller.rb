class PagesController < ApplicationController

    def home
        
    end

    def profile
        @articles = Article.where(user_id: params[:id])
    end
end