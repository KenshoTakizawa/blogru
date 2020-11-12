class Plan < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1000', plann:'kensho1' },
    { id: 3, name: '2000', plann:'kensho3'},
    { id: 4, name: '3000', plann:'kensho4'},
  ]

  include ActiveHash::Associations
  has_many :teachers
end
