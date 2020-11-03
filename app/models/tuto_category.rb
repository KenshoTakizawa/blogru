class TutoCategory < ActiveHash::Base
  self.data= [
    { id: 1, name: '--' },
    { id: 2, name: 'SEO' },
    { id: 3, name: 'コピーライティング' },
  ]

  include ActiveHash::Associations
  has_many :tutorials
end
