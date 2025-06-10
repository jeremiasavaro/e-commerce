puts "Creando autos de prueba..."

vehicles = [
  {
    name: "Ford Mustang",
    description: "Deportivo clásico americano",
    price: 35000.00,
    year: 2020,
    color: "Rojo",
    transmition: "Manual",
    image_path: "db/seeds/images/car1.jpeg"
  },
  {
    name: "Toyota Corolla",
    description: "Sedán confiable y económico",
    price: 18000.00,
    year: 2022,
    color: "Blanco",
    transmition: "Automática",
    image_path: "db/seeds/images/car2.jpeg"
  },
  {
    name: "Tesla Model 3",
    description: "Eléctrico moderno y eficiente",
    price: 45000.00,
    year: 2023,
    color: "Negro",
    transmition: "Automática",
    image_path: "db/seeds/images/car3.jpeg"
  },
  {
    name: "Volkswagen Golf",
    description: "Compacto y versátil",
    price: 22000.00,
    year: 2021,
    color: "Azul",
    transmition: "Manual",
    image_path: "db/seeds/images/car4.jpeg"
  }
]

vehicles.each do |attrs|
  vehicle = Vehicle.new(
    name: attrs[:name],
    description: attrs[:description],
    price: attrs[:price],
    year: attrs[:year],
    color: attrs[:color],
    transmition: attrs[:transmition]
  )

  vehicle.image.attach(
    io: File.open(Rails.root.join(attrs[:image_path])),
    filename: File.basename(attrs[:image_path]),
    content_type: "image/jpeg"
  )
  puts "Creando vehículo: #{vehicle.name} con imagen: #{attrs[:image_path]}"
  vehicle.save!
end

puts "¡Autos de prueba creados con éxito!"
