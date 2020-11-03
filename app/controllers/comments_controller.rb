class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    article = Article.find(params[:article_id])
    if @comment.save!
    redirect_to article_path(article.id)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    article = Article.find(params[:article_id])
    comment.destroy
    redirect_to article_path(article.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, article_id: params[:article_id])
  end

end
