module Ztree
  module Helpers

    def tree_list(link_title = '', opts = {})
      id, cls_name = opts[:id] || 'tree-list', opts[:class] || 'menus_ztree ztree small' 
      ul = content_tag :ul, '', {id: id, class: cls_name, style: "width:260px; overflow:auto;"}.merge(opts)
      init_tree_js(link_title) +  content_tag(:div, ul, class: 'ground fl')
    end

    def init_tree_js(link_title = '')
      js = '$(document).ready(function(){
          $.fn.zTree.init($("#" + treeOpts.current_tree), ztreeSetting, treeOpts.zNodes);
        '
      js += '$(".new_btn").click(function (){
           loading(".menu_content");
           $(".menu_content").load(treeOpts.url + "new");
             return false;
           })' unless link_title.empty?
      js += '});'
      javascript_tag(js)
    end

    def tree_content(link_title = '', opts = {})
      if link_title.empty?
        header = ''.html_safe
      else
        title_link = link_to link_title, opts[:url], :class => "btn btn-small btn-primary new_btn"
        header = content_tag :div, title_link + tip_messages, class: 'page-header'
      end
      right_content = content_tag :div, '', class: "menu_content fl"
      list_content = content_tag :div, tree_list(link_title, style: '') + right_content
      js = '$(document).ready(function(){'
      js += '$(".menu_content").load("' + opts[:current_url] + '");' if opts[:current_url].present?
      js += 'var current_node = $.fn.zTree.getZTreeObj("tree-list").getNodeByParam("id", '+ opts[:current_id] +');
         $.fn.zTree.getZTreeObj("tree-list").selectNode(current_node);
        ' if opts[:current_id].present?
      js += '});'
      content_tag(:section, header + list_content + javascript_tag(js), id: 'tables')
    end

    def tip_messages
      content_tag(:span, "操作成功！", class: 'success hide') +
        content_tag(:span, "操作失败，原因："+(flash[:error].to_s), class: 'failed hide')
    end

  end
end
