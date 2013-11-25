module WeixinRails
  class Paramers
    URL_TYPES = %w(type content from_user to_user event)
    URL_TYPES.each do |t|
      attr_reader t.to_sym
    end
    attr_reader :created_at, :msg_id
    # attr_reader :type, :content, :from
    def initialize(params, &block)
      pms = params[:xml] #|| params
      if pms 
        pms.to_options!
        @type        = pms[:MsgType]
        @content     = pms[:Content]
        @from_user   = pms[:FromUser] || pms[:FromUserName]
        @to_user     = pms[:ToUser]   || pms[:ToUserName]
        @event       = pms[:Event]
        @created_at  = pms[:CreateTime]
        @msg_id      = pms[:MsgId]
      end
    end
  end
end