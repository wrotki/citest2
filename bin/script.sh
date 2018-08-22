#!/usr/bin/env ruby

require 'fileutils'
require 'open3'

#puts `vagrant ssh -- "ls -al /vagrant; ls -al /vagrant/bin ; /vagrant/bin/polyverse.sh" `

Open3.popen2e( "vagrant", "ssh", "--", "ls -al /vagrant; ls -al /vagrant/bin ; /vagrant/bin/polyverse.sh") do |i, oe, t|
    oe.each do |line|
        puts line
    end
end
puts "vagrant ssh - DONE"
