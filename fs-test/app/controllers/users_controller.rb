class UsersController < ApplicationController
  def new
  end

  def show
  	@motels = Motel.all.where(user: current_user)
  end

  def edit
  end


  def create
	@user = User.new(name:params['name'], email:params['email'], password:params['password'], password_confirmation:params['password_confirmation'])
		if @user.save
		    flash[:notice] = ['User successfully created']
		    redirect_to '/sessions/new'
	  	else
	  		flash[:errors] = @user.errors.full_messages
	  		redirect_to '/users/new'
	  	end
  end
  
  
end
