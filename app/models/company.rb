class Company < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  belongs_to :user, inverse_of: :ownerships
  has_many :performances, dependent: :destroy
  has_many :company_users
  has_many :users, through: :company_users
  has_many :reviews, as: :reviewee, dependent: :destroy
  has_many :opportunities, dependent: :destroy
  has_many :lessons, dependent: :destroy

  accepts_nested_attributes_for :reviews,
    allow_destroy: true

  has_attached_file :profile_image,
    :default_url => "/assets/images/companyDefaultProfile.jpg"
  validates_attachment :profile_image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  has_attached_file :hero_image,
    :default_url => "/assets/images/companyDefaultSplash.jpg"
  validates_attachment :hero_image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }


  def upcoming_performances
    upcoming = performances.joins("JOIN show_times ON show_times.event_id = performances.id AND show_times.event_type = 'Performance'").
      select {|per| per.show_times.last.show_date >= DateTime.now }
  end

  def past_performances
    past = performances.joins("JOIN show_times ON show_times.event_id = performances.id AND show_times.event_type = 'Performance'").
      select {|per| per.show_times.last.show_date < DateTime.now }
  end

end
