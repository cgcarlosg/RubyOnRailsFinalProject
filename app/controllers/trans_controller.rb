class TransController < ApplicationController
  before_action :set_tran, only: %i[show edit update destroy]

  def index
    @trans = current_user.trans.includes(:category).where.not(category_id: nil)
  end

  def nocateg
    @trans_nocateg = current_user.trans.includes(:category).where(category_id: nil)
  end

  def show; end

  def new
    @tran = Tran.new
  end

  def edit; end

  def create
    @tran = current_user.trans.create(tran_params)

    if @tran.save
      redirect_to root_path, notice: 'Tran was successfully created.'
    else
      render new_tran_path, notice: 'An error occurred'
    end
  end

  def update
    if @tran.update(tran_params)
      redirect_to root_path, notice: 'Tran was successfully updated.'
    else
      render 'edit', notice: 'An error occurred'
    end
  end

  def destroy
    @tran.destroy
    redirect_to trans_url, notice: 'Tran was successfully destroyed.'
  end

  private

  def set_tran
    @tran = Tran.find(params[:id])
  end

  def tran_params
    params.require(:tran).permit(:title, :total, :category_id)
  end
end
