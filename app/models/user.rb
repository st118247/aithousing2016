class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :officer_role
  validates_uniqueness_of :email

  def admin?
    self.officer_role.role == "Admin" if !self.officer_role.blank?
  end
  def supervisor?
    self.officer_role.role == "Supervisor" if !self.officer_role.blank?
  end
  def staff?
    self.officer_role.role == "Staff" if !self.officer_role.blank?
  end
end
