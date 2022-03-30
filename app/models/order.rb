class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  enum payment_method: {credit_card: 0, bank_transfer: 1}
  enum order_status: {waiting_for_paying: 0, checking_the_payment: 1, creating: 2, preparing_for_the_sending: 3, completed_sending: 4}
end
