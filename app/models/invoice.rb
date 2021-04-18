class Invoice < ApplicationRecord

  has_many :invoice_items, dependent: :destroy
  accepts_nested_attributes_for :invoice_items

end