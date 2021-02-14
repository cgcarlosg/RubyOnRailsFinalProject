class TranCategoriesController < ApplicationController

    def new
      @tran = Tran.find(params[:tran_id])
    end

    def create
        TranCategory.create(tran_id: params[:tran_id], category_id: params[:tran_category][:category_id])
        redirect_to tran_categories_path
    end
end