class UsersController < ApplicationController

  #following functions are all self-explained

  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
  	@user = User.find(params[:id])
    # @projects = Project.find_all_by_user_id(@user.id)
    @projects = @user.projects
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user]) #not the final implementation!
    if @user.save
      flash[:success] = "Welcome to PET!"
      sign_in(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/id
  # DELETE /users/id.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
