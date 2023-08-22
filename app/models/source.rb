class Source < ApplicationRecord
  belongs_to :base, class_name: "Song"
  belongs_to :remix, class_name: "Song"
end
