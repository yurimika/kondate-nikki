class Public::SearchesController < ApplicationController

   def search
      @menus = Menu.looks(params[:word])
   end

end
