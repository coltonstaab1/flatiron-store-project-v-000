class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total

  end

  def checkout
    self.status = "submitted"
    self.save
    self.user.current_cart = nil
    self.user.save
    change_inventory
  end

  private
    def change_inventory
      if self.status == "submitted"
        self.line_items.each do |line_item|
          line_item.item.inventory -= line_item.quantity
          line_item.item.save
        end
      end
    end

end
