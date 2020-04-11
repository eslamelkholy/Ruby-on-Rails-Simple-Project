class ArticlesController < ApplicationController
  
  # Article Crud Operations
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # We've Created this object in Addition To Handle The Error Msg's
    @article = Article.new
  end  
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  # Private Method For Article Validation (DRY Principle)
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
