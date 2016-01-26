defmodule HotelsTest do
  use ExUnit.Case
  doctest Hotels

  test "find first hotel room number" do
    hotel = "*"
    assert Hotels.find(hotel) == 111
  end

  test "find 3rd building 1st room number" do
    hotel = "#  #  *  #  #"
    assert Hotels.find(hotel) == 311
  end

  test "find 9th building 1st room" do
    hotel = " 
         #####
         #####           ######
         #####           ######
#  #  #  #####  #  #  #  ######  *"
    assert Hotels.find(hotel) == 911 
  end

  test "find 5th building 2nd floor 3rd room" do
    hotel = "
#
#  #
#  #  ##
#  #  ##  ###
#  #  ##  ###  #####
#  #  ##  ###  ##*##  ########
#  #  ##  ###  #####  ########"
    assert Hotels.find(hotel) == 523
  end 

  test "find 2nd building 8th floor 1st room" do
    hotel = "
           #  
           *  
           #  
           #  
           #  
           #  
           #  
           #  
#########  #  #"
    assert Hotels.find(hotel) == 281
  end 


  test "find highest possible room number" do
    hotel = "
                        ########*
                        #########
                        #########
                        #########
                        #########
                        #########
                        #########
                        #########
#  #  #  #  #  #  #  #  #########"
    assert Hotels.find(hotel) == 999
  end 

end
