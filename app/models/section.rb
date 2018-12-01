class Section < ApplicationRecord
  has_many :enrollments
  has_many :students, through: :enrollments
  belongs_to :course

  validates_associated :enrollments
  validates_associated :students
  validates_associated :course
  validates :semester, presence: true, length: { in: 9..11 }
  validates :number, presence: true, length: { is: 3 }, numericality: { only_integer: true }
  validates :roomNumber, presence: true, length: { in: 7..12 }

  def course_section_number
    "#{course.name} - Section #{number}"
  end
end
