class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_email(order)
    @order = order
    @url = "orders/#{order.id}"
    delivery_options = { address: 'smtp://0.0.0.0:1025'}

    mail(to: order.email, 
         subject: "Jungle e-Receipt - Order ##{order.id}",
         delivery_method_options: delivery_options)
  end
end
