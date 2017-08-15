class NotificationMailer < ApplicationMailer
  default from: "non-reply@isainmobilaria.com"

  def password_user(email,pass,role)
    @pass = pass
    @role = role
    mail(to: email, subject: "Creacion de usuario",reply_to: "contact@isainmobilaria.com")
  end

  def password_admin(email,pass)
    @pass = pass
    mail(to: email, subject: "Creacion de administrador",reply_to: "contact@isainmobilaria.com")
  end

  def notification_avaluo(email,id)
    @id = id
    mail(to: email, subject: "Asignacion de avaluos",reply_to: "contact@isainmobilaria.com")
  end
end
