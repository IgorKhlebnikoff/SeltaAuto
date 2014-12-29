module Searchable
  def self.included(base)
    base.class_eval do
      def self.search_by(params)
        where(query_str(params))
      end

      def self.query_str(params)
        query = params.inject([]) do |query, (attr, value)|
          query.push("#{attr} LIKE '%#{value}%'") unless value.blank?
          query
        end
        query.join(' AND ')
      end
    end
  end
end
