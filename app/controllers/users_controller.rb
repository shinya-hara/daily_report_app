class UsersController < ApplicationController
  def show
    user = current_user || User.new
    @user = User.find_by(username: params[:username])
    if user == @user
      @reports = @user.reports.page(params[:page]).per(10).order(date: :desc)
    else
      @reports = @user.reports.page(params[:page]).per(10).where(private: false).order(date: :desc)
    end
  end
end
