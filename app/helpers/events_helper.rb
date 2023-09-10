module EventsHelper
  def next_event
    OpenStruct.new(
      venue: venue,
      url: ENV.fetch("EVENT_URL", "")
    )
  end

  def next_event_venue
    next_event.venue
  end

  def venue
    OpenStruct.new(
      name: ENV.fetch("VENUE_NAME", ""),
      address: ENV.fetch("VENUE_ADDRESS", "")
    )
  end

  def venue_map_url
    ENV.fetch("VENUE_MAP_URL", "")
  end

  def show_registration?
    ENV["HIDE_REGISTRATION"] != "true" && next_event.url.present?
  end
end
