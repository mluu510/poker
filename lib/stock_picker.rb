def stock_picker(arr)
  high_profit = 0
  buy_sell_date = nil
  arr.each_with_index do |price1, day1|
    arr.each_with_index do |price2, day2|
      next if day1 >= day2
      profit = price2-price1
      if profit > high_profit
        high_profit = profit
        buy_sell_date = [day1,day2]
      end
    end
  end
  buy_sell_date
end