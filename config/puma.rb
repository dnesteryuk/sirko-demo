environment ENV.fetch('RACK_ENV', 'production')

threads_count = ENV.fetch('PUMA_MAX_THREADS', 4).to_i

threads threads_count, threads_count

workers ENV.fetch('WEB_CONCURRENCY', 1).to_i
