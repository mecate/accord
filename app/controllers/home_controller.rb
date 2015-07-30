class HomeController < ApplicationController
  def show
    @user = User.where(name: current_user.name).last
    @users = User.all
  end
end
