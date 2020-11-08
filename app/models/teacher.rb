class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_one_attached :image




  validates :teach_content, :teach_detail, :teacher_history, :nickname, presence: true








  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
