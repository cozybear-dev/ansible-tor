## Intro

This GitHub repository is my personal development environment for automated stateless relay management.

My fleet can be found here; https://metrics.torproject.org/rs.html#search/cozybear

There is already a great repository here with way better support and e.g. key management; https://github.com/nusenu/ansible-relayor

I wanted to keep it simple, and understandable - hence creating this small project. 

**The ansible playbooks do not work yet and are in development.**

Only Debian 11 is supported.

## Personal recommendations for hosters

Tor needs to be as decentralised as possible, to minimize traffic corrolation attacks and agency interference. This means that the cheapest high performance servers with unlimited bandwidth (like Hetzner), are not the best option for the network. In general it's better to choose a hoster that has relatively low total bandwidth, to better serve the network.

My personal priority was to have a fleet that is well positioned geopolitically, not too expensive, and cares about privacy and anonymity - whilst not be one of the big hosters that has too many relays anyway. Using these principles, I found my way into these two hosters;

- https://aeza.net/
    -   Incredible bang for buck
    -   Goes without saying it's a good hoster geopolitically
    -   Payment via cryptocurrency, and had no issues with privacy/anonymity
    -   Stable enough, but I did have to create a sideproject for unknown stability issues;
        -   https://github.com/cozybear-dev/auto-heal-aeza
    -   Support is really quick, and English is not a problem
- https://incognet.io/
    -   Great performance, biggest cost is the bandwidth
    -   Very reliable, had 0 issues
    -   Support can be slow (up to a few days), but the responses are always very extensive and detailed
    -   Actively supports privacy and anonymity
    -   Payment via cryptocurrency

Using these two hosters, my relays are distributed across the following locations;

-   Netherlands
-   Germany
-   Various states in the USA
-   Russia

## Some useful commands
```
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general

ansible -i ./tor-hosts -u manjaro all -m ping

ansible -i ./tor-hosts -u manjaro testing -m ping

ansible -i ./tor-hosts -u manjaro tor-fleet -m ping

ansible-playbook -i ./tor-hosts --ask-become-pass -u root ./setup-tor-node.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u manjaro ./set-family.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u manjaro ./update-upgrade-all.yml
```