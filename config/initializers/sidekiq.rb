# # provider = ENV.fetch('SIDEKIQ_REDIS_PROVIDER', 'SIDEKIQ_REDIS_URL')
# # url      = ENV[provider] || ENV['SIDEKIQ_REDIS_URL'] || ENV['REDIS_URL']
# # timeout  = Float(ENV.fetch('REDIS_TIMEOUT', 0.5))

# Sidekiq.configure_client do |config|
#   config.redis = {
#     url:          url,
#     size:         Integer(ENV.fetch('REDIS_POOL', 1)),
#     timeout:      timeout,
#     pool_timeout: timeout
#   }
# end

# Sidekiq.configure_server do |config|
#   config.poll_interval = 10
#   config.redis = {
#     url: url,
#     size: Sidekiq.options[:concurrency] + 2
#   }
# end

# Sidekiq.default_worker_options = { queue: 'medium', backtrace: true }