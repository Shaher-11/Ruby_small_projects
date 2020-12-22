def stock_picker(array)   # defiinig the method 
    results = []          # our result
    profit = 0             # set the profit to 0
    array.each_with_index do |buy_price, buy_day|   # each iterates over the array elements with the index 
      array.each_with_index do |sell_price, sell_day|    # nested iteration for selling days 
        if sell_day > buy_day                          # setting the conditio for sell and buy days 
          if (sell_price - buy_price) > profit
            profit = sell_price - buy_price
            results[0] = buy_day
            results[1] = sell_day
          end
        end
      end
    end
    results
    puts "Best day to buy is day  #{results[0]} and for selling the best day is day #{results[1]} for a max profit of $#{profit}" # the final output
  end 
  stock_picker([17,3,6,9,15,8,6,1,10])  # calling the method and passing an array as an argument 
