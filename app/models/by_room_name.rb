class ByRoomName < ActiveCouch::View
  define(:for_db => 'rooms') {
    with_key 'name'
  }
end
