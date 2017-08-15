require 'test_helper'

class AvaluosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaluo = avaluos(:one)
  end

  test "should get index" do
    get avaluos_url
    assert_response :success
  end

  test "should get new" do
    get new_avaluo_url
    assert_response :success
  end

  test "should create avaluo" do
    assert_difference('Avaluo.count') do
      post avaluos_url, params: { avaluo: { avaluo_type: @avaluo.avaluo_type, barrio: @avaluo.barrio, chip: @avaluo.chip, ciudad: @avaluo.ciudad, client_id: @avaluo.client_id, departamento: @avaluo.departamento, direccion_inmueble: @avaluo.direccion_inmueble, estado_avaluo: @avaluo.estado_avaluo, estado_revison: @avaluo.estado_revison, fecha_avaluo: @avaluo.fecha_avaluo, fecha_correcion: @avaluo.fecha_correcion, inmueble_ciudad: @avaluo.inmueble_ciudad, inmueble_clase: @avaluo.inmueble_clase, inmueble_clase_otro: @avaluo.inmueble_clase_otro, inmueble_depto: @avaluo.inmueble_depto, inmueble_fecha_escritura: @avaluo.inmueble_fecha_escritura, inmueble_num_escritura: @avaluo.inmueble_num_escritura, inmueble_num_notaria: @avaluo.inmueble_num_notaria, inmueble_tipo: @avaluo.inmueble_tipo, inmueble_tipo_vivienda: @avaluo.inmueble_tipo_vivienda, inmueble_ubicacion: @avaluo.inmueble_ubicacion, inmueble_uso: @avaluo.inmueble_uso, inmueble_uso_otro: @avaluo.inmueble_uso_otro, justificacion_metodologia: @avaluo.justificacion_metodologia, latitud: @avaluo.latitud, longitud: @avaluo.longitud, m_inmob_dp_1: @avaluo.m_inmob_dp_1, m_inmob_gj_1: @avaluo.m_inmob_gj_1, m_inmob_gj_2: @avaluo.m_inmob_gj_2, m_inmob_gj_3: @avaluo.m_inmob_gj_3, m_inmob_gj_4: @avaluo.m_inmob_gj_4, m_inmob_gj_5: @avaluo.m_inmob_gj_5, m_inmob_principal_1: @avaluo.m_inmob_principal_1, m_inmob_principal_2: @avaluo.m_inmob_principal_2, m_inmobiliaria_dp_2: @avaluo.m_inmobiliaria_dp_2, metodologia_valutoria: @avaluo.metodologia_valutoria, nombre_conjunto_o_edificio: @avaluo.nombre_conjunto_o_edificio, nombre_solicitante: @avaluo.nombre_solicitante, numero_de_identificacion: @avaluo.numero_de_identificacion, objeto_avaluo: @avaluo.objeto_avaluo, observaciones_observaciones: @avaluo.observaciones_observaciones, sistemas_de_coordenadas: @avaluo.sistemas_de_coordenadas, sistemas_de_coordenadas_otra: @avaluo.sistemas_de_coordenadas_otra, tipo_de_identificacion: @avaluo.tipo_de_identificacion } }
    end

    assert_redirected_to avaluo_url(Avaluo.last)
  end

  test "should show avaluo" do
    get avaluo_url(@avaluo)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaluo_url(@avaluo)
    assert_response :success
  end

  test "should update avaluo" do
    patch avaluo_url(@avaluo), params: { avaluo: { avaluo_type: @avaluo.avaluo_type, barrio: @avaluo.barrio, chip: @avaluo.chip, ciudad: @avaluo.ciudad, client_id: @avaluo.client_id, departamento: @avaluo.departamento, direccion_inmueble: @avaluo.direccion_inmueble, estado_avaluo: @avaluo.estado_avaluo, estado_revison: @avaluo.estado_revison, fecha_avaluo: @avaluo.fecha_avaluo, fecha_correcion: @avaluo.fecha_correcion, inmueble_ciudad: @avaluo.inmueble_ciudad, inmueble_clase: @avaluo.inmueble_clase, inmueble_clase_otro: @avaluo.inmueble_clase_otro, inmueble_depto: @avaluo.inmueble_depto, inmueble_fecha_escritura: @avaluo.inmueble_fecha_escritura, inmueble_num_escritura: @avaluo.inmueble_num_escritura, inmueble_num_notaria: @avaluo.inmueble_num_notaria, inmueble_tipo: @avaluo.inmueble_tipo, inmueble_tipo_vivienda: @avaluo.inmueble_tipo_vivienda, inmueble_ubicacion: @avaluo.inmueble_ubicacion, inmueble_uso: @avaluo.inmueble_uso, inmueble_uso_otro: @avaluo.inmueble_uso_otro, justificacion_metodologia: @avaluo.justificacion_metodologia, latitud: @avaluo.latitud, longitud: @avaluo.longitud, m_inmob_dp_1: @avaluo.m_inmob_dp_1, m_inmob_gj_1: @avaluo.m_inmob_gj_1, m_inmob_gj_2: @avaluo.m_inmob_gj_2, m_inmob_gj_3: @avaluo.m_inmob_gj_3, m_inmob_gj_4: @avaluo.m_inmob_gj_4, m_inmob_gj_5: @avaluo.m_inmob_gj_5, m_inmob_principal_1: @avaluo.m_inmob_principal_1, m_inmob_principal_2: @avaluo.m_inmob_principal_2, m_inmobiliaria_dp_2: @avaluo.m_inmobiliaria_dp_2, metodologia_valutoria: @avaluo.metodologia_valutoria, nombre_conjunto_o_edificio: @avaluo.nombre_conjunto_o_edificio, nombre_solicitante: @avaluo.nombre_solicitante, numero_de_identificacion: @avaluo.numero_de_identificacion, objeto_avaluo: @avaluo.objeto_avaluo, observaciones_observaciones: @avaluo.observaciones_observaciones, sistemas_de_coordenadas: @avaluo.sistemas_de_coordenadas, sistemas_de_coordenadas_otra: @avaluo.sistemas_de_coordenadas_otra, tipo_de_identificacion: @avaluo.tipo_de_identificacion } }
    assert_redirected_to avaluo_url(@avaluo)
  end

  test "should destroy avaluo" do
    assert_difference('Avaluo.count', -1) do
      delete avaluo_url(@avaluo)
    end

    assert_redirected_to avaluos_url
  end
end
