class Notification < ApplicationRecord

  default_scope->{order(created_at: :desc)}

    belongs_to :article, optional: true
    belongs_to :comment, optional: true
    belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
    belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true


  validates :visiter_id, :visited_id, :article_id, :comment_id, :action, presence: true

end
