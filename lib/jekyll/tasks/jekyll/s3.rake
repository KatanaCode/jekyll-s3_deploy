# frozen_string_literal: true

require 'dotenv/tasks'

namespace :jekyll do
  namespace :s3 do
    desc 'Deploy the code from _site to amazon S3'
    task deploy: :dotenv do
      bucket = ENV['S3_BUCKET'] || (puts('Please provide S3_BUCKET') and exit(1))
      auth_options = if ENV.key?('AWS_ACCESS_KEY_ID') && ENV.key?('AWS_SECRET_ACCESS_KEY')
                       ''
                     else
                       profile = ENV['S3_PROFILE']
                       puts('Please provide S3_PROFILE') && exit(1) if profile.nil?
                       "--profile #{profile}"
                     end
      system("aws s3 sync _site s3://#{bucket} --delete #{auth_options}".strip)
    end
  end
end
