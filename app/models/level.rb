# == Schema Information
#
# Table name: levels
#
#  id         :bigint(8)        not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Level < ApplicationRecord
  has_many :queries, dependent: :destroy
  has_many :selections, :dependent => :destroy
end
