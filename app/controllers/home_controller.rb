class HomeController < ApplicationController
  def show
    if current_user
      @user = User.where(name: current_user.name).last
    end
    @users = User.all
  end
end
