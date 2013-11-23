module WeixinRails
  module Routes
    module MapperExtensions      

      def weixin_rails_for(*args, &block)

        options = args.extract_options!
        matches = {}  
        WeixinRails::Paramers::URL_TYPES.each do |m|
          matches[m.to_sym] = options.delete(m.to_sym)
        end
        options[:constraints] ||= WeixinRails::Routes::Matches.new(matches)

        if args.size > 0   
          root( *args, options , &block)
        else
          root( options , &block)
        end
      end
      
      def weixin_rails_for_signature(*args, &block)
        constraints(lambda{|req| req.params[:signature] && req.params[:timestamp]}) do
          root(*args, &block)
        end
      end

      %w(text image voice video location link event).each do |type|
        define_method "weixin_rails_for_#{type}" do |*args, &block|          
          # Rails.logger.debug args
          # Rails.logger.debug '*' * 78
          options = args.extract_options!            
          options[:type] = type  
          if args.size > 0          
            weixin_rails_for(*args, options, &block)
          else
            weixin_rails_for(options, &block)
          end
        end
      end
    end
  end
end