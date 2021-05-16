RSpec.describe Item, type: :model do
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
