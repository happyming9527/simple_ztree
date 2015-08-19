require "rails"
require "exts/hash"
require "exts/array"
require "assets/rails/engine"
require "ztree/active_record"
require "ztree/sort_tree"
require "ztree/controller"
require "ztree/helpers"

class ActionController::Base
  include Ztree::Controller
  helper_method :ztree_settings
end

module ApplicationHelper
  include Ztree::Helpers
end

ActiveRecord::Base.send :include, SortTree
