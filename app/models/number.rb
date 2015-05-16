class Number < ActiveRecord::Base
  validates :phone_number, presence: true
  validates :message, presence: true

  def self.create_from_number!(number, message)
    number = Number.new
    number.phone_number = number
    number.message = message
    number.save!
  end
end