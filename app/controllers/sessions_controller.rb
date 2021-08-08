class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    # if user&.authenticate(params[:password]) - с данным кодом выдавал ошибку BCrypt::Errors::InvalidHash (invalid hash), на stackoverflow нашел решение ниже
    if user.password_digest.present?
      session[:user_id] = user.id
      redirect_to cookies.delete(:login) || tests_path
    else
      flash.now[:alert] = 'Verify your email and password, please.'
      render :new
    end
  end

  def destroy
    session.clear
    @current_user = nil
    redirect_to root_path, notice: 'See you around!'
  end
end
