class Event < ApplicationRecord
  belongs_to :calendar
  validates :notes, :place, length: { maximum: 200 }
  validates :calendar_id, :start_time, :end_time, presence: true
end
