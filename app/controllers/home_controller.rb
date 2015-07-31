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
          @user.active_votes = 0
          @user.save
          @relations.each do |relacion|
            if relacion.user == current_user.uid
               poll = Poll.create(name: "trolling", reply: respues, id_facebook: current_user.uid)
               pol.save

            end
          end
        else
          flash[:success] = "Error"
        end
      else
        flash[:success] = "already answered NOT SAVE"
      end

      end
       if params[:get][:poll]
          respues = params[:get][:poll]
          b = current_user
          a = User.find(respues)
           if Relationpoll.where(user: b.uid, donator: a.uid).blank?
            #quito mi voto
            b.active_votes -= 1
            b.save
            #aumento tu voto
            a.active_votes += 1
            if a.save
               flash[:success] = "vote delegate"
                  m = Relationpoll.create(user: b.uid, donator: a.uid, used: false)
                  m.save
             
            else
              flash[:success] = "Error"
            end
        end
       end
    end

  end
end
