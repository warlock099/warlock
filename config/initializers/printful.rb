require "printful_api"

PrintfulAPI.api_key = Rails.application.credentials[Rails.env.to_sym][:printful_key]
