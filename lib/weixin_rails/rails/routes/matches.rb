module WeixinRails
  module Routes
    class Matches
      def initialize(options, &block)        
        WeixinRails::Paramers::URL_TYPES.each do |t|
          instance_variable_set("@#{t}",options[t.to_sym]) if options[t.to_sym]
        end        
        @constraint = block if block_given?
        @flag       = true
      end
      # class << self
      def matches?(request) 
        pms = WeixinRails::Paramers.new(request.params)                
        flag = true
        WeixinRails::Paramers::URL_TYPES.each do |attr|
          value = instance_variable_get "@#{attr}"
          if value
            pms_value = pms.send(attr)
            return false unless pms_value
            if value.is_a? Regexp
              flag = false if  pms_value !~ value 
            else
              flag = false if  pms_value != value
            end
          end
        end                
        flag = flag && @constraint.call(request) if @constraint
        flag 
      end 
    end
  end
end