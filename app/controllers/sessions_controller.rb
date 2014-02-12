class SessionsController < ApplicationController
  def new

  end

  #create a session
  def create
      #user can log in with email or name
      user = User.find_by_email(params[:session][:email].downcase)
      if(!user)
        user = User.find_by_name(params[:session][:email].downcase)
      end
      if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_to user
      else
        flash.now[:error] = 'Invalid email/password combination'
        #redirect_to signin_url, notice: 'Invalid email/password combination'
        render 'new'
      end
  end

  #destroy a session
  def destroy
    sign_out
    redirect_to root_path
  end
end
