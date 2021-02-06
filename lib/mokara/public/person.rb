# frozen_string_literal: true

module Mokara
  module Public
    class Person
      attr_reader :id

      def initialize(id)
        @id = id
      end

      # @return [String]
      def given_names
        data.dig('name', 'given-names', 'value')
      end

      # @return [String]
      def family_name
        data.dig('name', 'family-name', 'value')
      end

      # @return [String]
      def credit_name
        data.dig('name', 'credit-name', 'value')
      end

      # @return [String]
      def visibility
        data.dig('name', 'visibility')
      end

      # @return [Mokara::Public::Email]
      def emails
        Email.new(id: id, data: data['emails'])
      end

      private

      def data
        @data ||= Public.get(action: 'person', id: id)
      end
    end
  end
end
