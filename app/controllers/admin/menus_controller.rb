class Admin::MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
    @comments = @menu.comments
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    flash[:alert] = "投稿を削除しました。"
    redirect_to admin_menus_path
  end
end
