# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170814132336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "username", null: false
    t.string "name", null: false
    t.string "lastname", null: false
    t.string "mobile", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "avaluo_images", force: :cascade do |t|
    t.bigint "avaluo_id"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaluo_id"], name: "index_avaluo_images_on_avaluo_id"
  end

  create_table "avaluo_users", force: :cascade do |t|
    t.bigint "avaluo_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaluo_id"], name: "index_avaluo_users_on_avaluo_id"
    t.index ["user_id"], name: "index_avaluo_users_on_user_id"
  end

  create_table "avaluos", force: :cascade do |t|
    t.string "serial"
    t.string "nombre_solicitante"
    t.integer "tipo_de_identificacion"
    t.string "numero_de_identificacion"
    t.bigint "client_id"
    t.integer "objeto_avaluo"
    t.date "fecha_avaluo"
    t.date "fecha_correcion"
    t.integer "metodologia_valutoria"
    t.integer "estado_avaluo"
    t.integer "estado_revison"
    t.string "barrio"
    t.string "nombre_conjunto_o_edificio"
    t.string "departamento"
    t.string "ciudad"
    t.integer "sistemas_de_coordenadas"
    t.decimal "latitud"
    t.decimal "longitud"
    t.string "sistemas_de_coordenadas_otra"
    t.string "direccion_inmueble"
    t.text "justificacion_metodologia"
    t.integer "avaluo_type"
    t.integer "barrio_estrato"
    t.integer "barrio_legalidad_barrio"
    t.integer "barrio_topografia"
    t.integer "barrio_transporte"
    t.boolean "barrio_acueducto_sector"
    t.boolean "barrio_acueducto_predio"
    t.boolean "barrio_alcantarillado_sector"
    t.boolean "barrio_alcantarillado_predio"
    t.boolean "barrio_energia_sector"
    t.boolean "barrio_energia_predio"
    t.boolean "barrio_gas_sector"
    t.boolean "barrio_gas_predio"
    t.boolean "barrio_telefonia_sector"
    t.boolean "barrio_telefonia_predio"
    t.boolean "barrio_vivienda"
    t.boolean "barrio_industria"
    t.boolean "barrio_comercio"
    t.boolean "barrio_otro"
    t.string "barrio_otro_name"
    t.integer "barrio_estado"
    t.integer "barrio_pavimentada"
    t.integer "barrio_andenes"
    t.integer "barrio_sardineles"
    t.boolean "barrio_parques"
    t.boolean "barrio_parqueadero"
    t.boolean "barrio_alumbrado"
    t.boolean "barrio_zonas_verdes"
    t.boolean "barrio_arborizacion"
    t.boolean "barrio_alamedas"
    t.text "perspectivas_de_valorizacion"
    t.string "inmueble_tipo"
    t.integer "inmueble_uso"
    t.string "inmueble_uso_otro"
    t.integer "inmueble_clase"
    t.string "inmueble_clase_otro"
    t.integer "inmueble_tipo_vivienda"
    t.string "m_inmob_principal_1"
    t.string "m_inmob_principal_2"
    t.string "m_inmob_gj_1"
    t.string "m_inmob_gj_2"
    t.string "m_inmob_gj_3"
    t.string "m_inmob_gj_4"
    t.string "m_inmob_gj_5"
    t.string "m_inmob_dp_1"
    t.string "m_inmobiliaria_dp_2"
    t.string "chip"
    t.integer "inmueble_ubicacion"
    t.string "inmueble_num_escritura"
    t.string "inmueble_num_notaria"
    t.date "inmueble_fecha_escritura"
    t.string "inmueble_depto"
    t.string "inmueble_ciudad"
    t.integer "construccion_numero_de_pisos"
    t.integer "construccion_numero_de_sotanos"
    t.integer "construccion_año_construcicon"
    t.integer "construccion_vetustez"
    t.boolean "construccion_estado"
    t.boolean "construccion_terminada"
    t.boolean "construccion_en_obra"
    t.integer "construccion_avance"
    t.boolean "construccion_usado_sin_terminar"
    t.boolean "construccion_usado_terminado"
    t.boolean "construccion_usado_remodelado"
    t.integer "construccion_esatdo_de_conservacion"
    t.integer "construccion_estructura_2"
    t.integer "construccion_estructura_1"
    t.string "construccion_estructura_otro"
    t.integer "construccion_fachada"
    t.string "construccion_fachada_otro"
    t.integer "construccion_cubierta"
    t.string "construccion_cubierta_otro"
    t.integer "construccion_irregularidad_planta"
    t.integer "construccion_irregularidad_altura"
    t.integer "construccion_daños_previos"
    t.integer "construccion_reparados"
    t.integer "construccion_estructura_reforzada"
    t.integer "construccion_sala"
    t.integer "construccion_comedor"
    t.integer "construccion_estudio"
    t.integer "construccion_baño_social"
    t.integer "construccion_estar_hab"
    t.integer "construccion_baño_privado"
    t.integer "construccion_cocina"
    t.integer "construccion_cuarto_serv"
    t.integer "construccion_baño_servicio"
    t.integer "construccion_patio_interior"
    t.integer "construccion_terraza"
    t.integer "construccion_jardin"
    t.integer "construccion_balcon"
    t.integer "construccion_z_verde_privada"
    t.integer "construccion_iluminacion"
    t.integer "construccion_ventilacion"
    t.integer "construccion_total_garages"
    t.integer "construccion_cubierto"
    t.integer "construccion_servidumbre"
    t.integer "construccion_deposito"
    t.integer "construccion_local"
    t.integer "construccion_bodega"
    t.integer "construccion_oficina"
    t.integer "construccion_estado_pisos"
    t.integer "construccion_estado_techos"
    t.integer "construccion_estado_muros"
    t.integer "construccion_estado_c_mader"
    t.integer "construccion_estado_c_metal"
    t.integer "construccion_estado_baños"
    t.integer "construccion_estado_cocina"
    t.integer "construccion_calidad_pisos"
    t.integer "construccion_calidad_techos"
    t.integer "construccion_calidad_muros"
    t.integer "construccion_calidad_c_mader"
    t.integer "construccion_calidad_c_metal"
    t.integer "construccion_calidad_baños"
    t.integer "construccion_calidad_cocina"
    t.integer "construccion_propiedad_horizontal"
    t.integer "construccion_cojunto_o_agrupacion_cerrada"
    t.integer "construccion_ubicacion_inmueble"
    t.integer "construccion_numero_edificios_o_casas"
    t.integer "construccion_unid_por_piso"
    t.integer "construccion_total_unidades"
    t.boolean "construccion_porteria"
    t.boolean "construccion_citofono"
    t.boolean "construccion_bicicletero"
    t.boolean "construccion_piscina"
    t.boolean "construccion_tanque_agua"
    t.boolean "construccion_club_house"
    t.boolean "construccion_gj_visitante"
    t.boolean "construccion_juegos_niños"
    t.boolean "construccion_cancha_multi"
    t.boolean "construccion_bomba_eyectora"
    t.boolean "construccion_a_acon_central"
    t.boolean "construccion_cancha_squash"
    t.boolean "construccion_z_verdes"
    t.boolean "construccion_gimnasio"
    t.boolean "construccion_golfito"
    t.boolean "construccion_salon_comunal"
    t.boolean "construccion_shut_basuras"
    t.boolean "construccion_eq_presion_cons"
    t.boolean "construccion_planta_electrica"
    t.boolean "construccion_ascensor"
    t.integer "construccion_numero_ascensores"
    t.string "construccion_otro_1"
    t.string "construccion_otro_2"
    t.text "oferta_actualidad_edificadora"
    t.text "oferta_comportamiento_de_oferta_y_demanda"
    t.integer "oferta_tiempo_esperado_comercializacion"
    t.integer "ambiental_salubridad"
    t.boolean "ambiental_arborizacion"
    t.boolean "ambiental_parques"
    t.boolean "ambiental_z_verdes"
    t.string "ambiental_positivo_otro"
    t.boolean "ambiental_por_aire"
    t.boolean "ambiental_basura"
    t.boolean "ambiental_inseguridad"
    t.boolean "ambiental_ruido"
    t.boolean "ambiental_aguas_servidas"
    t.string "ambiental_negativo_otro"
    t.integer "avaluo_1"
    t.decimal "avaluo_area_1"
    t.decimal "avaluo_valor_1"
    t.integer "avaluo_2"
    t.decimal "avaluo_area_2"
    t.decimal "avaluo_valor_2"
    t.integer "avaluo_3"
    t.decimal "avaluo_area_3"
    t.decimal "avaluo_valor_3"
    t.integer "avaluo_4"
    t.decimal "avaluo_area_4"
    t.decimal "avaluo_valor_4"
    t.integer "avaluo_5"
    t.decimal "avaluo_area_5"
    t.decimal "avaluo_valor_5"
    t.integer "avaluo_6"
    t.decimal "avaluo_area_6"
    t.decimal "avaluo_valor_6"
    t.integer "avaluo_7"
    t.decimal "avaluo_area_7"
    t.decimal "avaluo_valor_7"
    t.integer "avaluo_8"
    t.decimal "avaluo_area_8"
    t.decimal "avaluo_valor_8"
    t.integer "avaluo_9"
    t.decimal "avaluo_area_9"
    t.decimal "avaluo_valor_9"
    t.integer "avaluo_10"
    t.decimal "avaluo_area_10"
    t.decimal "avaluo_valor_10"
    t.text "observaciones_observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_avaluos_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "name", null: false
    t.string "lastname", null: false
    t.string "username", null: false
    t.string "mobile", null: false
    t.boolean "disable", default: false
    t.integer "role", default: 0
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "avaluo_images", "avaluos"
  add_foreign_key "avaluo_users", "avaluos"
  add_foreign_key "avaluo_users", "users"
  add_foreign_key "avaluos", "clients"
end
