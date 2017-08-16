class Avaluo < ApplicationRecord
  belongs_to :client
  has_many :avaluo_images
  has_many :avaluo_users
  has_many :users, through: :avaluo_users

  enum tipo_de_identificacion: {
    "C.C" => 0,
    "C.Ext" => 1,
    "Nit" => 2,
  }

  enum objeto_avaluo: {
    "organizacion": 0,
    "actualizacion":1,
    "reconsideracion":2,
    "correccion":3,
    "remate":4,
    "dacion en pago":5,
    "desafectacion":6,
    "normalizacion":7
  }
  enum metodologia_valutoria: {
    "comparacion de mercado":0,
    "capitalizacion de ingresos":1,
    "metodo de reposicion":2,
    "metodo residual":3,
    "comparacion-capitalizacion":4,
    "comparacion-reposicion":5,
    "comparacion-residual":6,
    "capitalizacion-reposicion":7,
    "capitalizacion-residual":8,
    "reposicion-residual":9,
    "comp-capit-repos":10,
    "comp-repos-residual":11,
    "comp-capit-residual":12,
    "comp-capit-repos-residual"
  }

  enum tipo_de_identificacion: {

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
