class HomeController < ApplicationController
  def show
    @users = User.all
    if current_user
      @user = User.where(name: current_user.name).last
      @users = User.where.not(id: current_user)
    end
    
    if params[:get]
       respues = params[:get][:category]
       poll = Poll.create(name: "trolling", reply: respues)
        if poll.save
          flash[:success] = "poll save"
          a = @user.active_votes -= 1
          @user.save
        else
          flash[:success] = "Error"
        end
    end

  end
end
