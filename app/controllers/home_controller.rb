class HomeController < ApplicationController
  def show
    @users = User.all
    @relations = Relationpoll.all

    if current_user
      @user = User.where(name: current_user.name).last
      @users = User.where.not(id: current_user)
      @relations = Relationpoll.where(user: current_user.uid)
    end
    
    if params[:get]
      if params[:get][:category]
       respues = params[:get][:category]
       if Poll.where(name: "trolling",id_facebook: current_user.uid ).blank?
       poll = Poll.create(name: "trolling", reply: respues, id_facebook: current_user.uid)
        if poll.save
          flash[:success] = "poll save"
          @user.active_votes -= 1
          @user.save
        else
          flash[:success] = "Error"
        end
      else
        flash[:success] = "already answered NOT SAVE"
      end

      end
       if params[:get][:poll]
          respues = params[:get][:poll]
          #quito mi voto
          b = current_user
          b.active_votes -= 1
          b.save
          
          #aumento tu voto
          a = User.find(respues)
          a.active_votes += 1

          if a.save
             flash[:success] = "vote delegate"
             if Relationpoll.where(user: b.uid, donator: a.uid).blank?
                m = Relationpoll.create(user: b.uid, donator: a.uid)
                m.save
            end

          else
            flash[:success] = "Error"
          end

       end
    end

  end
end
