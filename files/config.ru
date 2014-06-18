# Based on lheinlen/geminabox by:
#           Lucas Heinlen <lucas.heinlen@gmail.com>

require 'rubygems'
require 'geminabox'

Geminabox.data = '/opt/geminabox/data'
Geminabox.build_legacy = !!ENV['BUILD_LEGACY']
run Geminabox::Server
