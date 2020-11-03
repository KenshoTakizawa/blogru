class Tutorial < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :tuto_category


  belongs_to :admin

  has_one_attached :image
  has_rich_text :content

  validates :title,:tuto_category_id, :content, presence: true
  validates :tuto_category_id, numericality: {other_than: 1}
end
