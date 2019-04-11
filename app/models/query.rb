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

  def is_valid?
    # if Capitalized Class name
    # if use any active record query method (.find, .find_by, where, .all)
    # if parameters in methods are correct syntax:
    #   - column: value,..
    #   - :column => value,..
    #   - {:column => value,..}
  end

  # TODO:
  # A query has many selections
  # if query is valid
  # from the query, parse the attributes:
  #  - ids, other columns
  #  - if no columns, is it all? is it find?

  def select_items
    text = input
    case text

    when "Plate.where(color:\"white\")", "Plate.where()",
      "Plate.where(:id=>1)","Plate.where(:id=>1)[0]",
      "Plate.where({color:\"white\"})", "Plate.where({:id=>1})", "Plate.all"

      res = true
      selections.each do |s|
        s.update(selected: true)
      end
      p "he"

    when "Plate.where(id:1).first", "Plate.where(id:1)[0]",
      "Plate.where(:id=>1).first","Plate.where(:id=>1)[0]",
      "Plate.where({:id=>1})[0]", "Plate.where({:id=>1}).first",
      "Plate.find_by(id:1)", "Plate.find_by(:id=>1)", "Plate.find(1)"

      res = true
      selections.first.update(selected: true)
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
