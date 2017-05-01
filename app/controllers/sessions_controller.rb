class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
        # pulls the user out of the database
      if user && user.authenticate(params[:session][:password])
        # log the user in and redirect to the user's show page
        # if user with that email exists & password is right
          log_in user
          redirect_to user
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
  end
end

  def destroy
    log_out
    redirect_to root_url 
  end
end
