defmodule Hotels do
  
  def find(hotel) do    
    floors = hotel
             |> String.split("\n")
             |> Enum.reverse
             |> Enum.with_index
    

    [{floor_no, room_idx}] = floors
                             |> Enum.filter_map(fn({rooms, _}) ->
                                                  String.contains?(rooms, "*")
                                                end,
                                                fn({rooms, floor_idx}) ->
                                                  {floor_idx+1, room_idx(rooms)}
                                                end)

    IO.puts "floor number: #{floor_no}, room index: #{room_idx}"
    
    {building_no, room_no} = find_building_from_room_idx(floors, room_idx)

    (building_no * 100) + (floor_no * 10) + room_no
  end

  def room_idx(rooms) do
    rooms
    |> String.to_char_list
    |> :string.chr(?*)
  end

  def find_building_from_room_idx(floors, room_idx) do
    {first_floor,0} = List.first floors
    buildings = String.slice(first_floor, 0..room_idx-1)
                |> String.split("  ")
    
    building_no = Enum.count(buildings)

    IO.puts "building no: #{building_no}"

    room_no = buildings 
              |> List.last
              |> String.length 
    
    IO.puts "room no: #{room_no}" 

    {building_no, room_no}
  end

end
