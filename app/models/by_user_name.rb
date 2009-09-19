class ByUserName < ActiveCouch::View
  define(:for_db => 'rooms') {
    with_key 'user_name'
  }
end
