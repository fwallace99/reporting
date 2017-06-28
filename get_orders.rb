#file get_orders.rb
require 'dotenv'
require "pg"

require 'httparty'

Dotenv.load

recharge_access_token = "21ac88718be7466a983368e8a1a2fb4c"
  my_get_header =  {
           "X-Recharge-Access-Token" => "#{recharge_access_token}"
        }

  sub_count = HTTParty.get("https://api.rechargeapps.com/subscriptions/count", :headers => my_get_header)
  my_raw = sub_count.parsed_response
  my_stuff = JSON.parse(my_raw)
  puts my_stuff
  my_numbers = my_stuff['count']
  puts "my_numbers = #{my_numbers}"

  #GET /orders/count?status=queued

  orders_count = HTTParty.get("https://api.rechargeapps.com/orders/count", :headers => my_get_header)
  raw_orders = orders_count.parsed_response
  num_orders = JSON.parse(raw_orders)
  total_orders = num_orders['count']
  total_orders = total_orders.to_i
  puts total_orders

#rails generate model Order id:string customer_id:string address_id:string charge_id:string shopify_order_id:string shopify_order_number:string created_at:datetime scheduled_at:datetime processed_at:datetime status:string first_name:string last_name:string email:string 'total_price:decimal{10,2}'

uri = URI.parse(ENV['DATABASE_URL'])
conn = PG.connect(uri.hostname, uri.port, nil, nil, uri.path[1..-1], uri.user, uri.password)

page_size = 250
num_pages = (total_orders/page_size.to_f).ceil

puts num_pages

1.upto(num_pages) do |page|

  page_order = HTTParty.get("https://api.rechargeapps.com/orders?limit=250&page=#{page}", :headers => my_get_header)
  temp_orders = page_order.parsed_response
  #puts temp_orders.inspect
  temp_orders.each do |myord|
    puts "-----------------------------"
    puts myord.inspect
    puts "-----------------------------"
   # my_page_order = myord['orders'][0]
    #puts myord.class
    temp_stuff = myord[1]
    puts temp_stuff
    temp_stuff.each do |funky|
        puts "***************************"
        puts funky.inspect
        puts "**************************"
      end
    

    end


  sleep 5


  end
