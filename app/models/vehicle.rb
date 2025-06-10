class Vehicle < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 1900, less_than_or_equal_to: Date.current.year + 1 }
  validates :color, presence: true
  validates :transmition, presence: true, inclusion: { in: %w[Manual Automática], message: "%{value} no es una transmisión válida" }

  validates :image, presence: true

  validate :acceptable_image

  private

  def acceptable_image
    return unless image.attached?

    unless image.byte_size <= 2.megabytes
      errors.add(:image, "es demasiado grande. Debe ser menor de 2 MB")
    end
  end
end
