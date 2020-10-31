module Api::V1
  class DriversController < ApplicationController
    before_action :validate_register_params, only: :register

    #
    # POST /api/v1/driver/register
    #
    def register
      driver = ::Driver.create!(create_params)
      api_render json: driver.slice(:id, :name, :email, :phone_number, :license_number, :car_number), status: 201
    end

    private

    def driver
      @driver ||= ::Driver.find(params[:id])
    end

    def create_params
      params.permit(:name, :email, :phone_number, :license_number, :car_number)
    end

    #####################
    #VALIDATIONS#
    #####################

    def validate_register_params
      raise BadRequest.new('Invalid Parameters') unless %i[name email phone_number license_number car_number].all? {|s| params.key? s}
    end

  end
end