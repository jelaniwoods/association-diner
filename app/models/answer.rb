# == Schema Information
#
# Table name: answers
#
#  id         :bigint(8)        not null, primary key
#  text       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  query_id   :integer
#

class Answer < ApplicationRecord
end
