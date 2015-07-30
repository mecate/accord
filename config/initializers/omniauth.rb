OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'407703909423369','da0a0516c5dcd47027f15200642c2e6f', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end