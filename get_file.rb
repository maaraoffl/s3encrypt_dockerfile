require 'aws-sdk'
require 'aws-sdk-core'
require 's3encrypt'

local_filename = ARGV[0]
remote_filename = ARGV[1]
bucket = ARGV[2]
context = ARGV[3]
masterkmskey = ARGV[4]

config = Hash.new
config[:region] = 'us-east-1'
config[:access_key_id] = ENV["AWS_ACCESS_KEY_ID"]
config[:secret_access_key] = ENV["AWS_SECRET_ACCESS_KEY"]

Aws.config = config
Aws.use_bundled_cert!

S3encrypt.putfile(local_filename, remote_filename, bucket, context, masterkmskey)
