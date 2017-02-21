require 'active_support/concern'

module ActiverecordLookupOrInitialize
  module Base
    extend ActiveSupport::Concern

    included do

      def lookup_or_initialize_by(attributes, &block)
        self.detect { |o| attributes.keys.map{ |k| o.send(k) } == attributes.values } || self.build(attributes, &block)
      end

    end
  end
end
