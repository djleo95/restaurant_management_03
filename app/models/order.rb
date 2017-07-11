class Order < ApplicationRecord
  include Encode
  belongs_to :guest
  belongs_to :table, inverse_of: :orders
  delegate :capacity, to: :table

  has_many :order_dishes
  has_many :order_combos

  after_save :generate_code

  accepts_nested_attributes_for :guest
  accepts_nested_attributes_for :table

  def all_price
    total = 0
    Order.all.each do |d|
      total += d.subtotal
    end
    return total
  end

  def all_pending_price
    total = 0
    Order.all.each do |d|
      total += d.subtotal unless d.is_confirm
    end
    total
  end

  def subtotal
    total_dishes_price = order_dishes.map{|order_dish| order_dish.valid? ?
      (order_dish.quantity * order_dish.price) : 0}.sum
    total_combos_price = order_combos.map{|order_combo| order_combo.valid? ?
      (order_combo.quantity * order_combo.price) : 0}.sum
    total_dishes_price + total_combos_price
  end

  def original_price
    total_dishes_price = order_dishes.map{|order_dish| order_dish.valid? ?
      (order_dish.quantity * order_dish.price) : 0}.sum
    total_combos_price = order_combos.map{|order_combo| order_combo.valid? ?
      (order_combo.quantity * order_combo.original_price) : 0}.sum
    total_dishes_price + total_combos_price
  end
end
