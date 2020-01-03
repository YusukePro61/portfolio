class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
  end

  def index
    @articles = Article.order(DESC)
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.includes()
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def article_params
      params.require(:article).permit(:title, :detail, :image).merge(user_id: current_user.id)
    end

end
