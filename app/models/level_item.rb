# == Schema Information
#
# Table name: level_items
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  level_id   :integer
#

class LevelItem < ApplicationRecord
  belongs_to :item, class_name: "Plate"
  belongs_to :level

  def selected
    false
  end
end
