require 'base64'
require 'openssl'
require 'digest/sha1'

policy_document = '{"expiration": "2019-01-01T00:00:00Z",
 "conditions": [
   {"bucket": "thescenery-attachments"},
   ["starts-with", "$key", "uploads/"],
   {"success_action_redirect": "https://the-scenery.com/#/userprofile"},
   {"acl": "private"},
   ["starts-with", "$Content-Type"]
 ]
}'

policy = Base64.encode64(policy_document).gsub("\n","")

signature = Base64.encode64(
    OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'),
        ENV['AWS_SECRET_ACCESS_KEY'], policy)
    ).gsub("\n","")

puts policy

puts signature

puts policy_document
