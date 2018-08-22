#!/usr/bin/env ruby

#puts `vagrant ssh -- "ls -al /vagrant; ls -al /vagrant/bin ; /vagrant/bin/polyverse.sh" `

Open3.popen2e( "vagrant", "ssh", "--", "ls -al /vagrant; ls -al /vagrant/bin ; /vagrant/bin/polyverse.sh") do |i, oe, t|
    oe.each do |line|
        puts line
    end
end
puts "vagrant ssh - DONE".yellow
