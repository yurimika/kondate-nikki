class Public::SearchesController < ApplicationController

   def search
    if params[:word].present?
      @menus = Menu.looks(params[:word])
      @word = params[:word]
    elsif params[:tag_id].present?
      @menus = Tag.find(params[:tag_id]).menus
    else
      @menus = Menu.all
    end
   end
end
