# frozen_string_literal: true

module PaymentsContext
  module OrderCommissions
    module Repositories
      class InMemoryOrderCommissionRepository
        def create(_attributes); end

        def size; end

        def calculate_monthly_amount(*); end
      end
    end
  end
end
