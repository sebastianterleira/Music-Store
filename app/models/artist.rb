class Artist < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, comparison: { less_than: Time.zone.today,
    message: "Can't be in the future" }, if: :verify_birth_date?
  validate :birth_date_should_exist_for_death_date, if: :verify_birth_date?
  def verify_birth_date?
    birth_date.present?
  end
  def birth_date_should_exist_for_death_date
    # return if birth_date.present?
    errors.add(:death_date, "Can't be before your birthdate") if death_date < birth_date
  end
end
