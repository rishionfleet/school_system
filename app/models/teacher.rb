class Teacher < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_many :students, through: :subjects

  attr_accessor :subject_ids


  validates :name, format: { with: /[[:word:]]/ , message: "Only letters allowed." }
  validates :education, inclusion: { in: ["Graduate", "Masters"] }

end
