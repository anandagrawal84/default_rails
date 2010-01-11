class SessionManagerController < ApplicationController
  def index
    redirect_to :controller => 'books' if session['logged_in']    
    @user = User.new
  end

  def login
    user = User.new(params[:user])
    if (user.valid_user?)
      session['logged_in'] = true
      redirect_to :controller => 'books', :action => :index
      return
    end
    
    flash["invalid_credentials"] = "Invalid credentials"
    redirect_to :controller => 'session_manager'
  end

  def logout
    session.clear
    flash["invalid_credentials"] = "Logged out"    
    redirect_to :controller => 'session_manager'
  end
end
