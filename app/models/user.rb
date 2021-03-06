class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name
  before_save :assign_role
  belongs_to :role
  has_many :posts, :dependent => :destroy
  has_many :replies, :dependent => :destroy

  def assign_role
    self.role = Role.new(name: "Guest") if self.role.nil?
  end

 def admin?
    self.role.name == "Admin"
  end

  def manager?
    self.role.name == "Manager"
  end

  def regular?
    self.role.name == "Regular"
  end
end
