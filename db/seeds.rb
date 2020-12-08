Garden.destroy_all

garden_names = [
  "French garden",
  "My Cute Balcony",
  "English garden",
  "Flowered patio",
  "Garden in Japan",
  "Walk among flowers"
]

garden_names.each do |garden_name|
  garden_request = RestClient.get("https://source.unsplash.com/1200x700/?garden")
  garden = Garden.new(
      name: garden_name,
      banner_url: garden_request.request.url
    )
  garden.save!
  3.times do
    plant_request = RestClient.get("https://source.unsplash.com/400x300/?flower")
    plant = Plant.new(
      name: Faker::FunnyName.name,
      image_url: plant_request.request.url
    )
    plant.garden = garden
    plant.save!
    sleep(2)
  end
end
