class UsersController < ApplicationController

    def new  
        @user = User.new
    end 

    def create 
        
       @match =  params[:user][:password] == params[:user][:password_confirmation] 
        if @match 
            @user = User.new(safe_params) 
            if @user.valid? 
                @user.save
                session[:user_id] = @user.id
            else 
                flash[:error] = 'password and password confirmation do not match' 
            end
        else 
            flash[:error] = 'password and password confirmation do not match'
           
        end  
        
        redirect_to @match ? user_path(@user) : new_user_path
    end 

    def show  
        
        @user = User.find(params[:id])
    end

private 

    def safe_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
