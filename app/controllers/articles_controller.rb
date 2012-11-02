class ArticlesController < ApplicationController

  def new
  	@user = current_user.id
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.save
      flash[:success] = "Your article has been created successfully!"
      redirect_to user_articles_path
    else
      flash[:error] = "Not quite buddy!"
      render 'new'
    end
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def update
  	@article = Article.find(params[:id])
  	@article.update_attributes(params[:article])

  	redirect_to @article
  end

  def index
  	@articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
  	@comments = @article.comments
  	@comment = @article.comments.new
  end

end