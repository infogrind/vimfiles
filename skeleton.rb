#!/usr/bin/ruby
#
# Welcome to a new Ruby script skeleton. You should perform the following steps:
# 1) Change the default config file name below.
# 2) Add / remove options as necessary.
# 3) Start coding (see bottom).

require 'optparse'
require 'pathname'

# Default options
$options = {
    'outdir'    => ENV['HOME'],
    'configfile' => (Pathname.new(ENV['HOME']) +
                     Pathname.new('.foorc')).to_s,
    'verbose'   => false,
    'login'     => 'someuser',
    'password'  => 'somepass',
}

def make_option_parser
    opts = OptionParser.new
    opts.on("-v") {|val| $options['verbose'] = true}
    opts.on("-o", "--outdir VAL", String) do |val|
        $options['outdir'] = val
    end
    opts.on("-l", "--login VAL", String) { |val| $options['login'] = val }
    opts.on("-p", "--password VAL", String) do |val|
        $options['password'] = val
    end
    opts.on("-c", "--config VAL", String) do |val|
        $options['configfile'] = val
    end
    opts.on("-h", "--help") { |val| usage(); exit(1) }

    opts
end

def usage
    $stderr.puts(make_option_parser().to_s)
end

def parse_options
    def read_config_file
        def parse_config_line(line, i)
            debug("Parsing line '#{line}'")
            # Strip comments
            line.sub!(/#.*$/, '')

            case line
            when /^\s*$/
                # do nothing
            when /^\s*([^\s]*)\s*=\s*([^\s]*)\s*$/
                set_option($1, $2, i)
            else
                warning "Line #{i}: Malformed option '#{line}'"
            end
        end

        def set_option(name, val, i)
            if $options[name]
                $options[name] = val
            else
                warning("Line #{i}: unknown option '#{name}'")
            end
        end

        if File.exist?($options['configfile'])
            debug("Opening config file #{$options['configfile']}")
            File.open($options['configfile'], "r") do |file|
                file.each_line do |line|
                    parse_config_line(line.chomp, file.lineno)
                end
            end
        else
            debug "File #{$options['configfile']} doesn't exist"
        end
    end

    opts = make_option_parser

    # We read the command line arguments twice, once before and once after the
    # configuration file is read. This ensures on one hand that options such as
    # verbosity or the configuration file name are parsed before the config file
    # is read, and on the other hand that the command line options still have
    # precedence over the config file.
    opts.parse(*ARGV)
    read_config_file()
    opts.parse(*ARGV)
end



# Debug info display routine
def debug(msg)
    $stderr.puts("DEBUG: #{msg}") if $options['verbose']
end

# Print a warning message
def warning(msg) $stderr.puts("Warning: #{msg}") end

begin
    parse_options
rescue OptionParser::InvalidOption
    $stderr.puts "Syntax error"
    usage()
    exit(1)
end


# Main code begins here
#
