RSpec.describe Item, type: :model do
  describe 'new item' do
    user = User.new(username: 'fares', email: 'fares@gamil.com', password: '000000')
    item = user.items.build(name: 'myitem', amount: 100)

    it 'should display item author' do
      expect(item.user.username).to eq('fares')
    end
    it 'should display item name' do
      expect(item.name).to eq('myitem')
    end
    it 'should display item amount' do
      expect(item.amount).to eq(100.0)
    end
  end
  describe 'association and vaildation' do
    it 'should belong_to group' do
      expect { should belong_to(:group) }
    end
    it 'should belong_to user' do
      expect { should belong_to(:user) }
    end
    it 'should validate name presence' do
      expect { should validate_presence_of(:name) }
    end
    it 'should validate amount presence' do
      expect { should validate_presence_of(:amount) }
    end
  end
end
