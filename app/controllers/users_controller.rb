class UsersController < ApplicationController
# before_action :set_user, only: %i[ show edit update destroy ]
  before_action :logged_in_user, only: [:show, :update]
  before_action :correct_user,   only: [:update]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        flash[:success] = 'User Created'
        redirect_to login_path
      else
        flash[:info] = 'User Creation failed'
        render 'new'
      end
  end
  

  # PATCH/PUT /users/1 or /users/1.json
  def update
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
