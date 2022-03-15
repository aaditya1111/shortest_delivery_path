class ShortestDistance

  # Returns the distance between these two
  # points in either miles or kilometers


  def main_method

    #Assuming latX, lonY will contain float as values
    # For Ex: latA = 2323.2324240
    #         lonA = 7698.23324

    latA = 18.175702,
    lonA = 73.356194,
    latR2 = 18.154988,
    lonR2 = 73.295022,
    latR1 = 19.115143,
    lonR1 = 72.854969,
    latC1 = 19.184224,
    lonC1 = 72.820271,
    latC2 = 19.136132,
    lonC2 = 72.792327

    possible_combs =  { 'A R2 R1 C1 C2' => [latA, lonA, latR2, lonR2, latR1, lonR1, latC1, lonC1, latC2, lonC2],
                        'A R2 R1 C2 C1' => [latA, lonA, latR2, lonR2, latR1, lonR1, latC2, lonC2, latC1, lonC1],
                        'A R1 C1 R2 C2' => [latA, lonA, latR1, lonR1, latC1, lonC1, latR2, lonR2, latC2, lonC2],
                        'A R2 C2 R1 C1' => [latA, lonA, latR2, lonR2, latC2, lonC2, latR1, lonR1, latC1, lonC1],
                        'A R1 R2 C1 C2' => [latA, lonA, latR1, lonR1, latR2, lonR2, latC1, lonC1, latC2, lonC2],
                        'A R1 R2 C2 C1' => [latA, lonA, latR1, lonR1, latR2, lonR2, latC2, lonC2, latC1, lonC1]
                      }

    travel_speed = 20.0;

    values = travel_time_calculation(possible_combs, travel_speed)
    values.sort_by {|key, value| value}
    shortest_path = values.first[0].to_s

    #Shortest Path will be in string format
    return shortest_path
  end

  def travel_time_calculation(possible_combs, travel_speed)
    route_time_hash = {}

    possible_combs.each do |route, coords|

      total_time = 0.0
      routes = route.split(' ')

      routes.each_with_index do |entity, index|

        break if index == routes.length - 1

        distance = 0.0

        lat_a = coords.select{|t| t == "lat#{entity}"}.flatten
        lon_a = coords.select{|t| t == "lon#{entity}"}.flatten

        lat_b = coords.select{|t| t == "lat#{routes[index + 1]}"}.flatten
        lon_b = coords.select{|t| t == "lon#{routes[index + 1]}"}.flatten

        distance = haversine_distance(lat_a, lon_a, lat_b, lon_b, false)
        time = distance/travel_speed

        total_time += time
      end

      route_time_hash[route] = total_time
    end
  end


  def haversine_distance(lat_1, lon_1, lat_2, lon_2, miles=false)

    # Accepts four coordinates (latitides & longitudes) in the form
    # of a float. I.e.
    #   miles  Boolean

    # Calculate radial arcs for latitude and longitude
    dLat = (lat2 - lat1) * Math::PI / 180
    dLon = (lon2 - lon1) * Math::PI / 180


    a = Math.sin(dLat / 2) *
        Math.sin(dLat / 2) +
        Math.cos(lat1 * Math::PI / 180) *
        Math.cos(lat2 * Math::PI / 180) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2)

    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

    return d = 6371 * c * (miles ? 1 / 1.6 : 1)
  end

end
