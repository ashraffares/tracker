class Item < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1000.0}
end
