require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'new group' do
    user = User.new(id: 1, username: 'fares', email: 'fares@gamil.com', password: '000000')
    group1 = user.groups.build(id: 1, name: 'mygroup')
    group1_items = group1.items.build(id: 1, name: 'myitem', amount: 100, user_id: 1, group_id: 1)

    it 'should display group name' do
      expect(group1.name).to eq('mygroup')
    end
    it 'should display group author' do
      expect(group1.user.username).to eq('fares')
    end
    it 'should display group author' do
      expect(group1.user.username).to eq('fares')
    end
    it 'should display group items name' do
      expect(group1_items.name).to eq('myitem')
    end
    it 'should display group items amount' do
      expect(group1_items.amount).to eq(100.0)
    end
  end

  describe 'association and vaildation' do
    it 'should has_many items' do
      expect { should has_many(:items) }
    end
    it 'should belong_to user' do
      expect { should belong_to(:user) }
    end
    it 'should has_one_attached icon' do
      expect { should has_one_attached(:icon) }
    end
    it 'should validate name presence' do
      expect { should validate_presence_of(:name) }
    end
    it 'should validate name uniqueness' do
      expect { should validate_uniqueness_of(:name) }
    end
  end
end
