User.create!({ :email => "bob1@test.com", :password => "bob1" })
User.create!({ :email => "bob2@test.com", :password => "bob2" })
User.create!({ :email => "bob3@test.com", :password => "bob3" })

Band.create!({ :name => "band1" })
Band.create!({ :name => "band2" })
Band.create!({ :name => "band3" })

Album.create!({ :name => "album1", :band_id => 1, :version => "live" })
Album.create!({ :name => "album2", :band_id => 2, :version => "live" })
Album.create!({ :name => "album3", :band_id => 3, :version => "live" })

Track.create!({ :name => "track1", :album_id => 1, :version => "regular", :lyrics => "you the one" })
Track.create!({ :name => "track2", :album_id => 1, :version => "regular", :lyrics => "oh baby" })
Track.create!({ :name => "track3", :album_id => 1, :version => "bonus", :lyrics => "the night is young" })



