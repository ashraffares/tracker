class Group < ApplicationRecord
  has_many :items, dependent: :destroy
  has_one_attached :icon, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
