# == Schema Information
#
# Table name: levels
#
#  id         :bigint(8)        not null, primary key
#  directions :text
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Level < ApplicationRecord
  has_many :queries, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :level_items, :dependent => :destroy


  def matches?(query)
    answers.each do |answer|
      if answer.text == query
        return true
      end
    end
    false
  end

end
