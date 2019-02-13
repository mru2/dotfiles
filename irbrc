if defined?(IRB)
  require 'irb/completion'
  require 'irb/ext/save-history'

  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
  IRB.conf[:PROMPT_MODE] = :SIMPLE
  IRB.conf[:AUTO_INDENT] = true
end

%w[json rubygems pp ostruct securerandom csv faraday].each do |gem|
  begin
    require gem
  rescue LoadError
    puts "Failed to load #{gem} gem."
  end
end

ANSI_BOLD = "\033[1m"
ANSI_RESET = "\033[0m"
ANSI_LGRAY = "\033[0;37m"
ANSI_GRAY = "\033[1;30m"
ANSI_BLUE = "\033[1;33m"
ANSI_RED = "\033[1;32m"

class Object
  def pm # Print methods
    methods = self.class.instance_methods(false)

    data = methods.sort.collect do |name|
      method = self.method(name)
      if method.arity == 0
        args = "()"
      elsif method.arity > 0
        n = method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")})"
      elsif method.arity < 0
        n = -method.arity
        args = "(#{(1..n).collect {|i| "arg#{i}"}.join(", ")}, ...)"
      end
      klass = $1 if method.inspect =~ /Method: (.*?)#/
      [name, args, klass]
    end
    max_name = data.collect {|item| item[0].size}.max
    max_args = data.collect {|item| item[1].size}.max
    data.each do |item|
      print "#{ANSI_LGRAY}#{item[0].to_s.rjust(max_name)}#{ANSI_RESET}"
      print "#{ANSI_BLUE}#{item[1].to_s.ljust(max_args)}#{ANSI_RESET}"
      print "#{ANSI_RED}#{item[2]}#{ANSI_RESET}\n"
    end
    data.size
  end
end
