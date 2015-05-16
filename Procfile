web:            [ "$RAILS_ENV" = "production" ] && bin/start-pgbouncer-stunnel bundle exec unicorn -c ./config/unicorn.rb || bundle exec unicorn -c ./config/unicorn.rb
worker:         env LIBRATO_AUTORUN=1 bundle exec sidekiq -e $RAILS_ENV -i $DYNO -c $SIDEKIQ_CONCURRENCY -q high,3 -q medium,2 -q default,2 -q low,1
workercritical: env LIBRATO_AUTORUN=1 bundle exec sidekiq -e $RAILS_ENV -i $DYNO -c $SIDEKIQ_CONCURRENCY -q critical,5 -q transaction,1
workerstats:    env LIBRATO_AUTORUN=1 bundle exec sidekiq -e $RAILS_ENV -i $DYNO -c $SIDEKIQ_CONCURRENCY -q uncritical