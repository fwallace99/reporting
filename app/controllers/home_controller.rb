class HomeController < ShopifyApp::AuthenticatedController
  def index
    #@products = ShopifyAPI::Product.find(:all, params: { limit: 10 })

    recharge_access_token = "21ac88718be7466a983368e8a1a2fb4c"
  my_get_header =  {
           "X-Recharge-Access-Token" => "#{recharge_access_token}"
        }

  @sub_count = HTTParty.get("https://api.rechargeapps.com/subscriptions/count", :headers => my_get_header)
  @my_raw = @sub_count.parsed_response
  @my_stuff = JSON.parse(@my_raw)
  puts @my_stuff
  @my_numbers = @my_stuff['count']
  puts "my_numbers = #{@my_numbers}"
#@true_sub_count = @sub_count['something']

#@subscription_gains = Order.find_by_sql "select sum(total_price) as gains from orders where status='SUCCESS' and created_at > '2017-05-30' "
#@subscription_gains = Order.select("SUM(orders.total_price) AS total_value where where status='SUCCESS' and created_at > '2017-05-30' ")
@subscription_gains = Order.where("created_at > '2017-05-30' and status='SUCCESS' ").sum(:total_price)
@subscription_gains = @subscription_gains.to_f
puts @subscription_gains.inspect
@subscription_losses = Order.where("created_at > '2017-05-30' and status='CANCELLED' ").sum(:total_price)
puts @subscriptions_losses



#http://34231428.ngrok.io

  end
end
