class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new
    render :action => :new
  end
  
  def edit
  end

  def update
  end

  def index
    @article = Article.all
  end

  def destroy
  end

end
