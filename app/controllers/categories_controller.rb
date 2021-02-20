class CategoriesController < ApplicationController
  before_action :icons_array, only: %i[new create edit update]

  def index
    @categories = Category.all.includes(:user)
  end

  def show
    @category = Category.find_by(id: params[:id])
    @trans = Tran.includes(:category, :user).where(category_id: @category.id)
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = current_user.categories.create(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render new_category_path, notice: 'An error occurred'
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was successfully updated.'
    else
      render 'edit', notice: 'An error occurred'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def icons_array
    @category_array = icons
  end
end
