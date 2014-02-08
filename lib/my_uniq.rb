class Array
  def my_uniq
    [].tap do |arr|
      self.each do |item|
        arr << item unless arr.include?(item)
      end
    end
  end
end