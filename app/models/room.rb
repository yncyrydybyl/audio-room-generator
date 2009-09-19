class Room < ActiveCouch::Base
  site YAML::load(File.open(File.join(Rails.root,
                  'config', 'activecouch.yml')))[Rails.env]['site']
  has :name
  has :description
  has :sounds
  has :geometry
  has :exits
end
