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
end
