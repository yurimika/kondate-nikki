class Admin::SearchesController < ApplicationController
  def user_search
    if params[:word].present?
     @users = User.looks(params[:word])
     @word = params[:word]
    else
     @users = User.all
    end
  end
end
