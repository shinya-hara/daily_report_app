class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @reports = @user.reports.page(params[:page]).per(10).order(date: :desc)
  end
end
