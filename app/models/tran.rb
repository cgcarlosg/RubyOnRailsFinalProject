class Tran < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :categories
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :total, presence: true
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
