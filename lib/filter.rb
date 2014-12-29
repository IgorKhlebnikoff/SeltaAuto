module Filter
  def self.included(base)
    base.class_eval do
      def self.filter_by(params)
        where(query_str(params))
      end

      def self.query_str(params)
        query = params.inject([]) do |query, (attr, value)|
          query.push("#{attr} = #{value}") unless value.blank?
          query
        end
        query.join(' && ')
      end
    end
  end
end
