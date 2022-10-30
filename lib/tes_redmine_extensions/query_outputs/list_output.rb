module TesRedmineExtensions
  module QueryOutputs
    class ListOutput < TesRedmineExtensions::QueryOutput

      def self.key
        'list'
      end

      def render_period_header
      end

    end
  end
end
