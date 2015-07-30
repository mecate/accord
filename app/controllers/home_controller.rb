class HomeController < ApplicationController
  def show
    @users = User.all
    if current_user
      @user = User.where(name: current_user.name).last
      #@users = User.where.not(id: current_user)
    end
    
    if params[:get]
      if params[:get][:category]
       respues = params[:get][:category]
       poll = Poll.create(name: "trolling", reply: respues)
        if poll.save
          flash[:success] = "poll save"
          @user.active_votes -= 1
          @user.save
        else
          flash[:success] = "Error"
        end
      end
       if params[:get][:poll]
          respues = params[:get][:poll]
          a = User.find(respues)
          a.active_votes += 1
          if a.save
             flash[:success] = "vote delegate"
          else
            flash[:success] = "Error"
          end
       end
    end

  end
end
