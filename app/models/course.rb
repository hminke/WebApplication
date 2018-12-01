class Course < ApplicationRecord
  has_many :sections

  validates :name, presence: true, length: { in: 3..40}
  validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :department, presence: true, length: { in: 3..20 }
  validates :department, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  validates :number, presence: true, length: { is: 8 }
  validates :creditHours, presence: true, length:{ is: 1 }, numericality: {less_than: 5}
  validates :creditHours, numericality: { only_integer: true }

end
