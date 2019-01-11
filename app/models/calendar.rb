class Calendar < ApplicationRecord
  belongs_to :user
  validates :color, length: { is: 6 },
                    format: { with: /\A[a-zA-Z]+\z/ }
  validates :title, :color, presence: true
end
