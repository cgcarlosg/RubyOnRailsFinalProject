require 'rails_helper'

RSpec.describe Tran, type: :model do
  describe 'tran' do
    it 'Should have a name' do
      expect(Tran.new).to_not be_valid
    end

    it 'To not be valid without total' do
      expect(Tran.new(title: 'carlos', total: '')).to_not be_valid
    end

   
  end
end