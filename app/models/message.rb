class Message < ApplicationRecord
  validates :name, presence: true,
            length: {minimum: 3, maximum: 25}
  validates :phone, length: {minimum: 7, maximum: 10}

  validates :message, presence: true,
            length: {minimum: 10,maximum: 100}

end
