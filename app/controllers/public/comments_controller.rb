class Public::CommentsController < ApplicationController
  def create
     @menu = Menu.find(params[:menu_id])
     @comment = current_user.comments.new(comment_params)
     @comment.menu_id = @menu.id
     @comment.save
    if @comment.save
      render :create #jsファイル
    else
      render :error
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    @menu = Menu.find(params[:menu_id])
  end

   private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
