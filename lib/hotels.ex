defmodule Hotels do

  def find(hotel) do
    hotel
    |> locate_target
  end
  
  def locate_target(hotel) do
    
    buildings = hotel
                |> String.reverse
                |> String.strip(?\s)
                |> String.split("\n")
                |> List.first 
                |> String.split("  ")
                |> length
    
    IO.puts "Buildings #{buildings}"

    floors = hotel
              |> String.split("\n")
              |> Enum.reverse
              |> Enum.map(fn (f) -> String.split(f, "  ", parts: buildings)
                                    |> Enum.map(&String.strip(&1, ?\s))
                                    |> Enum.with_index
                          end)
              |> Enum.with_index

    IO.inspect floors
    
    List.foldl(floors, [], fn({buildings, floor_no}, state) ->
                                      state ++ Enum.filter_map(buildings,
                                                              fn({rooms, _}) ->
                                                                String.contains?(rooms, "*") 
                                                              end,
                                                              fn({rooms, building_no}) ->
                                                                {building_no+1, floor_no+1, :string.chr(String.to_char_list(rooms), ?*)}
                                                              end)
                                    end)
  end

end
