class TeacherCommentsController < ApplicationController

  def index
    @teacher_comments = Comment.all
  end

  def create
    @teacher_comment = TeacherComment.new(teacher_comment_params)
    article = Article.find(params[:article_id])
    if @teacher_comment.save!
    redirect_to article_path(article.id)
    end
  end

  def destroy
    teacher_comment = TeacherComment.find(params[:id])
    article = Article.find(params[:article_id])
    teacher_comment.destroy
    redirect_to article_path(article.id)
  end

  private

  def teacher_comment_params
    params.require(:teacher_comment).permit(:content).merge(teacher_id: current_teacher.id, article_id: params[:article_id])
  end


end
