class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    @url = "orders/#{order.id}"

    mail(to: order.email, 
         subject: "Jungle e-Receipt - Order ##{order.id}")
  end
end
