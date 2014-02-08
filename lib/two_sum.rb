class Array
  def two_sum
    [].tap do |arr|
      self.each_with_index do |item1, idx1|
        self.each_with_index do |item2, idx2|
          next if idx1 >= idx2
          arr << [idx1, idx2] if item1 + item2 == 0
        end
      end
    end
  end
end