module ApplicationHelper

    private

    def show_category_trans(_category)
        if @category.trans.empty?
          content_tag(:h4, class: 'text-center') do
            'No items in this category.'
          end
        else
          render partial: 'categorytrans', collection: @trans, as: :tran
        end
      end
end
