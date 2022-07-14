class Public::LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :menu_params, only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, menu_id: @menu.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, menu_id: @menu.id)
    like.destroy
  end

  private
  def menu_params
    @menu = Menu.find(params[:menu_id])
  end
end
