class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :category

  belongs_to :user

  has_one_attached :image
  has_rich_text :content

  validates :title,:category_id, presence: true
  validates :category_id, numericality: {other_than: 1}
end
