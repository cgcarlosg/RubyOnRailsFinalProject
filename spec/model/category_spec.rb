require 'rails_helper'

RSpec.describe Category, type: :model do
    let(:user) { User.create(username: 'carlos') }
    describe 'validation' do
      it 'Should have a name' do
        expect(Category.new).to_not be_valid
      end

      it 'Should have a valid name and user' do
        expect(Category.new(name: 'categoryone', icon: 'bell', user_id: user.id)).to be_valid
      end

      it 'Name can not be empty' do
        expect(Category.new(name: '', icon: 'bell', user_id: user.id)).to_not be_valid
      end
    end
end