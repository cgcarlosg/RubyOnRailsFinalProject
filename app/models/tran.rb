class Tran < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :tran_categories
  has_many :categories, through: :tran_categories
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :total, presence: true
end
