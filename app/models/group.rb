class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness:  true
  validates :icon, presence: true, uniqueness: true
end
