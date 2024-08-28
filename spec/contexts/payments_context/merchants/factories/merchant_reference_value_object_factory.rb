# frozen_string_literal: true

module PaymentsContext
  module Merchants
    module Factories
      class MerchantReferenceValueObjectFactory
        def self.build(value = Faker::Internet.unique.username)
          value
        end
      end
    end
  end
end
