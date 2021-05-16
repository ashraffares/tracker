require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(username: 'fares', email: 'fares@gmail.com', password: '000000')
  context 'create user' do
    it 'should return user name' do
      expect(user.username).to eq('fares')
    end
    it 'make sure password correct' do
      expect(user.password).to eq('000000')
    end
    it 'display email' do
      expect(user.email).to eq('fares@gmail.com')
    end
    it 'validate_uniqueness_of username' do
      expect { should validate_uniqueness_of(user.username) }
    end
    it 'validate_presence_of username' do
      expect { should validate_presence_of(user.username) }
    end
  end

  describe 'association' do
    it 'has_many groups' do
      expect { should has_many(groups) }
    end
    it 'has_many items' do
      expect { should has_many(items) }
    end
    it 'has_one_attached avatar' do
      expect { should has_one_attached(avatar) }
    end
  end

  describe 'user validation' do
  end
end
