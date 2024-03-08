module RateLimiter
  extend self

  # Checks if the rate limit is exceeded based on a custom key.
  #
  # @param key [String] The custom key for rate limiting.
  # @param limit [Integer] The maximum number of requests allowed within the specified interval.
  # @param interval [Integer] The duration to rate limit for in seconds.
  # @return [Boolean] Returns true if the rate limit is exceeded, false otherwise.
  def is_exceeded?(key, limit, interval)
    cache_key = "v1_rate_limit:#{key}"
    limit?(cache_key, limit, interval)
  end

  private

  def limit?(key, limit, interval)
    current_count = CACHE_STORE.increment(key, 1, expires_in: interval)
    return current_count > limit
  end
end