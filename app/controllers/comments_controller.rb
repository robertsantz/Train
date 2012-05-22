class CommentsController < ApplicationController
  def create
    @comment= Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
        @comments = Article.find(@comment.article_id).comments
        format.html { redirect_to article_path(@comment.article_id), :notice => 'Comment was successfully created.' }
        format.js
      end
    end
  end

end
