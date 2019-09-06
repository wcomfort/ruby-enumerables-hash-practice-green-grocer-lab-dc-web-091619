require 'pry'
def consolidate_cart(cart)
  total_cart = {}
  cart.each do |value|
    value.each do |item, hash|
      total_cart[item] ||= hash 
   if  total_cart[item][:count] 
     total_cart[item][:count] += 1 
     else 
       total_cart[item][:count] = 1 
   end
 end 
 end
 total_cart
end

def apply_coupons(cart, coupons)
 coupons.each do |coupon|
    item = coupon[:item]
    if cart[item]
      if cart[item][:count] >= coupon[:num] && !cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: coupon[:num]}
        elsif cart[item][:count] >= coupon[:num] && cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"][:count] += coupon[:num]
      end 
       cart[item][:count] -= coupon[:num]
      end 
  end 
  cart
end

def apply_clearance(cart)
  cart.each do |product_name, stats|
  stats[:price] -= stats[:price] * 0.2 if stats[:clearance]
  end 
  cart
end

def checkout(cart, coupons)
  
end
