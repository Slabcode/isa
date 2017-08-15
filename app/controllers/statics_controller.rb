class StaticsController < ApplicationController
  before_action :authenticate, only: [:requests]
  before_action :authenticate_admin!, only: [:reports]

  def index
  end

  def reports
  end

  def statistics
    @results = {}
    if params[:tipo_grafico] == "Torta"
      @type = "pie_chart"
      @title = "Estados de avaluos y Estados de revison"
      if  params[:avaluo_type] == "Todos"
        if params[:estado] == "Estado avaluo"
          @title = "Estados de avaluos"
          ["Inmuble-Rural-Casa rural","Inmueble-Rural-Lote","Inmueble-Urbano-Apartamento",
          "Inmueble-Urbano-Bodega","Inmueble-Urbano-Casa","Inmueble-Urbano-Local","Inmueble-Urbano-Lote urbano",
          "Inmueble-Urbano-Lote Oficina"].each do |k|
            t = Avaluo.where(
              avaluo_type: Avaluo.avaluo_types[k]
            ).where(estado_avaluo: 0).count
            t1 = Avaluo.where(
              avaluo_type: Avaluo.avaluo_types[k]
            ).where(estado_avaluo: 1).count
            t2 = Avaluo.where(
              avaluo_type: Avaluo.avaluo_types[k]
            ).where(estado_avaluo: 2).count
            t3 = Avaluo.where(
              avaluo_type: Avaluo.avaluo_types[k]
            ).where(estado_avaluo: 3).count

            @results["#{k}-nuevo"] = t
            @results["#{k}-en progreso"] = t1
            @results["#{k}-en revision"] = t2
            @results["#{k}-finalizado"] = t3
          end
        else
          @title = "Estados de revison"
          ["Inmuble-Rural-Casa rural","Inmueble-Rural-Lote","Inmueble-Urbano-Apartamento",
          "Inmueble-Urbano-Bodega","Inmueble-Urbano-Casa","Inmueble-Urbano-Local","Inmueble-Urbano-Lote urbano",
          "Inmueble-Urbano-Lote Oficina"].each do |k|
            t = Avaluo.where(
              avaluo_type: Avaluo.avaluo_types[k]
            ).where(estado_avaluo: 2).where(estado_revison: 0).count
            t1 = Avaluo.where(
              avaluo_type: Avaluo.avaluo_types[k]
            ).where(estado_avaluo: 2).where(estado_revison: 0).count
            t2 = Avaluo.where(
              avaluo_type: Avaluo.avaluo_types[k]
            ).where(estado_avaluo: 2).where(estado_revison: 0).count
            @results["#{k}-revision-sin revision"] = t
            @results["#{k}-revision-revisando"] = t1
            @results["#{k}-revision-revisado"] = t2
          end
        end
      else
        if params[:estado] == "Estado avaluo"
          @title = "Estados de avaluos"
          t = Avaluo.where(
            avaluo_type: Avaluo.avaluo_types[params[:avaluo_type]]
          ).where(estado_avaluo: 0).count
          t1 = Avaluo.where(
            avaluo_type: Avaluo.avaluo_types[params[:avaluo_type]]
          ).where(estado_avaluo: 1).count
          t2 = Avaluo.where(
            avaluo_type: Avaluo.avaluo_types[params[:avaluo_type]]
          ).where(estado_avaluo: 2).count
          t3 = Avaluo.where(
            avaluo_type: Avaluo.avaluo_types[params[:avaluo_type]]
          ).where(estado_avaluo: 3).count
          @results["#{params[:avaluo_type]}-nuevo"] = t
          @results["#{params[:avaluo_type]}-en progreso"] = t1
          @results["#{params[:avaluo_type]}-en revision"] = t2
          @results["#{params[:avaluo_type]}-finalizado"] = t3
        else
          @title = "Estados de revison"
          t = Avaluo.where(
            avaluo_type: Avaluo.avaluo_types[params[:avaluo_type]]
          ).where(estado_avaluo: 2).where(estado_revison: 0).count
          t1 = Avaluo.where(
            avaluo_type: Avaluo.avaluo_types[params[:avaluo_type]]
          ).where(estado_avaluo: 2).where(estado_revison: 0).count
          t2 = Avaluo.where(
            avaluo_type: Avaluo.avaluo_types[params[:avaluo_type]]
          ).where(estado_avaluo: 2).where(estado_revison: 0).count
          @results["#{params[:avaluo_type]}-revision-sin revision"] = t
          @results["#{params[:avaluo_type]}-revision-revisando"] = t1
          @results["#{params[:avaluo_type]}-revision-revisado"] = t2
        end
      end
    end
  end

  def requests
    if current_user
      ids = AvaluoUser.where(
        user_id: current_user.id
      ).pluck(:avaluo_id)
      @avaluos = Avaluo.where(
        id: ids
      )
      if current_user.Perito?
        @avaluos = @avaluos.where(estado_avaluo: [0,1])
      else
        @avaluos = @avaluos.where(estado_avaluo: [2])
      end
    else
      @avaluos = Avaluo.where(estado_avaluo: 3)
    end

  end
end
