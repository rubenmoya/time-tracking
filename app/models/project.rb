class Project < ActiveRecord::Base
  has_many :entries

  validates :name, presence:true
  validates :name, uniqueness: true
  validates :name, format: { with: /\A[a-zA-Z0-9 ]+\z/ }
  validates :name, length: { maximum: 30 }

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
