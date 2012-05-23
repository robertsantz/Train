class Admin::ArticlesController < Admin::ApplicationController
  before_filter :require_admin_login

  def new
    @article = Article.new   
  end

  def create
    @article= Article.new(params[:article])
    if @article.save
      flash[:notice] = "Article successfully saved"
      redirect_to :action => :index
    else
      flash.now[:notice] = "Article failed to saved"
      render :action => :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update
     @article = Article.find(params[:id])
   if @article.update_attributes(params[:article])
     redirect_to admin_articles_path, :notice => 'Article was successfully updated.'
   else
     flash[:error] = 'Article was failed to update.'
     render :action => 'edit'
   end
  end

  def destroy
    Article.destroy(params[:id])
    redirect_to admin_articles_path, :notice => 'Article was successfully deleted'
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
  end

end
