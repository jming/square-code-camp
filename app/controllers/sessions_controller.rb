class SessionsController < ApplicationController
  def new
    @date = Date.today
    if params[:month]
      @date = @date.change(:month => params[:month].to_i)
    end
    if params[:year]
      @date = @date.change(:year => params[:year].to_i)
    end
    
    @events = Event.where("occurs_at > ?", Date.today)
    @events_all = Event.all
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      new
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
