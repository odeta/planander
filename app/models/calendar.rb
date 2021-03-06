class Calendar < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  validates :color, length: { is: 7 },
                    format: { with: /\A#[a-fA-F0-9]+\z/ }
  validates :title, length: { in: 1..20 }
  validates :title, :color, :user_id, presence: true
end
