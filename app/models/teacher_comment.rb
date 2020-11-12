class TeacherComment < ApplicationRecord
  belongs_to :article
  belongs_to :teacher
end
