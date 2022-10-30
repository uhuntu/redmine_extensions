module TesRedmineExtensions
  module QueryOutputs
    class TilesOutput < TesRedmineExtensions::QueryOutput

      def self.key
        'tiles'
      end

      def entity
        options[:entity]
      end

      def render_entity_tile(referenced_entity)
        referenced_entity.to_s
      end

    end
  end
end
