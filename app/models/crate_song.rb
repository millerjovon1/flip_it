class CrateSong < ApplicationRecord
  belongs_to :song
  belongs_to :crate
  # validates :position, presence: true
end
