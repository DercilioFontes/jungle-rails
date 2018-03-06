class SessionsController < ApplicationController
  
  if user = User.authenticate_with_credentials(params[:email], params[:password])
    session[:user_id] = user.id
    redirect_to "/"
  else
    redirect_to new_session_path
  end

  # def create
  #   user = User.find_by_email(params[:email])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to "/"
  #   else
  #     redirect_to new_session_path
  #   end
  # end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
  
end
