defmodule Hotels do
  import Enum
  import List

  def find(hotel) do    
    # Split into floors, and tag each floor with an index
    floors = hotel
             |> String.split("\n")
             |> reverse
             |> with_index 
    # Search each floor for the "*", and select the rooms idx and floor number
    [{floor_no, room_idx}] = floors
                             |> filter_map(fn({rooms, _}) ->
                                             String.contains?(rooms, "*")
                                           end,
                                           fn({rooms, floor_idx}) ->
                                             {floor_idx+1, room_index(rooms)}
                                           end)
    # With room index & first floor, we can compute building and room number
    {building_no, room_no} = find_building_and_room_numbers(floors, room_idx)
    # Compute int value for Room Number
    (building_no * 100) + (floor_no * 10) + room_no
  end

  defp room_index(rooms) do
    rooms
    |> String.to_char_list
    |> :string.chr(?*)
  end

  defp find_building_and_room_numbers(floors, room_idx) do
    buildings = floors
                |> first_floor
                |> String.slice(0..room_idx-1)
                |> String.split("  ")
    
    building_no = count(buildings)

    room_no = buildings 
              |> last
              |> String.length 
    
    {building_no, room_no}
  end

  defp first_floor(floors) do
    {first_floor,0} = first(floors)
    first_floor
  end

end

