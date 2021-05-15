require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'fares', email: 'fares@gmail.com', password: '000000')
  context 'create user' do
    it 'should return user name' do
      expect(user.name).to eq('fares')
    end

    it 'make sure password correct' do
      expect(user.password).to eq('000000')
    end

    it 'Display email' do
      expect(user.email).to eq('fares@gmail.com')
    end

    it 'user should have pending friend' do
      expect(user.pending_friends).to eq([])
    end

    it 'user dont have friend_requests' do
      expect(user.friend_requests).to eq([])
    end
  end
end
