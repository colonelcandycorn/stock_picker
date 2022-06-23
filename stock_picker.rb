def stock_picker(stock_array)
  combinations = Array.new(stock_array.length, 0) { Array.new(stock_array.length, 0) }

  stock_array.each_with_index do |first_day, index|
    stock_array.each_with_index do |second_day, second_index|
      combinations[index][second_index] =
        second_day - first_day unless second_index < index
    end
  end
  
  max_obj = combinations.each_with_index.reduce({}) do |obj, (arr, index)|
    obj[arr.max] = [index, arr.index(arr.max)]
    obj
  end

  max_obj[max_obj.keys.max]
end