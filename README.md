# Introducing the Sps-ftpd-driver Gem

    require 'sps-ftpd-driver'

    driver = SpsFtpdDriver.new(temp_dir='/tmp/')
    server = Ftpd::FtpServer.new(driver)
    server.start
    puts "Server listening on port #{server.bound_port}"
    gets

The above script will start an FTP server on an arbitrary port using the */tmp/* directory to store uploaded files. When a file is uploaded, a message is published to the SimplePubSub broker on host 'sps'.

After uploading a file to the FTP server I observed the following SPS message:

<pre>test: uploaded file vcard.xml</pre>

## SPS Options

* topic - the default topic is 'test'
* host - the default host is 'sps'
* port - the default port is 59000.

## Resources

* Monitoring File Write Events from an FTP Server http://www.jamesrobertson.eu/snippets/2015/feb/17/monitoring-file-write-events-from-an-ftp.html
* sps-ftpd-driver https://rubygems.org/gems/sps-ftpd-driver

spsftpddriver gem ftpd ftp sps
