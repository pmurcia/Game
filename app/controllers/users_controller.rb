class UsersController < ApplicationController

  def index
    # In order to show the users, picks up all users
  	@users = User.all
  end

  def show
    # Depending on the id of the route, shows an user
  	@user = User.find params[:id]
  end

  def new
    # Form for a new user
  	@user = User.new
  end

  def create
    # Creates a new user
  	@user = User.create user_params

    # If it is succesfully saved
    if @user.save
  	  redirect_to action: 'index', controller: 'users'
  	else
  	  render 'new'
  	end
  end

  def edit
    # Form for editing an existing user
    @user = User.find(params[:id])
  end

  def update
    # Updates the info of the user
    @user = User.find(params[:id])

    # If it is saved successfully
    if @user.save
      redirect_to action: 'index', controller: 'users'
    else
      render 'edit'
    end
  end

  def destroy
    # Deletes a user
  end

  private

  def user_params
    # Params required for the user, no more params
    params.require(:user).permit(:username, :password, :confirm_password)
  end
end
