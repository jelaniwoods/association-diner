namespace :dev do
  desc "Setup db with example data"
  task prime: :environment do
    level = Level.create(number: 1, directions: "Select the Plate with an id of 2")

    plate1 = Plate.create(color: "white", fancy: false)
    plate2 = Plate.create(color: "white", fancy: false)
    Plate.create(color: "white", fancy: true)

    Selection.create(item_id: plate1.id, level_id: level.id)
    Selection.create(item_id: plate2.id, level_id: level.id)

    Answer.create(text: "Plate.where(id: 2)[0]", level_id: level.id)
    Answer.create(text: "Plate.where({:id => 2}).first", level_id: level.id)
    Answer.create(text: "Plate.find_by(:id => 2)", level_id: level.id)
    Answer.create(text: "Plate.where(id: 2).first", level_id: level.id)
    Answer.create(text: "Plate.find_by(id: 2)", level_id: level.id)
    Answer.create(text: "Plate.find(2)", level_id: level.id)
  end

end
