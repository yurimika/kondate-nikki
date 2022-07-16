class Public::HomesController < ApplicationController
  def top
    @menus = Menu.all
    @menus = Menu.all.order(created_at: :desc).limit(5)
    @ranks = Menu.find(Like.group(:menu_id).where(created_at: Time.current.all_week).order('count(menu_id) desc').pluck(:menu_id))
  end


end
