class CrateSong < ApplicationRecord
  belongs_to :song, dependent: :destroy
  belongs_to :crate
  vaidates :position, presence: true
end
