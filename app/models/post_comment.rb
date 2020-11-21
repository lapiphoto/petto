class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  has_many :replies, dependent: :destroy
end
