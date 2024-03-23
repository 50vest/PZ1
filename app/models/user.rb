class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products
  has_many :comments, dependent: :destroy
  has_one :cart, through: :orderables

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
              
         enum role: { user: 0, seller: 1, buyer: 2 }
  after_initialize :set_default_role, :if => :new_record?
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :username, length: { maximum: 15 }
  validates :first_name, length: { maximum: 20 }, presence: true
  validates :last_name, length: { maximum: 20 }, presence: true
  
  before_save :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :seller
  end
end


  

