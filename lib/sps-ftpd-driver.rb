#!/usr/bin/env ruby

# file: sps-ftpd-driver.rb

require 'ftpd'
require 'sps-pub'
require 'chronic_between'


class SpsFtpdDriver

  def initialize(dir, sps: {}, between_times: '')

    @dir = dir

    opt = {host: 'sps', port: '59000', topic: 'test'}.merge(sps)

    @sps_topic = opt[:topic]
    @sps_host = opt[:host]
    @sps_port = opt[:port]
    @times = between_times
  end

  def authenticate(user, password)
    true
  end

  def file_system(user)

    fs = Ftpd::DiskFileSystem.new(@dir)

    fs.instance_eval("
      @sps_topic = '#{@sps_topic}'
      @sps_host = '#{@sps_host}'
      @sps_port = '#{@sps_port}'
      @times = '#{@times}'
    ")

    def fs.write(ftp_path, contents)
      
      if @times.empty? or ChronicBetween.new(@times).within?(Time.now) then
        message = "%s: uploaded file %s" % [@sps_topic, ftp_path]
        SPSPub.notice message, address: @sps_host, port: @sps_port
      end
      super(ftp_path, contents)
    end

    fs
  end

end

if __FILE__ == $0 then

  driver = SpsFtpdDriver.new(temp_dir='/tmp/')
  server = Ftpd::FtpServer.new(driver)
  #server.port = 21
  server.start
  puts "Server listening on port #{server.bound_port}"
  gets

end
