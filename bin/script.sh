#!/usr/bin/env ruby

puts "I'm alive, dammit!!!"

puts `vagrant ssh -- "ls -al /vagrant; ls -al /vagrant/bin ; /vagrant/bin/polyverse.sh" `
