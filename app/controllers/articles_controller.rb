class ArticlesController < ApplicationController

  def new
  	@user = current_user.id
    @article = Article.new
    @article.tags.build
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id

    if @article.save
      tags = @article.tags.first.name.split(',')
      @article.tags.destroy_all
           
      tags.each do |tag|
        new_tag = Tag.find_or_create_by_name(tag.lstrip)
        @article.tag_ids = @article.tag_ids << new_tag.id
      end

      flash[:success] = "Your article has been created successfully!"
      redirect_to articles_path
    else
      flash[:error] = "Not quite buddy!"
      render 'new'
    end
  end

  def edit
  	@article = Article.find(params[:id])
    tag_string = @article.tags.collect { |tag| tag.name }.join(',')
    #@article.tags = @article.tags.delete

    #@article.tags.build(:name => tag_string)

  end

  def update
  	@article = Article.find(params[:id])
   
    if @article.update_attributes(params[:article])
      tags = @article.tags.first.name.split(',')
      @article.tags.destroy_all
           
      tags.each do |tag|
        new_tag = Tag.find_or_create_by_name(tag.lstrip)
        @article.tag_ids = @article.tag_ids << new_tag.id
      end

       flash[:success] = "Your article has been updated!"
     	 redirect_to @article
     else
       flash[:error] = "Not quite buddy!" 
       render 'edit'
     end
  end

  def index
  	@read_articles = Article.where(:read => true).order('position')
    @unread_articles = Article.where(:read => false).order('position')
  end

  def show
  	@article = Article.find(params[:id])
  	@comments = @article.comments
  	@comment = @article.comments.new
  end

  def update_articles
    read_article = params[:read]
    params[:article].each_with_index do |id, index|
      Article.update_all({read: (read_article == "true" ? true : false), position: index+1}, {id: id})
    end
    render nothing: true
  end

end