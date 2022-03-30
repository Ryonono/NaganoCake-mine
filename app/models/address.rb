class Address < ApplicationRecord
  belongs_to :customer
  
  def full_address
    @address = Address.find(params[:id])
    full_address = "〒" + @address.post_number + "" + @address.address + "" + @address.name
    return full_address
  end
end
