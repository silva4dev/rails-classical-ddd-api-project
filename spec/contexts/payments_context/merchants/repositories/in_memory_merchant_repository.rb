# frozen_string_literal: true

module PaymentsContext
  module Merchants
    module Repositories
      class InMemoryMerchantRepository
        def all; end

        def find_by_id(_id); end

        def create(_attributes); end

        def size; end
      end
    end
  end
end
