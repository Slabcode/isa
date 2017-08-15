class Avaluo < ApplicationRecord
  belongs_to :client
  has_many :avaluo_images
  has_many :avaluo_users
  has_many :users, through: :avaluo_users

  enum estado_avaluo: {
    "nuevo" => 0,
    "en progreso" => 1,
    "en revison" => 2,
    "finalizado" => 3,
  }

  enum estado_revison: {
    "sin revison" => 0,
    "revisando" => 1,
    "revisado" => 2,
  }

  enum avaluo_type: {
    "Inmuble-Rural-Casa rural" => 0,
    "Inmueble-Rural-Lote" => 1,
    "Inmueble-Urbano-Apartamento" => 2,
    "Inmueble-Urbano-Bodega" => 3,
    "Inmueble-Urbano-Casa" => 4,
    "Inmueble-Urbano-Local" => 5,
    "Inmueble-Urbano-Lote urbano" => 6,
    "Inmueble-Urbano-Lote Oficina" => 7,
  }

  

end
