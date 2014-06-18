
## Why?

This is a proof-of-concept solution for a private Ruby gem server over an
SSH tunnel.  Once the tunnel is established, traffic can take place with or
without the typical HTTP basic auth (this example does not include it).

## Usage

From within the docker host:
``` shell
# Run a new geminabox server docker guest with its SSH port (22)
# published on port 29292 of the host
docker run -p 29292:22 -d jemc/geminabox-ssh
```

Setting up an SSH tunnel from a client through the host to the guest:
``` shell
# SSH tunnel through port 29292 of the docker host into the docker guest,
# Forwarding traffic on client's port 9292 to guest's localhost:9292
# (the default root password is 'password')
ssh -f -N -L 9292:localhost:9292 root@my.docker.host.com -p 29292
```

Pushing a private gem to the docker guest through the tunnel:
``` shell
# Push to http://localhost:9292
gem inabox /path/to/my-secret-0.0.1.gem
```
