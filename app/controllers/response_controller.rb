class ResponseController < ApplicationController
  def respond
    # render json: {'message': 'response from server'}
    render js: "alert('hah')"
  end
end
