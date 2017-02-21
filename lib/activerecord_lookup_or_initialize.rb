require 'active_record'

if defined?(ActiveRecord::Base)
  require "activerecord_lookup_or_initialize/base"
  ActiveRecord::Relation.include ActiverecordLookupOrInitialize::Base
end
