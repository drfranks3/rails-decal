module GeoHelper
  @@GOOGLE_API_KEY = 'AIzaSyAi-E59X3_vswQ9fwc5xhxoZhPTYe_kARs'
  @@BASE_URI = 'https://maps.googleapis.com/maps/api'

  def build_url(api, format)
    "#{@@BASE_URI}/#{api}/#{format}"
  end

  def call_api(api, format, params)
    url = build_url(api, format)
    params = params.merge({key: @@GOOGLE_API_KEY})
    return JSON.parse(RestClient.get(url, params: params))
  end

  def get_lat_lon(address)
    response = call_api('geocode', 'json', {address: address})
    if response["results"] and response["results"][0]
      return response["results"][0]["geometry"]["location"]
    end
  end

  def get_address(lat, lon)
    response = call_api('geocode', 'json', {latlng: "#{lat},#{lon}"})
    response
  end

  def destinations_dist_from_source(source, destinations)
    destinations = destinations.join("|")
    call_api('distancematrix', 'json', {origins: source, destinations: destinations})
  end
end
