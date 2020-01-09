class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    redirect_to root_path
  end

  def index
    @articles = Article
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.includes()
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(article_params)
      redirect_to root_path
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
    end
    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :detail, :image).merge(user_id: current_user.id)
    end

end
