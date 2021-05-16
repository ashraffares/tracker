require 'rails_helper'

RSpec.describe Group, type: :model do
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
