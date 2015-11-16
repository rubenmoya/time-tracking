class Project < ActiveRecord::Base
  validates :name, presence: true

  def self.iron_find id
    where(id: id)
  end

  def self.clean_old
    where('created_at > ?', 1.week.ago).destroy_all
  end

  def self.last_created_projects n
    Project.order("created_at DESC").limit(n)
  end
end
