class ApplicationController < ActionController::API

  include Api::V1::Errors
  include Api::V1::ErrorHandlers


  def api_render(json:, meta: nil, status: :ok, root: nil, is_success: true, fields: [])
    if is_success
      data = json
    else
      data = {
          status: 'failure',
          reason: json[:message]
      }
    end
    render json: data, status: status, fields: fields
  end

end

