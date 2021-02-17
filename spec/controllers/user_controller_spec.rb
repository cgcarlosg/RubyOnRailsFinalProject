require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'User #create' do
    context 'it does no redirects to users#edit when successful' do
      it 'redirects to the login page' do
        post :create, params: { user: { username: 'Carlos' } }
        expect(response).not_to redirect_to(root_path(User.find_by(username: 'Carlos')))
      end
    end
  end
end
