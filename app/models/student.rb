class Student < ApplicationRecord
  has_many :enrollments
  has_many :section, through: :enrollments

  validates_associated :enrollments
  validates :name, presence: true, length: { in: 3..40 }
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :number, presence: true, length: { is: 9 }, numericality: { only_integer: true }
  validates :email, presence: true, length: { in: 11..40 }
  validates :phoneNumber, presence: true, length: { is: 10 }
  validates :phoneNumber, numericality: { only_integer: true, message: "only numbers" }

end
