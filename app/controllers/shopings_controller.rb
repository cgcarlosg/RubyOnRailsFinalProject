class ShopingsController < ApplicationController
  before_action :set_shoping, only: %i[ show edit update destroy ]

  # GET /shopings or /shopings.json
  def index
    @shopings = Shoping.all
  end

  # GET /shopings/1 or /shopings/1.json
  def show
  end

  # GET /shopings/new
  def new
    @shoping = Shoping.new
  end

  # GET /shopings/1/edit
  def edit
  end

  # POST /shopings or /shopings.json
  def create
    @shoping = Shoping.new(shoping_params)

    respond_to do |format|
      if @shoping.save
        format.html { redirect_to @shoping, notice: "Shoping was successfully created." }
        format.json { render :show, status: :created, location: @shoping }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shoping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopings/1 or /shopings/1.json
  def update
    respond_to do |format|
      if @shoping.update(shoping_params)
        format.html { redirect_to @shoping, notice: "Shoping was successfully updated." }
        format.json { render :show, status: :ok, location: @shoping }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shoping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopings/1 or /shopings/1.json
  def destroy
    @shoping.destroy
    respond_to do |format|
      format.html { redirect_to shopings_url, notice: "Shoping was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoping
      @shoping = Shoping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shoping_params
      params.require(:shoping).permit(:title, :total, :user_id, :category)
    end
end
