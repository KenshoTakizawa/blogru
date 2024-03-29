class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :category
  has_many :comments
  has_many :teacher_comments

  belongs_to :user

  has_many :notifications, dependent: :destroy

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  has_one_attached :image
  has_rich_text :content

  validates :title,:category_id, presence: true
  validates :category_id, numericality: {other_than: 1}


def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      article_id: id,
      visited_id: user_id,
      action: "like"
    )
    notification.save if notification.valid?
end

def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(article_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
        save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
end

def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      article_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
