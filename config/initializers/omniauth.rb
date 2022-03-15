
require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "617a6814f63f4de6be98b264feae2ad0", "57434de19c404fe29773701e552083a6", scope: 'user-read-email user-top-read user-library-read'
end
