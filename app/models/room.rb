class Room < ActiveCouch::Base
  site YAML::load(File.open(File.join(Rails.root,
                  'config', 'activecouch.yml')))[Rails.env]['site']
  has :name
  has :description
  has :sounds
  has :geometry
  has :exits
  has :user_name
  
  # def initialize
  #   super
  #   self.user_name = "me"
  # end

  def to_json
    { "Conference"  => "#{self._id}@#{JABBER_SERVER}",
      "Name"        => self.name,
      "Geometry"    => {
        "Outer"     => [[-3, 3], [3, 3], [3, -3], [-3, -3]],
        "Holes"     => [],
        "Center"    => [0, 0] },
      "Description" => self.description,
      "Sounds"      => self.sounds,
      "Events"      => self.exits
    }.to_json
  end
end
