default['app']['name'] = 'mirage'
default['app']['environment'] = 'vagrant'

default['app']['repo'] = 'https://github.com/18f/discovery'

default['app']['user'] = 'app-user'
default['app']['group'] = 'app-group'

default['app']['database']['name'] = node['app']['name']
default['app']['database']['host'] = '127.0.0.1'
default['app']['database']['port'] = '5432'
default['app']['database']['username'] = node['app']['name']
default['app']['database']['password'] = 'secret!'

default['app']['secret_key'] = 'K5CFMaND9ML8B671M99QnnEQHbWMvMbOsCy1xYeFx5PFOYhE'

default['app']['ssl']['cert'] = "-----BEGIN CERTIFICATE-----\nMIIDyDCCArACCQD1dSq1mZ7OXzANBgkqhkiG9w0BAQUFADCBpTELMAkGA1UEBhMC\nVVMxCzAJBgNVBAgTAkRDMRMwEQYDVQQHEwpXYXNoaW5ndG9uMSgwJgYDVQQKEx9H\nZW5lcmFsIFNlcnZpY2VzIEFkbWluaXN0cmF0aW9uMQwwCgYDVQQLEwMxOEYxHTAb\nBgNVBAMTFG15dXNhLXN0YWdpbmcuMThmLnVzMR0wGwYJKoZIhvcNAQkBFg5kZXZv\ncHNAZ3NhLmdvdjAeFw0xNDA5MzAyMDU2MDBaFw0xNTA5MzAyMDU2MDBaMIGlMQsw\nCQYDVQQGEwJVUzELMAkGA1UECBMCREMxEzARBgNVBAcTCldhc2hpbmd0b24xKDAm\nBgNVBAoTH0dlbmVyYWwgU2VydmljZXMgQWRtaW5pc3RyYXRpb24xDDAKBgNVBAsT\nAzE4RjEdMBsGA1UEAxMUbXl1c2Etc3RhZ2luZy4xOGYudXMxHTAbBgkqhkiG9w0B\nCQEWDmRldm9wc0Bnc2EuZ292MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC\nAQEAvjU3EZfgUwvGyLtmCKZTIUH/pi2FaP9nOdZBcnLTJJXHggVe5aMeG6tlEeGv\nUuiJdVqZHS0Zh/DpVgWJmJQS8CHHEslBL3HaQRFfWHtcp4GKZEFM6tzi7qRiCYoC\nLnS1UA0Z+w6oobYivbW7YuvR9vWAcgD5f8IxUragaSkdVBjMYijZfqZ6YUgkrxig\nZEbmeAzBb9lUN2j2I69Gu92LIQQdgxfUB3Mnkmec/nUaCzeK0yRPIuTcMijNivwn\ndmFkVnw1Tw3y0PCk6UDLrg8SZTAEqRWZRC4KKNpp4Aqc6PwDTpH3p0tx4dGw4g2r\nyLyiEijPlKsYdM2ByxhzEW8QNwIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQAYhPTX\naK/Djxm4YdivYVXLeH6DEaRsYrdSFuoKoH2ZuZiO/kkJDab5vEzMbrg1jKSZuoRo\nzDTLGP0Uj8I2cwC3GvwdBv1x5Bktcvl1NBDHVXH5jdijJdZYsUVgQ18gw1BK3b+l\nrRBqF9DoKXDfPivbQYC0CzVYZflWsCeEPO8Q8ouBLC/ts2QT+RBBxi+aNy8iDkVH\nXdqXyQ09X0vg+3ktX1jgL3zj3MytZAb7WUClADFqW08wswP1mQN62J6+fj/kkrry\n8lqSPgLBA/KhvWmS3XD1kMmBHCY4Jl/KZ68mKuwl2wyM5b91wMD/j7DFvKeG7Edo\n+8uTFaSZ1Wh+vocb\n-----END CERTIFICATE-----"
default['app']['ssl']['key'] = "-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEAvjU3EZfgUwvGyLtmCKZTIUH/pi2FaP9nOdZBcnLTJJXHggVe\n5aMeG6tlEeGvUuiJdVqZHS0Zh/DpVgWJmJQS8CHHEslBL3HaQRFfWHtcp4GKZEFM\n6tzi7qRiCYoCLnS1UA0Z+w6oobYivbW7YuvR9vWAcgD5f8IxUragaSkdVBjMYijZ\nfqZ6YUgkrxigZEbmeAzBb9lUN2j2I69Gu92LIQQdgxfUB3Mnkmec/nUaCzeK0yRP\nIuTcMijNivwndmFkVnw1Tw3y0PCk6UDLrg8SZTAEqRWZRC4KKNpp4Aqc6PwDTpH3\np0tx4dGw4g2ryLyiEijPlKsYdM2ByxhzEW8QNwIDAQABAoIBABjG49KF3zHSMeXK\nC4OK7v9BEqU5/svroS22jDX1YS292QxF2NO/CNf/3p2SsXzyT52a3KEhU9cSecK7\n2+2lNEZVkBIRZ01f3ldlhO8IuswTIszmeLeLaIA/p4mokZotl8TCwCSlBzBxglsG\nBk/fei1aU44GNHoA+N3WblTkhy6CBqCEX55FjS0PtGfxCFc+e1YLvjCmex7DLWCP\nHKKcrrWOjmF5RGJ/lSHvwKD5586gS/+hM6W0kC+5X36BiYrg79MF3T4CHC6sXzLg\nby1IQ6tgc5weh9YmD6LMLkEdPq/j6Qng2aFQoLAhlnn7g18uOmlqG96vis2t/aU4\nPPTw8kECgYEA9h/Hltx1C4YreeIukZtr/1b0+KVWCb4eL2cwjASediAPgejpiQ5o\nmGfp+pUim2g8B8zpanOLoqwrWTMvNKh8/Xrs3Mr9FovCyCRxZvaRjofFV3nBGOGW\nttEOp6WEGtGux4V1k7NVR0iYLuiAwj/7C0orS7z2vIGFZW+UkubEfZcCgYEAxdcO\nV4PmqWcBZRdMlkIRffLZtDVG366wssXWGyH2BhfMN5B5vqPg+moRH8QEaitkBzWx\nkvFftIWdChJ/2aHyWs3VzrqaE2Sed8PFhquxLzEqxjyrjjBV9cmSklw+9wG5GW07\n1OjUIYUI+Ggkqpm1/wbyl1cjLUihlSOnE0JjlmECgYAmxJy4q6MYHJsuiK0TLGsX\nfkf5/nkN8c9pYhSoiXW4X5ZxvRFEEGvzTbLyUJlx5zpFdEZ0CR0+k2YEl+ZgogWG\nG93BbYvuCDe3NN5T/JSy4bn47Gm5FJeb1lQ7nfuwCcVBEkmR6VaOcuXdxau6bT+K\n6LTnKi2nRbOQZcH+XbEnowKBgDAyij3r1l/ixkY4fOIGSniil0L9z7xitI15AQYv\nKd6mIYxP2DkHd6HKAU351RGAbKgM/qvLvgMeofl4NEly2LYiezoX371lv+1xdkeu\nwEW89qzAzxKe1/I/H0Qk0PogI1X8dJ0T88oOvPa3eGdPdzUgHi2cfudjUGoi+2sH\nu3dBAoGBAMH+mrscrF9j7t1pjffg7swugkqquGzVdlDf40IQ079lqVvu1/6v+Ypp\nvFsO4hoJd131xB/3FIYcL2ELxM/kGtro7pUcPQHwWuDGkM7cmQPpMs6Jfb9tFMNq\nOSm/JJvDKqWloCYkGYbH5RFzFGn8QZBwlmQg/nNYLeuC9qZ4VYQc\n-----END RSA PRIVATE KEY-----"

default['app']['s3']['access_key_id'] = ''
default['app']['s3']['secret_access_key'] = ''

default['python']['version'] = '3.4'

default['app']['sam_api_key'] = 'demo'
default['app']['api_key'] = 'demo'
default['app']['api_host'] = 'https://api.data.gov/gsa/discovery/'
