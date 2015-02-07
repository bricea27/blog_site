class SessionController < ApplicationController
  def new
    render :new
  end

  def create
       user = User.find_by(username: params[:username])

       if user && user.authenticate(params[:password]) && user.admin_status == "t"
           session[:user_id] = user.id
           redirect_to '/admin'

       elsif user && user.authenticate(params[:password]) && user.admin_status == "f"
           session[:user_id] = user.id
           redirect_to '/'

       else
           @error = true
           redirect_to '/login'
       end
   end

  def destroy
       reset_session
       redirect_to '/'
   end

end
