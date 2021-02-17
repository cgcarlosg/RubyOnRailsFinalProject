class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show update]
  before_action :correct_user, only: [:update]
  before_action :authenticate_user, only: %i[index show new edit create update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, notice: 'User Created'
    else
      render 'new', notice: 'User already created, Log in'
    end
  end

  def update; end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
