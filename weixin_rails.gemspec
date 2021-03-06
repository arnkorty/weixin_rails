$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "weixin_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "weixin_rails"
  s.version     = WeixinRails::VERSION
  s.authors     = ["arnkorty fu"]
  s.email       = ["arnkorty.fu@gmail.com"]
  s.homepage    = "https://github.com/arnkorty/weixin_rails"
  s.summary     = "weixin rails routes plugin"
  s.description = "rails的微信routes插件"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
