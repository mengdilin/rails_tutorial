class SessionsController < ApplicationController
  def new
  end

  def create
      #find_by email 'params --- '
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          #Log user in and redirect to the user's show page
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_back_or user
      else
          flash.now[:danger] = 'Invalid email / password combo'
          #create error message
          render 'new'
      end
  end
  def destroy
      log_out if logged_in?
      redirect_to root_url
  end
end
