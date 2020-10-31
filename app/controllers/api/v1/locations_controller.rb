module Api::V1
  class LocationsController < ApplicationController
    before_action :validate_location_params

    #
    # POST /send_location
    #
    def send_location
      location = driver.location
      if location.present?
        location.update!(update_params)
      else
        ::Location.create!(update_params)
      end
      api_render json: { success: 'success'.freeze }, status: 202
    end

    #
    # GET passenger/available_cabs
    #
    def available_cabs
      nearby_available_cabs = ::Api::V1::Passenger.new(
        location_params[:latitude], location_params[:longitude]
      ).nearby_available_cabs
      response = nearby_available_cabs.present? ? { available_cabs: nearby_available_cabs } : { "message": "No cabs available!" }
      api_render json: response
    end

    private

    def driver
      @driver ||= ::Driver.find(params[:driver_id])
    end

    def update_params
      params.permit(:latitude, :longitude, :driver_id)
    end

    def location_params
      params.permit(:latitude, :longitude)
    end

    #####################
    #VALIDATIONS#
    #####################

    def validate_location_params
      raise BadRequest.new('Invalid Parameters') unless (params[:latitude].present? && params[:longitude].present?)
    end

  end
end