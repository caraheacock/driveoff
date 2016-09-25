class UserSessionsController < ApplicationController
  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(:root, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out')
  end
end