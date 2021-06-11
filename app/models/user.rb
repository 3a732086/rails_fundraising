class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable#, :omniauthable

  validates :name, presence: true

  mount_uploader :avator, CoverImageUploader

  has_many :pledges
  has_one :project_owner

  def project_owner
    @project_owner = super

    if @project_owner.blank?
      @project_owner = ProjectOwner.create(user: self)
    end

    return @project_owner
  end

end
