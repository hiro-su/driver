#!/usr/bin/env ruby

require 'pathname'
$LOAD_PATH << Pathname.new(__FILE__).dirname.join('..', '..', 'lib').expand_path.to_s
$LOAD_PATH << Pathname.new(__FILE__).dirname.join('..', 'lib').expand_path.to_s
require 'twitter'

client = Twitter::Client.new('apikey', 'secret')
p client.db.create("testdb")
