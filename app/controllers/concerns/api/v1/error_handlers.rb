module Concerns
  module ErrorHandlers
  extend ::ActiveSupport::Concern

  def render_bad_request(err)
    api_render json: json_error(err.message), status: :bad_request, is_success: false
  end

  private

  #
  # Create json error for given message
  # @param message [String] Error Message
  #
  # @return [Array] Json Body
  def json_error(message)
    { message: message }
  end
end
end