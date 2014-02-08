class Hanoi
  def initialize
    @sticks = [[3, 2, 1],[],[]]
  end

  def render
    str = ""
    @sticks.each do |stick|
      3.times do |i|
        disk = stick[i]
        if disk
          str += "#{disk}"
        else
          str += "-"
        end
      end
      str += "\n"
    end
    str[0..-2]
  end

  def move(start_pos, end_pos)
    disk = @sticks[start_pos].pop
    target_disk = @sticks[end_pos].last
    if target_disk
      raise StandardError.new("Invalid move!") if disk > target_disk
    end
    @sticks[end_pos].push(disk)
  end

  def won?
    # Make sure all sticks, besides last stick, is empty
    @sticks.each do |stick|
      if stick != @sticks.last
        return false unless stick.empty?
      end
    end

    # Makr sure last stick is in reverse order
    last_stick = @sticks.last
    sorted_stick = last_stick.sort.reverse
    return true if last_stick == sorted_stick
    false
  end
end