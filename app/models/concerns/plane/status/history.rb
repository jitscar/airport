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
    old_status = statuses[0]
    new_status = statuses[1]

    # При создании первой версии старый статус не определен
    if old_status.nil?
      get_init_content(version.created_at) + "\n"
    else
      get_updating_content(old_status, new_status, version.created_at) + "\n"
    end
  end

  def get_init_content(date_time)
    I18n.t('plane.status_history.content.init',
           status: I18n.t('plane.status.in_the_room'),
           date: I18n.l(date_time, format: :default_datetime))
  end

  def get_updating_content(old_status, new_status, date_time)
    I18n.t('plane.status_history.content.update',
           from: I18n.t("plane.status.#{old_status}"),
           to: I18n.t("plane.status.#{new_status}"),
           time: I18n.l(date_time, format: :only_time))
  end
end
