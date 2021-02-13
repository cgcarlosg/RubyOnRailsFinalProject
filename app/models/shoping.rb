class Shoping < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :total, presence: true
end
