class FlyingWorker
  include Sidekiq::Worker

  def perform(plane_id)
    plane = Plane.find(plane_id)
    puts "№ #{plane.flight} started flying..."
    sleep 10
    plane.add_to_departed!
    puts "№ #{plane.flight} was departed!"
  end
end
