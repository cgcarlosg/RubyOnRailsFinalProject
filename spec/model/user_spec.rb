require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests' do
    subject { User.new }

    it 'valid with username' do
      subject.username = 'carlos'
      expect(subject).to be_valid
    end

    it 'not valid without username' do
      subject.username = ''
      expect(subject).to_not be_valid
    end

    it 'adds a new User' do
      count = User.count
      subject.update!(username: 'carlos')
      expect(User.count).to eq(count + 1)
    end
  end

  context 'Custom Validation tests' do
    subject { User.new }

    it 'not valid if username already exists' do
      User.create(username: 'carlos')
      subject.username = 'carlos'
      expect(subject).to_not be_valid
    end
  end
end