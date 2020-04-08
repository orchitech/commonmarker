# frozen_string_literal: true

require 'mkmf'

$CFLAGS << ' -std=c99'

create_makefile('commonmarker_fixed_sourcepos/commonmarker_fixed_sourcepos')
