class Entry < ActiveRecord::Base
  belongs_to :project

  validates :hours, presence: true
  validates :hours, numericality: { only_integer: true}

  validates :minutes, presence: true
  validates :minutes, numericality: { only_integer: true}
end
