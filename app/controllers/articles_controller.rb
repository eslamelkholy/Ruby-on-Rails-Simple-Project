class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  # Article Crud Operations
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    # We've Created this object in Addition To Handle The Error Msg's
    @article = Article.new
  end  
  
  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  # Private Method For Article Validation (DRY Principle)
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  def set_article
    @article = Article.find(params[:id])
  end
end