class Subject < ApplicationRecord
  has_and_belongs_to_many :students
  has_and_belongs_to_many :teachers

  validates :name, format: { with:  /[[:word:]]/ , message: "Only letters allowed." }
end
