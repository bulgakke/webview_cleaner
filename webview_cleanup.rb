# A Ruby script to help clean up all of the cache WebView leaves on your phone 
# taking up space for no good reason. 

# Usage: 
# Get Root access on your phone
# Install any terminal emulator (Termux works)
# $ pkg install ruby -y
# $ pkg install tsu -y
# $ curl it > webview_cleanup.rb
# $ sudo ruby webview_cleanup.rb

class Cleaner
  def initialize
    raise "Launch me with `sudo`" unless root?
    @deleted_size = 0
    @dirs_deleted = 0
    run
  end

  def run
    puts 'Hello and welcome! Today I will bring destruction to WebView garbage!'
    list = dir_list 
    puts "#{list.size} of them have WebView browser metrics..."
    list.each do |dir|
      size = `du -bs #{dir}`.split.first.to_i
      @deleted_size += size
      `rm -rf #{dir}`
      @dirs_deleted += 1
    end

    puts ''
    size = human_readable(@deleted_size)
    puts "Total: #{size}"
    puts "Average memory per dir: #{size.to_f / @dirs_deleted)}"
  end

  def dir_list
    names = entries('/data/data')
    puts "Found #{names.size} entries in /data/data"
    names.map! { |name| "/data/data/#{name}/app_webview/BrowserMetrics" }
    names.reject { |name| !Dir.exist?(name) }
  end

  def entries(path)
    `ls -A #{path}`.split 
  end

  def human_readable(integer)
    i, units = case integer
    when 0...1000
      [integer, 'Bs']
    when 1000...1_000_000
      [integer.to_f / 1000, 'kBs']
    else
      [integer.to_f / 1_000_000, 'MBs']
    end
    "#{i} #{units}"
  end

  def root?
    return true if ENV['USER'] == 'root'
    return true if ENV['SUDO_USER']

    false
  end
end

Cleaner.new
