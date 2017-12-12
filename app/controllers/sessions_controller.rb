class SessionsController < ApplicationController

  def create
    user = User.find_or_create_from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path, notice: 'Вы успешно авторизировались'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Вы вышли из своей учетной записи'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
