class SessionsController < ApplicationController
  def new
  end
  
  def create
    # TODO: authenticate user
      #In `app/controllers/sessions_controller.rb`, authenticate a user:
      # - find user by email.
      @user = User.find_by({"email"=>params["email"]})
      if @user
      # - if no user is found: redirect to `/login` with a `flash` message
      # - if user exists: authenticate (i.e. check) their password
        if BCrypt::Password.new(@user["password"]) == params["password"]
      # - if authentication succeeds: store the user's id in a secure cookie (i.e. `session`)
          session["user_id"] = @user["id"]
      # - if authentication succeeds: redirect to `/posts` with a `flash` message
        flash["notice"] = "Login Successful"  
        redirect_to "/posts"
      # - if authentication fails: redirect to `/login` with a `flash` message
        else
          flash["notice"] = "Incorrect Password"
          redirect_to "/login" 
        end
      else 
        flash["notice"] = "No User Found"
        redirect_to "/login"
      end
  end
    # - In `app/controllers/sessions_controller.rb`, logout a user in the `destroy` action
  def destroy
      session["user_id"] = nil
      redirect_to "/sessions/new"
  end

end