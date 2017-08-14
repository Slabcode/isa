class AvaluoUploader < CarrierWave::Uploader::Base

  storage :file
  # storage :fog

  def store_dir
    "avaluos/#{model.avaluo.estado_avaluo}/#{model.avaluo.inmueble_tipo}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end

end
