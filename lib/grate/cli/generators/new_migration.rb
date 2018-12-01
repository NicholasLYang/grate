require 'active_support/time'

class NewMigration

  def get_time_string
    Time.now.in_time_zone('US/Eastern').strftime("%Y%m%d%H%M%S")
  end
end
