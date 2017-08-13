class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  def load_admins(**args)
    all.paginate(page: args[:page] || 1, per_page: args[:per_page] || 10)
  end
end
