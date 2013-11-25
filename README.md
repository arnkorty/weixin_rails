# WeixinRails

This project rocks and uses MIT-LICENSE.
## use
### in Gemfile
```ruby
gem 'weixin_rails', github: 'arnkorty/weixin_rails'
gem 'actionpack-xml_parser' # rails4以上需要添加,并添加以下代码支持xml request
## 在 config/application.rb 添加以下代码
## config.middleware.insert_after ActionDispatch::ParamsParser, ActionDispatch::XmlParamsParser
```
### in routes

对应的路由方法有 text, link, image, event, voice video

**:as 参数对应的值不能一样**
```ruby
## routes.rb
scope :path => "/你的微信接口地址"   do 
  # content 为微信请求的 Content
  weixin_rails_for_signature 'weixin#text', as: :weixin_signature
  weixin_for_text 'weixin#index', content: /\d/, as: :weixin_text_d
  weixin_for_text 'weixin#image', as: 'weixin_image',content: /天池/
  weixin_for_link 'weixin#link', as: 'weixin_link'
  weixin_for_event 'weixin#location', event: 'location', as: 'weixin_link'
end
```
