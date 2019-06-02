class Student < ApplicationRecord
  has_and_belongs_to_many :subjects
  has_many :teachers, through: :subjects

  attr_accessor :subject_ids

  validates :roll_number, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :name, format: { with: /[[:word:]]/ , message: "Only letters allowed." }
  validates :city, format: { with: /[[:word:]]/ , message: "Only letters allowed." }
end
