# == Schema Information
#
# Table name: queries
#
#  id         :bigint(8)        not null, primary key
#  input      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  level_id   :integer
#

class Query < ApplicationRecord
  belongs_to :level
  has_many :selections, :dependent => :destroy

  def create_selections
    level.level_items.each do |level_item|
      Selection.create(item_id: level_item.item.id, query_id: id)
    end
  end

  def select_items
    text = input
    case text
    when "Plate.where(id:2).first", "Plate.where(id:2)[0]",
      "Plate.where(:id=>2).first","Plate.where(:id=>2)[0]",
      "Plate.where({:id=>2})[0]", "Plate.where({:id=>2}).first",
      "Plate.find_by(id:2)", "Plate.find_by(:id=>2)", "Plate.find(2)"
      res = true
      selections.second.update(selected: true)

  when "Plate.where({:id=>2})", "Plate.where(id:2)", "Plate.where({:id=>2})",
    "Plate.where(id:2)", "Plate.where(:id=>2)"
      collection_returned = true
      res = false
    else
      res = false
    end
  end
end
