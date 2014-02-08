class Array
  def my_transpose
    arr =  Array.new(self.count) { Array.new(self.first.count, nil) }
    # [].tap do |arr|
      self.each_with_index do |rows, r_idx|
        rows.each_with_index do |col, c_idx|
          arr[c_idx][r_idx] = col
        end
      end
    # end
    arr
  end
end