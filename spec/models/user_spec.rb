require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is valid with a name' do
      user = User.new(name: 'John Doe')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new
      expect(user).to_not be_valid
    end

    it 'is valid with a non-negative postCounter' do
      user = User.new(name: 'John Doe', postCounter: 2)
      expect(user).to be_valid
    end

    it 'is not valid with a negative postCounter' do
      user = User.new(name: 'John Doe', postCounter: -1)
      expect(user).to_not be_valid
    end
  end
end
