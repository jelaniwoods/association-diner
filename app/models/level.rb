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
  has_many :selections, :dependent => :destroy

  def matches?(query)
    p "MATCHES"
    answers.each do |answer|
      p answer.text
      p query
      if answer.text == query
        return true
      end
    end
    false
  end

end
