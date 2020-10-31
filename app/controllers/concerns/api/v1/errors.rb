module Api::V1::Errors
  extend ::ActiveSupport::Concern


  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_bad_request
    rescue_from ActiveRecord::RecordNotFound, with: :render_bad_request
    rescue_from ActiveRecord::RecordNotUnique, with: :render_bad_request
    rescue_from ::Unauthorized, with: :render_bad_request
    rescue_from ::BadRequest, with: :render_bad_request
    rescue_from ::Forbidden, with: :render_bad_request
    rescue_from ::ValidationFailed, with: :render_bad_request
    rescue_from ::ValidationsFailed, with: :render_bad_request
    rescue_from ::ArgumentError, with: :render_bad_request

  end
end
