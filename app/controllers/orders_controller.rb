class OrdersController < ApplicationController
  def notify
    puts "params==== #{params}"
  rescue => e
    puts "error:==#{e}"
    true
  end
end
