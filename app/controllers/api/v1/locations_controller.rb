module Api::V1
  class LocationsController < ::BaseController

    #
    # POST /users/change_vendor
    #
    def register
      raise BadRequest, 'Invalid Vendor' unless current_user.vendor_ids.include?(change_vendor_attributes[:vendor_id])

      current_user.update!(change_vendor_attributes)
      api_render json: { message: 'Vendor changed successfully.' }
    end

    #
    # GET /users
    #
    def send_location
      resources =  users.c_filter(index_filters)
      render_serializer scope: resources
    end

    private

    def users
      @users ||= current_vendor.users
    end

    #
    # Attributes for change_vendor action
    #
    def change_vendor_attributes
      params.permit(:vendor_id)
    end

    #
    # Filters for index action
    #
    def index_filters
      params.permit(:name_filter, :group)
    end

    #####################
    #### VALIDATIONS ####
    #####################

    #
    # Validations for update action
    #
    def valid_change_vendor?
      param! :vendor_id, Integer, required: true
    end

    #
    # Validate index action
    #
    def valid_index?
      param! :name_filter, String, blank: false
      param! :group, String, blank: false
    end
  end
end