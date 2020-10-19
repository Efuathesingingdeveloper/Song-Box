Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['1100950553633768'], ENV['69d379ca01408993e7d73e1728ea1249']
  end