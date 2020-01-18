class SessionsController < ApplicationController
  def new
  end

  def create  
    @name_str = params[:user][:name] 
    @user = User.find_by(name: @name_str)  
    @auth =  @user.authenticate(params[:user][:password]) 
  
      if @auth
        session[:user_id] = @user.id 
      else  
        flash[:error] = "Invalid Password"
      redirect_to sessions_new_path 
      end
  end
end
