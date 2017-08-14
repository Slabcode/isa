class Client < ApplicationRecord

  def self.load_clients(**args)
    all.paginate(page: args[:params] || 1,per_page: args[:per_page] || 10)
  end
end
