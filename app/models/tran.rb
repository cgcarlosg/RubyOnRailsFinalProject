class Tran < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :categories
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :total, presence: true
end
