# For testing on PC

`mkdir /data`
`mkdir /data/data`

$files = 0
names = []
100.times { names << rand(123123).to_s }

names.each do |n| 
  `mkdir /data/data/#{n}`
  if rand(3) == 1
    `mkdir /data/data/#{n}/app_webview`
    `mkdir /data/data/#{n}/app_webview/BrowserMetrics`
    rand(50).times do
      f = File.new("/data/data/#{n}/app_webview/BrowserMetrics/#{rand(100).to_s}.f", 'w')
      rand(10000).times { f.write '1'}
      f.close
      $files += 1 
      print "\r#{$files}"
    end
  end
end

print "\r", "#{$files} created", "\n"
