class Profile < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :nickname, :learning_history, :purpose, presence: true
end
