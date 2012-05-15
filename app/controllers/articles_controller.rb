class ArticlesController < ApplicationController

  def new
    @article = Article.new
    
  end

  def create
    @article= Article.new(params[:article])
    if @article.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
     @article = Article.find(params[:id])
     if @article.update_attributes(params[:article])
     redirect_to articles_path, :notice => 'Article was successfully updated.'
   else
     flash[:error] = 'Article was failed to update.'
     render :action => 'edit'
   end
  end

  def index
    @articles = Article.all
  end

  def destroy
    Article.destroy(params[:id])
    redirect_to articles_path, :notice => 'Article was successfully deleted'
  end

end
