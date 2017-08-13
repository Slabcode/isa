class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable


  validates_presence_of :email,:name,:lastname,:username,:mobile
  validates_length_of :name,:lastname, minimum: 4, maximum: 30
  validates_length_of :mobile, in: 10..12
  validates_uniqueness_of :mobile,:username,:email
  validates_numericality_of :mobile,:only_integer => true

  def self.load_admins(**args)
    all.paginate(page: args[:page] || 1, per_page: args[:per_page] || 10)
  end
end
