class LineItem < ActiveRecord::Base

  belongs_to :item
  belongs_to :cart

  def total
    self.item.price  * self.quantity
  end

end
