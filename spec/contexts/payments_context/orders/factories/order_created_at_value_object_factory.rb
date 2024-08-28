# frozen_string_literal: true

module PaymentsContext
  module Orders
    module Factories
      class OrderCreatedAtValueObjectFactory
        def self.build(value = Time.current)
          value
        end
      end
    end
  end
end
