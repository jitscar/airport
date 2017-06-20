class FlyingService
  attr_reader :plane_ids

  def initialize(plane_ids)
    @plane_ids = plane_ids
  end

  def run
    add_planes_to_schedule
    perform_flying_workers
  end

  private

  def add_planes_to_schedule
    plane_ids.each { |id| Plane.find(id).add_to_schedule! }
  end

  def perform_flying_workers
    plane_ids.each { |plane_id| FlyingWorker.perform_async(plane_id) }
  end
end
