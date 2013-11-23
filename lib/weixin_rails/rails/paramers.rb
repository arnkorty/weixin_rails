module WeixinRails
  class Paramers
    URL_TYPES = %w(type content from event)
    URL_TYPES.each do |t|
      attr_reader t.to_sym
    end
    attr_reader :created_at, :msg_id
    # attr_reader :type, :content, :from
    def initialize(params, &block)
      pms = params[:xml] || params
      if pms 
        @type        = pms[:MsgType]
        @content     = pms[:Content]
        @from        = pms[:FromUserName]
        @event       = pms[:Event]
        @created_at  = pms[:CreateTime]
        @msg_id      = pms[:MsgId]
      end
    end
  end
end