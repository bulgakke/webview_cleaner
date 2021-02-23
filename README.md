# Description: 

A Ruby script to help clean up all of the cache WebView leaves on your phone 
taking up space for no good reason. 

# Why it happens:

WebView is an Android system component used to display content in some 
applications. It is basically a web browser engine. And it leaves a lot of ~4MB
.pma files in `/data/data/app.that.uses.it/app_webview/BrowserMetrics/` without 
cleaning them up; the only way to free your memory is to reinstall the app or 
to delete them manually (root access and a root explorer app needed) or to use 
this.

It might not happen on all ROMs (?), but it happens to me on a rooted 
Ressurrection Remix 8.6.4 with Android 10. If you see an app taking up too 
much space, it might be it.

# Usage: 

Get Root access on your phone

Install any terminal emulator (Termux works)
```
$ pkg install ruby -y
$ pkg install tsu
$ curl https://raw.githubusercontent.com/bulgakke/webview_cleaner/main/webview_cleanup.rb > webview_cleanup.rb
$ sudo ruby webview_cleanup.rb
```
After that, delete all of Termux's data if you don't want Ruby and other
utilities to take up another ~450 MBs.
