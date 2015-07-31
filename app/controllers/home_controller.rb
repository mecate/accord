class HomeController < ApplicationController
  def show
    @users = User.all
    @relations = Relationpoll.all

    if current_user
      @user = User.where(name: current_user.name).last
      @users = User.where.not(id: current_user)
      @relations = Relationpoll.where(user: current_user.uid)
    end
    
      if params[:get]#1
      if params[:get][:category]#2
       respues = params[:get][:category]
       if Poll.where(name: "trolling", id_facebook: current_user.uid ).blank?#3
          poll = Poll.create(name: "trolling", reply: respues, id_facebook: current_user.uid)
        if poll.save#4
          flash[:success] = "poll save"
          @user.active_votes = 0
          @user.save
        
          @relations.each do |relacion| #5
           
            if relacion.user == current_user.uid  #6
               poll = Poll.create(name: "trolling", reply: respues, id_facebook: current_user.uid)
               pol.save 
            end #6

          end#5

        else#4
          flash[:success] = "Error Save pol"
        end#4

      else#3
        flash[:success] = "already answered NOT SAVE"
      end#3
      end#2

       if params[:get][:poll]#7
          respues = params[:get][:poll]
          b = current_user
          a = User.find(respues)
           if Relationpoll.where(user: b.uid, donator: a.uid).blank?#8
            #quito mi voto
            b.active_votes -= 1
            b.save
            #aumento tu voto
            a.active_votes += 1
            if a.save#9
               flash[:success] = "vote delegate"
                  m = Relationpoll.create(user: b.uid, donator: a.uid, used: false)
                  m.save
             
            else#9
              flash[:success] = "Error"
            end#9
       end#8
    end#7
end#1
  end#show
end
