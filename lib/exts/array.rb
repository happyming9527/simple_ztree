# -*- encoding : utf-8 -*-
class Array
  def to_ztree_node(*args)
    opts = args.extract_options!
    checked_ids = opts[:checked_ids] ? opts[:checked_ids].split(',') : []
    opts.delete(:checked_ids)
    self.inject([]) do |nodes, h|
       ha = {
         id: h.id,
         name: h.name,
         pId: h.parent_id.blank? ? 0 : h.parent_id, 
         open: false
       }
       [opts, args].each do |opt|
         opt.to_h.each do |symb, metd|
           val =  h.respond_to?(metd) ? h.send(metd) : metd
           ha = ha.merge(symb => val)
           ha = ha.merge(checked: true) if checked_ids.include?(h.id.to_s)
         end
       end
       nodes << ha
    end
  end
  
  def to_h
    return {} unless self.all? {|a| a.is_a?(Symbol) || a.is_a?(String)}
    self.inject({}) {|h,a| h[a] = a;h }  
  end

  def to_sorted_nodes
    self.group_by(&:parent_id).each {|k,v| v.sort_by! {|a| a.send(a.class.order_column) }}.to_a.flatten.select{|c| !c.is_a?Integer}.compact
  end
end
