class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:facebook]

  validates :name, presence: true

  mount_uploader :avator, CoverImageUploader

  has_many :pledges
  has_many :valided_pledges, -> {where(status: [:not_paid, :paid])}, class_name: "Pledge"
  has_one :project_owner

  def project_owner
    @project_owner = super

    if @project_owner.blank?
      @project_owner = ProjectOwner.create(user: self)
    end

    return @project_owner
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name    # assuming the user model has a name
      user.skip_confirmation!
    end
  end

end
