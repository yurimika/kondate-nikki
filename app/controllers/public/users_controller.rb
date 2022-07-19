class Public::UsersController < ApplicationController
  before_action :set_user, only: [:likes]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
     if @user.update(user_params)
       redirect_to public_user_path
     else
       render :edit
     end
  end

  def likes
    likes = Like.where(user_id: @user.id).pluck(:menu_id)
    @like_menus = Menu.find(likes)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_guest_user
    @user = User.find(params[:id])
   if @user.name == "guestuser"
      redirect_to public_user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
   end
  end
end
