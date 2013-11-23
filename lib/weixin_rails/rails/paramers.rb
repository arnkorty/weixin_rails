module WeixinRails
  class Paramers
    attr_reader :type, :content, :from, :created_at, :msg_id
    def initialize(params, &block)
      pms = params[:xml] || params
      if pms 
        @type       = pms[:MsgType]
        @content    = pms[:Content]
        @from       = pms[:FromUserName]
        @created_at = pms[:CreateTime]
        @msg_id     = pms[:MsgId]
      end
    end
  end
end