class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses
  has_many :cart_items
  has_many :order

  #https://tech.mof-mof.co.jp/blog/devise-login-without-email/ ここを参照した
  #ここの部分を追記することで、customerのログイン時のみこの名前カラムをauthentication_keysにできる
  devise :database_authenticatable, :authentication_keys => [:last_name, :first_name]

  def active_for_authentication?
    #customerのis_unsubscribedがfalseならtrueを返す
    super && (self.is_unsubscribed == false)
  end

end
