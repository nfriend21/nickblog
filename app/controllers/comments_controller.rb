class CommentsController < ApplicationController

  def new
  end

  def create
  	@article = Article.find(params[:article_id])
  	@comment = @article.comments.new(params[:comment])
  	@comment.user_id = current_user.id

  	if @comment.save
  	  flash[:success] = "Your comment has been posted."
  	  redirect_to @article
  	else
  	end
  end

  def destroy
  	@article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = "The comment has been deleted!"
    redirect_to @article
  end

end