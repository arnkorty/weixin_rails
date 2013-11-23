module WeixinRails
  module Routes
    class Matches
      def initialize(options, &block)
        @type       = options[:type]     if options[:type]
        @content    = options[:content]  if options[:content]
        @from       = options[:from]     if options[:from]
        @constraint = block if block_given?
        @flag       = true
      end
      # class << self
      def matches?(request) 
        pms = WeixinRails::Paramers.new(request.params)                
        flag = true
        %w(type content from).each do |attr|
          value = instance_variable_get "@#{attr}"
          if value
            pms_value = pms.send(attr)
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