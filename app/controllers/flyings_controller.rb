class FlyingsController < ApplicationController
  def create
    plane_ids = params[:plane_ids]

    if plane_ids.present?
      FlyingService.new(plane_ids).run
      render nothing: true, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end
end
