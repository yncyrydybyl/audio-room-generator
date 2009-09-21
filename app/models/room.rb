class Room < ActiveCouch::Base
  site YAML::load(File.open(File.join(Rails.root,
                  'config', 'activecouch.yml')))[Rails.env]['site']
  has :name
  has :description
  has :sounds
  has :geometry
	has :exits
	has :events
  #attr_accessor :exits
  has :user_name
	before_save :create_exits

	def create_exits
		e = JSON.parse self.exits
		e.each { |ex|
			debugger 
			if (ex["orientation"] == "east")
				ev = { 	"Pos" => [-3,0], 
								"Description" => "Ausgang", 
								"Type" => "Link", 
								"Ref" => "#{ex.ref}#W" }
				self.events << ev
			end
		}  
	end
	  
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
	def get_exits
		exithash = JSON.parse self.exits	
	end
end
