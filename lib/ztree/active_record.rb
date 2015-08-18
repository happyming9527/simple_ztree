module Ztree
  module ActiveRecord
    def ztrees(opts = {}) # 暂时简单实现
      cattr_accessor :order_column
      self.order_column = opts[:order_column] || :order_num
    end
  end
end

class << ActiveRecord::Base
  include Ztree::ActiveRecord
end


