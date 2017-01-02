#begin
#  require 'hirb'
#rescue LoadError
#  # Missing goodies, bummer
#end

if defined? Hirb
  # Slightly dirty hack to fully support in-session Hirb.disable/enable toggling
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = _pry_.config.print
      _pry_.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || @old_print.call(output, value)
      end
    end

    def disable_output_method
      _pry_.config.print = @old_print
      @output_method = nil
    end
  end

  Hirb.enable
end

## mine gives true
#_pry_.config.pager
#
## mine gives an instance of _pry_::Pager
#_pry_.pager
#
## mine gives an instance of _pry_::Pager::SystemPager
#_pry_.pager.send(:best_available)
#
## mine pages nums 1 to 100, correctly
#_pry_.pager.page [*1..100].join("\n")
#
## mine lists my pry plugins that are installed, plus nil
#$LOADED_FEATURES.grep(/pry/).map { |s| s[/^.*?(?=\/lib\/)/] }.uniq
#
## mine prints #<Proc...lib/pry.rb:20>
#_pry_.config.print
#
## mine is true
#_pry_.config.print == _pry_::DEFAULT_PRINT
#
## mine prints "2"
#_pry_.config.print.call nil, "2", _pry_

def Pry.set_color sym, color
  CodeRay::Encoders::Terminal::TOKEN_COLORS[sym] = color.to_s
  { sym => color.to_s }
end
Pry.set_color :integer, "\e[1;36m"

Pry.config.color = true
Pry.config.prompt = proc do |obj, nest_level, _pry_|
  prefix = ""
  prefix << "\001\e[0;31m\002"
  prefix << "Rails_#{Rails.version} / " if defined? Rails
  prefix << "Ruby_#{RUBY_VERSION}"
  prefix << "\001\e[0m\002"
  
  "#{prefix} #{Pry.config.prompt_name}(#{Pry.view_clip(obj)})> "
end

begin
  require "awesome_print"
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError
  puts "no awesome_print :("
end
