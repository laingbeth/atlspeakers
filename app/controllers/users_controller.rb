class UsersController < ApplicationController
  def new
  end

  def create
    @user - User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "signed up"
    else
      render :new 
    end 
  end
  
end
