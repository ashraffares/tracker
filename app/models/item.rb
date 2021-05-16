class Item < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
