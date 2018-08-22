#!/usr/bin/env ruby

require 'fileutils'
require 'open3'

Open3.popen2e( "vagrant", "ssh", "--", "ls -al /vagrant; ls -al /vagrant/bin ; /vagrant/bin/polyverse.sh") do |i, oe, t|
    oe.each do |line|
        puts line
    end
end

puts `echo waiting for reboot to complete...; sleep 30; echo reboot complete`

Open3.popen2e( "vagrant", "ssh", "--",  "/vagrant/bin/verify.sh") do |i, oe, t|
    oe.each do |line|
        puts line
    end
end

puts "verify after reboot - DONE"
