require "to_md/version"

require "to_md/version"

module ToMd
  refine(Array) do
    def to_md
      if first.is_a? Array
        TableBuilder.build first, drop(1)
      elsif all?{|e|e.is_a? Hash}
        TableBuilder.build_with_hash self
      else
        #list
        map {|s| "- #{s}"}.join($/)
      end
    end
  end

  module TableBuilder
    class << self

      def build_with_hash items
        keys = items.map(&:keys).inject(:|)
        build keys, items
      end

      def build header, items
        [
          row(header),
          row(header.map{'---'}),
          *items.map{|item|row item_to_array(header, item)}
        ].join($/)+$/
      end

      def item_to_array header, item
        if Hash === item
          header.map{|key|item[key]}
        else
          item = [*item] unless Array === item
          header.zip(item).map(&:last)
        end
      end

      def row array
        '| '+array.map{|c|escape_cell c}.join(' | ')+' |'
      end

      def escape_cell text
        text.to_s.gsub('|', '&#124;').gsub($/, '&#10;')
      end
    end
  end
end
