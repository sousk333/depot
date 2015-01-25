class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: user_params[:name])

    if @user and @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "無効なユーザ/パスワードの組み合わせです"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "ログアウト"
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
