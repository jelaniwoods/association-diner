# == Schema Information
#
# Table name: plates
#
#  id         :bigint(8)        not null, primary key
#  color      :string
#  fancy      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plate < ApplicationRecord
  has_many :selections, foreign_key: "item_id", dependent: :destroy
end
