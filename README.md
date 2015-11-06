# Norikra::Listener::Mackerel

## Description

Norikra listener plugin to post service metrics for Mackerel.

## Installation

```sh
$ gem install norikra-listener-mackerel
```

## Usage

Add your query with group `MACKEREL(service_name,[mackerel_api_key])`.

If API key is not specified, read it from environment variable `MACKEREL_APIKEY`.

## Examples

```sql
SELECT sum(foo) AS foo_sum, avg(foo) AS foo_avg FROM bar_target.win:time_batch(1 min)
-- group MACKEREL(baz_service)
```

Post service metrics "foo\_sum" and "foo\_avg" to service "baz_service".

## Author

Fujiwara Shunichiro <fujiwara.shunichiro@gmail.com>

## License

GPLv2
