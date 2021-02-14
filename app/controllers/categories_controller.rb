class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :icons_array, only: %i[new create edit update]

  # GET /categories or /categories.json
  def index
    @categories = Category.all.includes(:user)
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.create(category_params)

      if @category.save
        redirect_to categories_path, notice: "Category was successfully created."
      else
        render new_category_path, notice: 'An error occurred'
      end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
      if @category.update(category_params)
        redirect_to categories_path, notice: "Category was successfully updated."
      else
        render 'edit', notice: 'An error occurred'
      end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Category was successfully destroyed."
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :icon)
    end

    def icons_array
      @category_array = icons
    end
end
