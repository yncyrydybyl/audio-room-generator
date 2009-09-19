require 'json'

module ActiveCouch
  class RawView
    class << self # Class Methods
      # Variables will store Javascript functions which represent
      # the map/reduce functions respectively
      @map_function, @reduce_function, @database = nil, nil, nil
      attr_reader :database
      
      def map(map_function)
        @map_function = map_function
      end
      
      def reduce(reduce_function)
        @reduce_function = reduce_function
      end
      
      def for_database(database)
        @database = database
      end
      
      def to_json(existing_view = {})
        results_hash = { '_id' => "_design/#{name}", 'language' => 'javascript' }
        results_hash.merge!(existing_view)
        results_hash['views'] = {
          "#{name}" => { 'map' => @map_function }
        }
        results_hash['views']["#{name}"]['reduce'] = @reduce_function unless @reduce_function.nil?
        # Convert to JSON
        results_hash.to_json
      end

      def name
        "#{self}".underscore
      end
      
    end # End Class Methods
  end # End Class RawView
end # End module ActiveCouch