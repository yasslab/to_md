require "to_md/version"

module ToMd
  refine(Array) do
    def to_md
      map {|s| "- #{s}"}.join($/)
    end
  end
end
