class UsersController < ApplicationController
  before_action :find_user_by_id, only: [:edit, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, flash: {
        notice: "会員登録ありがとうございます！"
      }
    else
      redirect_to root_path, flash: {
        error_messages: @user.errors.full_messages
      }
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(update_user_params)
    if @user.save
      redirect_to @user, flash: {
        notice: "会員情報を編集致しました。"
      }
    else
      redirect_to @user, flash: {
        notice: "更新に失敗しました。",
        error_messages: @user.errors.full_messages
      }
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, flash: {
      notice: "会員登録を解除いたしました。"
    }
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:name, :email, :new_profile_picture)
  end

  def find_user_by_id
    @user = User.find(params[:id])
  end
end
