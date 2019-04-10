namespace :dev do
  desc "Setup db with example data"
  task prime: :environment do
    Level.destroy_all
    Plate.destroy_all
    Selection.destroy_all
    LevelItem.destroy_all
    Answer.destroy_all

    plate1 = Plate.create(color: "white", fancy: false)
    plate2 = Plate.create(color: "white", fancy: false)
    Plate.create(color: "white", fancy: true)

    level1 = Level.create(number: 1, directions: "Select all the Plates")
    LevelItem.create(item_id: plate1.id, level_id: level1.id)
    LevelItem.create(item_id: plate2.id, level_id: level1.id)

    Answer.create(text: "Plate.all", level_id: level1.id)
    Answer.create(text: "Plate.where()", level_id: level1.id)
    Answer.create(text: "Plate.where({})", level_id: level1.id)

    level2 = Level.create(number: 2, directions: "Select the Plate that has an id of 2")



    LevelItem.create(item_id: plate1.id, level_id: level2.id)
    LevelItem.create(item_id: plate2.id, level_id: level2.id)

    Answer.create(text: "Plate.where(id:2).first", level_id: level2.id)
    Answer.create(text: "Plate.where(id:2)[0]", level_id: level2.id)
    Answer.create(text: "Plate.where({:id=>2}).first", level_id: level2.id)
    Answer.create(text: "Plate.where({:id=>2})[0]", level_id: level2.id)
    Answer.create(text: "Plate.where(:id=>2).first", level_id: level2.id)
    Answer.create(text: "Plate.where(:id=>2)[0]", level_id: level2.id)
    Answer.create(text: "Plate.find_by({:id=>2})", level_id: level2.id)
    Answer.create(text: "Plate.find_by(:id=>2)", level_id: level2.id)
    Answer.create(text: "Plate.find_by(id:2)", level_id: level2.id)
    Answer.create(text: "Plate.find(2)", level_id: level2.id)
  end

end
