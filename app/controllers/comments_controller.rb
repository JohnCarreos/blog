class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_article
    before_action :correct_user, only: %i[ edit update destroy ]

    def index
        @comments = @article.comments
    end

    def new
        @comment = @article.comments.build
    end

    def create
        @comment = @article.comments.build(comment_params)
        if @comment.save
            redirect_to article_comment_path(@article.id, @comment.id)
        else
            render :new
        end
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to article_comment_path(@article.id, @comment.id)
        else
            render :edit
        end
    end

    def destroy
        @comment.destroy
        # redirect_to @article
        redirect_to article_path(@article.id)
    end

    def correct_user
        @comment = current_user.comments.find_by(id: params[:id]) 
        redirect_to articles_path, notice: "Not Authorized To Edit This Comment" if @comment.nil?
    end

    private

    def get_article
        @article = Article.find(params[:article_id])
    end

    def comment_params
        params.require(:comment).permit(:body, :article_id, :user_id)
    end  
end

