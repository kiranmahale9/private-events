class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url
    end
  end

  def create
    if logged_in?
      redirect_to root_url
    else
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		redirect_to user
  	else
  		flash.now[:danger] = 'Invalid email or password combination'
  		render 'new'
  	end
  end	
  end


  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end