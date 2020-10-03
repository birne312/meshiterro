worker_processes 2
listen "/var/run/unicorn/unicorn.socket"
pid '/tmp/unicorn.pid'
log = '/var/www/rails/meshiterro/log/unicorn.log'
stderr_path = '/var/www/rails/meshiterro/log/error.log'
stdout_path = '/var/www/rails/meshiterro/log/unicorn.log'
preload_app true
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true
before_fork do |server, worker|
defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
old_pid = "#{ server.config[:pid] }.oldbin"
unless old_pid == server.pid
begin
sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
Process.kill :QUIT, File.read(old_pid).to_i
rescue Errno::ENOENT, Errno::ESRCH
end
end
end
after_fork do |server, worker|
defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
