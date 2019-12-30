# What is this?
This docker image can cache Github API response to save time and don't go out of limit

# How to use
Edit docker-compose as you want and run it
```
docker-compose up -d
```
Change your app setting to target the cache layer, for example, this request:

`https://api.github.com/repos/bitcoin/bitcoin/commits`

Need to be replaced with:
`http://<docker ip>:8080/api/repos/bitcoin/bitcoin/commits`

# Example

Without cache layer

```
curl https://api.github.com/repos/bitcoin/bitcoin/commits -I
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 59
```
```
curl https://api.github.com/repos/bitcoin/bitcoin/commits -I
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 58
```

With cache layer

```
curl "http://<docker ip>:8080/api/repos/bitcoin/bitcoin/commits" -I
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 59
X-CACHED: MISS
```

```
curl "http://<docker ip>:8080/api/repos/bitcoin/bitcoin/commits" -I
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 59
X-CACHED: REVALIDATED
```

You can also use the auth token for more rate limit: https://developer.github.com/v3/#rate-limiting
