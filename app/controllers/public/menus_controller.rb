class Public::MenusController < ApplicationController

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    @menu.save
    redirect_to  public_menus_path
  end

  def index
    @user = current_user
    @menus = @user.menus
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
     if @menu.update(menu_params)
       redirect_to public_menu_path
     else
       render :edit
     end
  end

  def show
    @menu = Menu.find(params[:id])
    @comment = Comment.new
    @comments = @menu.comments
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to public_menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:comment, :image, :menu_name_1, :food_detail_1, :menu_name_2, :food_detail_2, :menu_name_3, :food_detail_3, :menu_name_4, :food_detail_4,
     :menu_name_5, :food_detail_5, :menu_name_6, :food_detail_6, :menu_name_7, :food_detail_7, :menu_name_8, :food_detail_8, :start_time, tag_ids: [])
  end
end
