defmodule HotelsTest do
  use ExUnit.Case
  doctest Hotels

  test "find first hotel room number" do
    hotel = "*"
    assert Hotels.find(hotel) == [{1,1,1}]
  end

  test "find 3rd building 1st room number" do
    hotel = "#  #  *  #  #"
    assert Hotels.find(hotel) == [{3,1,1}]
  end

  test "find 9th building 1st room" do
    hotel = " 
         #####
         #####           ######
         #####           ######
#  #  #  #####  #  #  #  ######  *"
    assert Hotels.find(hotel) == [{9,1,1}] 
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
    assert Hotels.find(hotel) == [{5,2,3}]
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
    assert Hotels.find(hotel) == [{2,8,1}]
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
    assert Hotels.find(hotel) == [{9,9,9}]
  end 

end
