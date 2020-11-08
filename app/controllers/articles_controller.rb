class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit]


  def index
    @articles = Article.all.order("created_at DESC")
    @teachers = Teacher.all.order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @article.comments.includes(:user)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      redirect_to article_path(article.id)
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to root_path
  end



  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :image, :category_id).merge(user_id: current_user.id)
  end
end
