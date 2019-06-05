class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][email].downcase)
    respond_to do |format|
      if user & user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        format.html { redirect_to user_path(user), notice: 'You Have Logged In' }
      else 
        format.html { render :new, notice: 'There was something wrong with your login information' }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    format.html { redirect_to root_path, notice: 'You have logged out' }
  end
end