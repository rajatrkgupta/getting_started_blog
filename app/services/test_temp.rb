class TestTemp

  def shuffle(input)
    input_collection = input.permutation
    last_input_index = input.length - 1

    input_collection.each do |input_arr|
      output = true
      input_arr.each_with_index do |ele, i|
         matched = if i == 0
          ele <= input_arr[ i+ 1]
        elsif i.even?
          input_arr[i-1] >= ele && (i == last_input_index ? true : ele <= input_arr[i+1])
        else
          input_arr[i-1] <= ele && (i == last_input_index ? true : ele >= input_arr[i+1])
        end

        output = output && matched
      end

      return input_arr if output
    end
  end


end

# SpaceComplexity: O(1)
# TimeComplexity: (n*m) where n is input size and m is the all input combination size

# TestCases:
#   [2, 7, 3, 11, 1, 5]

# input = [2, 1, 5, 3, 11, 7]
# TestTemp.new.shuffle(input)