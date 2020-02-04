class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to mypage_path, flash: {
        notice: "ログインに成功しました。"
      }
    else
      redirect_to root_path, flash: {
        notice: "ログインに失敗しました。"
      }
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, flash: {
      notice: "ログアウトしました。"
    }
  end
end
