class Tran < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :total, presence: true
end
