## Intro

This GitHub repository is my personal development environment for automated stateless relay management.

My fleet can be found here; https://metrics.torproject.org/rs.html#search/cozybear

There is already a great repository here with way better support and e.g. key management; 

- https://github.com/nusenu/ansible-relayor

If you want something more simple and straightforward, also look at these projects (used some tasks myself from here in this repo as well);

- https://github.com/dan-kir/ansible-debian-11-tor-relay
- https://github.com/dan-kir/ansible-debian-11-hardening

I wanted to keep it simple, and understandable - hence creating this small project. I'm well aware this repo does not adhere to the documented structure of ansible role development.

Only Debian 11 is supported. Debian 10 partially works, but kernel hardening fails partially, sk-ssh-ed25519 is unsupported and DNS over TLS (if no IPv6) will fail - it is NOT supported nor will it ever be! 

Features:
- Basic hardening (ssh, kernel, additional user with password, apparmor, prevent core dumping, disable root user)
- Automatic updating/upgrading
- Uses Bitwarden for secrets
- Stateless

## Personal recommendations for hosters

Tor needs to be as decentralised as possible, to minimize traffic corrolation attacks and agency interference. This means that the cheapest high performance servers with unlimited bandwidth (like Hetzner), are not the best option for the network. In general it's better to choose a hoster that has relatively low total bandwidth, to better serve the network.

My personal priority was to have a fleet that is well positioned geopolitically, not too expensive, and cares about privacy and anonymity - whilst not be one of the big hosters that has too many relays anyway. Using these principles, I found my way into these hosters;

- https://aeza.net/
    -   Incredible bang for buck
    -   Goes without saying it's a good hoster geopolitically
    -   Payment via cryptocurrency, and had no issues with privacy/anonymity
    -   Stable enough, but I did have to create a sideproject for unknown stability issues;
        -   https://github.com/cozybear-dev/auto-heal-aeza
        -   They had some heavy DDOS issues during my time of use. They resolved it in due time. The stability and bandwidth varies per location. It's nowhere near gigabit sustained (still very fast, especially for the price), more like peak.
    -   Support is really quick, and English is not a problem
- https://incognet.io/
    -   Great performance, biggest cost is the bandwidth
    -   Very reliable, had 0 issues
    -   Support can be slow (up to a few days), but the responses are always very extensive and detailed
    -   Actively supports privacy and anonymity
    -   Payment via cryptocurrency
- https://veesp.com/
    -   Reliable, fast speed, privacy friendly, accept crypto, bit more expensive
    -   Primary downside, no exits allowed

Using these hosters, my relays are distributed across the following locations; 

-   Netherlands
-   Germany
-   Sweden
-   Finland
-   France
-   Austria
-   Various states in the USA
-   Russia

## Some useful commands
```
npm install -g @bitwarden/cli

ansible-galaxy collection install ansible.posix

ansible-galaxy collection install community.general

ansible -i ./tor-hosts -u manjaro all -m ping

ansible -i ./tor-hosts -u manjaro testing -m ping

ansible -i ./tor-hosts -u manjaro tor-fleet -m ping

ansible-playbook -i ./tor-hosts --ask-become-pass -u root ./setup-tor-node.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u manjaro ./set-family.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u manjaro ./update-upgrade-all.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u manjaro ./get-fingerprints.yml

ansible-playbook -i ./tor-hosts --ask-pass -u root ./setup-tor-node.yml
```
