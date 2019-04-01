# == Schema Information
#
# Table name: selections
#
#  id         :bigint(8)        not null, primary key
#  selected   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  level_id   :integer
#

class Selection < ApplicationRecord
  belongs_to :item, class_name: "Plate"
  belongs_to :level
end
