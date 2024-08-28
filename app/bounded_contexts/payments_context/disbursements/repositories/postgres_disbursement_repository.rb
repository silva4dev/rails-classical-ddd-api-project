# frozen_string_literal: true

module PaymentsContext
  module Disbursements
    module Repositories
      class PostgresDisbursementRepository
        def all
          disbursements = Records::DisbursementRecord.all

          disbursements.map do |disbursement|
            Entities::DisbursementEntity.from_primitives(
              id: disbursement.id,
              merchant_id: disbursement.merchant_id,
              order_ids: disbursement.order_ids,
              amount: disbursement.amount,
              commissions_amount: disbursement.commissions_amount,
              reference: disbursement.reference,
              start_date: disbursement.start_date,
              end_date: disbursement.end_date
            )
          end
        end

        def create(attributes)
          Records::DisbursementRecord.create!(attributes)
        rescue ActiveRecord::RecordNotUnique => e
          raise SharedContext::Errors::DuplicatedRecordError, e
        rescue ActiveRecord::RecordInvalid, ActiveRecord::NotNullViolation => e
          raise SharedContext::Errors::InvalidArgumentError, e
        rescue ActiveRecord::InvalidForeignKey => e
          raise SharedContext::Errors::RecordNotFoundError, e
        end

        def size
          Records::DisbursementRecord.count
        end

        def first_in_month_for_merchant?(merchant_id, date)
          result = Records::DisbursementRecord
                   .where(merchant_id:)
                   .where("start_date >= DATE_TRUNC('month', DATE('#{date}'))")
                   .where("end_date < (DATE_TRUNC('month', DATE('#{date}')) + INTERVAL '1 month')")
                   .count

          result == 1
        end
      end
    end
  end
end
