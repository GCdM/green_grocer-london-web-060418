require 'pry'

def consolidate_cart(cart)
  count_hash = {}
  cart.each do |food_hash|
    food_hash.each do |food, info|
      if !count_hash.include?(food)
        count_hash[food] = info
        count_hash[food][:count] = 0
      end
    end
  end
  count_hash.each do |food, info|
    cart.each do |food_hash|
      food_hash.each do |fname, finfo|
        info[:count] += 1 if fname == food
      end
    end
  end
  return count_hash
end

def apply_coupons(cart, coupons)
  coupons.each do |disc_hash|
    if cart.include?(disc_hash[:item])
      disc_item = disc_hash[:item]
      w_coupon = disc_item + " W/COUPON"
      if cart.include?(w_coupon)
        cart[w_coupon][:count] += 1
        cart[disc_item][:count] -= disc_hash[:num]
      else
        cart[w_coupon] = cart[disc_item].clone
        cart[w_coupon][:price] = disc_hash[:cost]
        cart[w_coupon][:count] = 1
        cart[disc_item][:count] -= disc_hash[:num]
      end
    end
  end
  return cart
end

def apply_clearance(cart)
  cart.each do |food, info|
    if info[:clearance]
      info[:price] *= 0.8
      info[:price] = info[:price].round(2)
      binding.pry
    end
  end
  return cart
end

def checkout(cart, coupons)
  # code here
end
