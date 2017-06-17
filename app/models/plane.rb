class Plane < ActiveRecord::Base
  include AASM
  include Concerns::Plane::Status::History

  validates :flight, presence: true, uniqueness: true
  validates :status, presence: true

  aasm column: :status do
    state :in_the_room, initial: true
    state :scheduled
    state :departed

    event :add_to_schedule do
      transitions from: :in_the_room, to: :scheduled
    end

    event :start_flying do
      transitions from: :scheduled, to: :departed
    end
  end
end