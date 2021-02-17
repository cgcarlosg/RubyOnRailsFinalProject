require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { User.create(username: 'Carlos') }

  describe 'Category #update' do
    before(:example) do
      session[:user_id] = user.id
      @category = user.categories.create(name: 'Clothes', icon: 'bell')
    end

    context 'it redirects to categories#index when successful' do
      it 'redirects to the categories index page' do
        patch :update, params: { id: @category.id, category: { name: 'Phone', icon: 'bell' } }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'it render to edit template when unsuccessful' do
      it 'render new template' do
        patch :update, params: { id: @category.id, category: { name: '', icon: 'bell' } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'category #index' do
    before(:example) do
      session[:user_id] = user.id
    end
    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'category #show' do
    before(:example) do
      session[:user_id] = user.id
    end
    it 'renders show template' do
      @category = user.categories.create(name: 'Pars', icon: 'bell')
      get :show, params: { id: @category.id }
      expect(response).to render_template(:show)
    end
  end
end
