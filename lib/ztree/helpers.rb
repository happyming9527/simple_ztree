module ActionView 
  module Helpers
    

    def tree_list(link_title = '', opts = {})
      id, cls_name = opts[:id] || 'tree-list', opts[:class] || 'menus_ztree ztree small' 
      ul = content_tag :ul, '', {id: id, class: cls_name, style: "width:260px; overflow:auto;"}.merge(opts)
      init_tree_js(link_title) +  content_tag(:div, ul, class: 'ground fl')
    end

  end
end
