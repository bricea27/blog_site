class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    @user = User.find_by(id: session[:user_id])
  end

  def show
    @user = User.find_by(id: session[:user_id])
    @entry = Entry.find_by(id: params[:id])
  end

  def new
    @user = User.find_by(id: session[:user_id])
    if @user && @user.admin_status == "t"
      @entry = Entry.new
    else
      redirect_to '/'
    end
  end

  def create
    @entry = Entry.create(entry_params)
    redirect_to @entry
  end

  def edit
    @user = User.find_by(id: session[:user_id])
    if @user && @user.admin_status == "t"
      @entry = Entry.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def update
    @entry = Entry.find_by(id: params[:id])
    @entry.update_attributes(entry_params)
    redirect_to @entry
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    if @user && @user.admin_status == "t"
      @entry = Entry.find_by(id: params[:id])
      @entry.destroy
      redirect_to entries_path
    else
      redirect_to '/'
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:title, :content)
  end

end
