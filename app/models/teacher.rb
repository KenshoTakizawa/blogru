class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :plan

  has_one_attached :image

  has_many :orders
  has_many :teacher_evaluations
  has_many :teacher_comments




  validates :teach_content, :teach_detail, :teacher_history, :nickname, presence: true






  validates :plan_id, numericality: { other_than: 1 } 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
