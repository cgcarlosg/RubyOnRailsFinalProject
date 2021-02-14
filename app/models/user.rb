class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    has_many :categories
    has_many :trans, dependent: :destroy
    has_many :deals, dependent: :destroy
end
