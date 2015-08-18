class Hash

  # 2.0 ruby 已经自带此方法
  def to_h
    self
  end
  
  def have(sub)
    self.to_a.include?(sub.to_a[0])
  end
end
