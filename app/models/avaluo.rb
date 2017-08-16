class Avaluo < ApplicationRecord
  belongs_to :client
  has_many :avaluo_images
  has_many :avaluo_users
  has_many :users, through: :avaluo_users

  enum inmueble_clase: {
    "unifamiliar":0,
    "bifamiliar":1,
    "multifamiliar":2,
    "Viv. subsidiada":3,
    "industrial":4,
    "comercial":5,
    "ed oficinas":6
  }

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
    "comp-capit-repos-residual":13
  }

  enum inmueble_uso: {
    "vivienda":0,
    "comercio":1,
    "bodega":2,
    "oficina":3,
    "V multihabitacioinal":4,
    "educacion":5,
    "salud":6,
    "hotelero":7,
    "_industrial":8,
    "iglesia":9,
    "parqueadero":10,
    "auditorio":11,
    "instalacion deportiva":12
  }

  enum estado_avaluo: {
    "nuevo" => 0,
    "en progreso" => 1,
    "en revison" => 2,
    "finalizado" => 3,
  }


  enum inmueble_tipo_vivienda: {
    "vis":0,
    "no vis":1
  }

  enum inmueble_ubicacion: {
    "esquinero":0,
    "medianero":1
  }

  enum sistemas_de_coordenadas: {
    "magna sirgas": 0,
    "wgs82":1,
    "wgs84":2
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
