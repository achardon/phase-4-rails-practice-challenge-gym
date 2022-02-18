class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def create
        memb = Membership.create!(membership_params)
        render json: memb, status: :created
    end

    private

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
