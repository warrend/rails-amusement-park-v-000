class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def show
    authorize
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render :new
		end
  end 

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(user_params)
  #     redirect_to user_path(@user)
  #   else
  #     redirect_to root_path
  #   end
  # end 

  private 

	  def user_params
	  	params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
		end 

end