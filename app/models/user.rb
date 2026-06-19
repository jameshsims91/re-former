class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 16 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 6, maximum: 16 }, format: { with: /\A(?=.*[A-Z])(?=.*[^A-Za-z0-9])/, message: "must include at least one capital letter and one symbol" }
  validate :no_repeating_numbers

  private

  def no_repeating_numbers
    if password.to_s.match?(/(\d)\1/)
      error.add(:password, "cannot contain repeating numbers")
    end
  end
end
