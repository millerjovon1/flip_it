class CrateSong < ApplicationRecord
  belongs_to :song
  belongs_to :crate
end
