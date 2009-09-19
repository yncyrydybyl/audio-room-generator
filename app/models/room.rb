class Room < ActiveCouch::Base
  site YAML::load(File.open(File.join(Rails.root,
                  'config', 'activecouch.yml')))[Rails.env]['site']
  has :name
  has :description
  has :sounds
  has :geometry
  has :exits
  has :user_name
  
  def to_json
    {
      "Conference" => "#{self._id}@#{JABBER_SERVER}",
      "Name" => self.name,
      "Description" => self.description,
      "Sounds" => self.sounds
    }.to_json
  end
end
