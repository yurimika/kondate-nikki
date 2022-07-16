# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    before_action :reject_user, only: [:create]

  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to public_user_path(current_user), notice: 'guestuserでログインしました。'
  end

# 退会しているかを判断
  protected

  def reject_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if (@user.valid_password?(params[:user][:password]) && (@user.is_deleted) == true)
        flash[:notice] = "利用停止中です。"
        redirect_to new_user_session_path
      end
    else
        flash[:notice] = "項目を入力してください"
    end
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
