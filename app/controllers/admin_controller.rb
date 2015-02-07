class AdminController < ApplicationController

  def show

    @entries = Entry.all

    @user = User.find_by(id: session[:user_id])
    if @user && @user.admin_status == "t"
        render :show
    else
        redirect_to '/login'
    end
  end

end
