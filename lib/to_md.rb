require "to_md/version"

module ToMd
  refine(Array) do
    def to_md
      # list
      unless all? {|e| e.is_a?(Array) }
        return map {|s| "- #{s}"}.join($/)
      end

      # table
      [
        "| #{first.join(' | ')} |",
        "|#{' --- |' * first.size}",
        drop(1).map {|s| "| #{s.join(' | ')} |"}.join($/)
      ].join($/) + $/
    end
  end
end
