module Enumerable
  def my_each
    return self unless block_given?
    i = 0
    while i < self.size do
      yield(self[i])
      i += 1
    end
    return self
  end


  def my_each_with_index(start = 0, finish = self.size)
    return self unless block_given?
    i = start
    while i < finish do
      yield(self[i], i)
      i += 1
    end
    return self
  end


  def my_all?(Regex)
    i = 0
    while i < self.size do
      return false unless yield(self[i])
      i += 1
    end
    return true
  end


  def my_any?
    i = 0
    while i < self.size do
      return true if yield(self[i])
      i += 1
    end
    return false
  end


  def my_count
    return self.size unless block_given?
    i = 0
    count = 0
    while i < self.size
      count += 1 if yield(self[i])
      i += 1
    end
    return count
  end


  def my_inject(initial_value = 0)
    i = 0
    while i < self.size
      initial_value = yield(initial_value, self[i])
      i += 1
    end
    initial_value
  end


  def my_map
    return self unless block_given?
    i = 0
    new_self = []
    while i < self.size
      new_self << yield(self[i])
      i += 1
    end
    new_self
  end


  def my_none?
    i = 0
    while i < self.size
      return false if yield(self[i])
      i += 1
    end
    return true
  end


  def my_select
    return self unless block_given?
    i = 0
    new_self = []
    while i < self.size
      new_self << self[i] if yield(self[i])
      i += 1
    end
    new_self
  end
end