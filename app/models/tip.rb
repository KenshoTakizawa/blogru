class Tip < ApplicationRecord
  belongs_to :admin

  has_one_attached :image
  has_rich_text :content

  validates :title, :content, presence: true
end
