class CommentsController < ApplicationController
    before_action :get_article, only: [:edit, :update, :create, :destroy]
    before_action :get_comment, only: [:edit, :update, :destroy]

    def create
        @comment = @article.comments.create(comment_params)
        @comment.commenter = current_user.email
        @comment.user_id = current_user.id
        @comment.save
        redirect_to article_path(@article)
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
    
    def get_article
        @article = Article.find(params[:article_id])
    end

    def get_comment
        @comment = @article.comments.find(params[:id])
    end
end
