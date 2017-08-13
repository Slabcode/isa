class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  enum role: {
    "Perito" => 0,
    "Revisor Tecnico" => 1,
  }

  validates_presence_of :email,:name,:lastname,:mobile,:username
  validates_length_of :name,:lastname, minimum: 4, maximum: 30
  validates_length_of :mobile, in: 10..12
  validates_uniqueness_of :mobile,:username,:email
  validates_inclusion_of :role, :in => roles.keys
  validates_numericality_of :mobile,:only_integer => true


  def self.load_users(**args)
    u = all.paginate(page: args[:page] || 1,per_page: args[:per_page] || 10)
    if args.has_key?(:role)
      u = u.where(users:{
        role: args[:role]
        })
    end
    u
  end
end
