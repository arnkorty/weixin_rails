module WeixinRails
end
require 'weixin_rails/rails/paramers'
require 'weixin_rails/rails/routes/mapper_extensions'
require 'weixin_rails/rails/routes/matches'
ActionDispatch::Routing::Mapper.send :include, WeixinRails::Routes::MapperExtensions