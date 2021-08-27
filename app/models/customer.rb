class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items
  has_many :order


  def active_for_authentication?
    #customerのis_unsubscribedがfalseならtrueを返す
    super && (self.is_unsubscribed == false)
  end

end
