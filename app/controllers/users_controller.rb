class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    @reports = @user.reports.order(date: :desc)
  end
end
