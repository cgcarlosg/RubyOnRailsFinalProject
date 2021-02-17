class TransController < ApplicationController
  before_action :set_tran, only: %i[show edit update destroy]

  # GET /trans or /trans.json
  def index
    @trans = current_user.trans.includes(:category).where.not(category_id: nil)
  end

  def nocateg
    @trans_nocateg = current_user.trans.includes(:category).where(category_id: nil)
  end

  # GET /trans/1 or /trans/1.json
  def show; end

  # GET /trans/new
  def new
    @tran = Tran.new
  end

  # GET /trans/1/edit
  def edit; end

  # POST /trans or /trans.json
  def create
    @tran = current_user.trans.create(tran_params)

    if @tran.save
      redirect_to root_path, notice: 'Tran was successfully created.'
    else
      render new_tran_path, notice: 'An error occurred'
    end
  end

  # PATCH/PUT /trans/1 or /trans/1.json
  def update
    if @tran.update(tran_params)
      redirect_to root_path, notice: 'Tran was successfully updated.'
    else
      render 'edit', notice: 'An error occurred'
    end
  end

  # DELETE /trans/1 or /trans/1.json
  def destroy
    @tran.destroy
    redirect_to trans_url, notice: 'Tran was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tran
    @tran = Tran.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tran_params
    params.require(:tran).permit(:title, :total, :category_id)
  end
end
