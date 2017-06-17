module Concerns::Plane::Status::History
  extend ActiveSupport::Concern

  included do
    has_paper_trail only: [:status], on: [:create, :update], skip: [:id, :flight]
  end

  def status_history
    res = ''
    versions.each { |v| res << add_status_content(v) }
    res
  end

  private

  def add_status_content(version)
    statuses = version.changeset['status']
    old = statuses[0]
    new = statuses[1]

    if old.nil?
      "In the room since #{version.created_at}\\n"
    else
      "Has changed his status from #{old} to #{new} in #{version.created_at}\\n"
    end
  end
end
