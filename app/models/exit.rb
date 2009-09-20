class Exit < ActiveCouch::Base
  site YAML::load(File.open(File.join(Rails.root,
                  'config', 'activecouch.yml')))[Rails.env]['site']
  has :orientation
  has :description
  has :type
  has :ref
end
