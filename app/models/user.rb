class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles
  has_many :comments, dependent: :destroy
  has_many :orders
  has_many :teacher_evaluations, dependent: :destroy
  has_one :profile, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article



  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
    has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  def already_liked?(article)
    self.likes.exists?(article_id: article.id)
  end

end
