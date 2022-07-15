class Admin::CommentsController < ApplicationController
  def destroy
    Comment.find(params[:id]).destroy
    @menu = Menu.find(params[:menu_id])
  end
end
