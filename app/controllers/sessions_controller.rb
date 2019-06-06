class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    respond_to do |format|
      if user 
        session[:user_id] = user.id
        format.html { redirect_to user_path(user), notice: 'You Have Logged In' }
      else 
        format.html { render :new, notice: 'There was something wrong with your login information' }
      end
    end
  end

  def destroy
  respond_to do |format|
    session[:user_id] = nil
    format.html { redirect_to root_path, notice: 'You have logged out' }
    format.json { render :show, status: :created }
  end
  end
end