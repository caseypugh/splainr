worker_processes Integer(ENV['UNICORN_WORKERS'] || 3)
listen ENV['PORT'], backlog: Integer(ENV['UNICORN_BACKLOG'] || 15)
timeout Integer(ENV['UNICORN_TIMEOUT'] || 15)
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  if defined?($redis)
    $redis.shutdown { |conn| conn.quit }
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  # if defined?(ActiveRecord::Base)
  #   config = Rails.application.config.database_configuration[Rails.env]
  #   config['pool'] = Integer(ENV['DATABASE_POOL'] || 1)
  #   config['prepared_statements'] = false
  #   ActiveRecord::Base.establish_connection(config)
  # end

  if defined?($redis)
    RedisConnectionPool.new
  end
end
