class CrateSong < ApplicationRecord
  belongs_to :song, dependent: :destroy
  belongs_to :crate
  # validates :position, presence: true
end
