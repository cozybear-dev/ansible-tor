## Intro

This GitHub repository is my personal development environment for automated stateless relay management.

Do not run anything in this repo blindly. It'd made for personal use. SSH key is hardcoded.

My fleet can be found here; https://metrics.torproject.org/rs.html#search/cozybear or https://nusenu.github.io/OrNetStats/shadowbrokers.eu.html

There is already a great repository here with way better support and e.g. key management; 

- https://github.com/nusenu/ansible-relayor

If you want something more simple and straightforward, also look at these projects (used some tasks myself from here in this repo as well);

- https://github.com/dan-kir/ansible-debian-11-tor-relay
- https://github.com/dan-kir/ansible-debian-11-hardening

I wanted to keep it simple, and understandable - hence creating this small project. I'm well aware this repo does not adhere to the documented structure of ansible role development.

Only Debian 11/12 is supported. Debian 10 partially works, but kernel hardening fails partially, sk-ssh-ed25519 is unsupported and DNS over TLS (if no IPv6) will fail - it is NOT supported nor will it ever be! 

Features:
- Basic hardening (ssh, kernel, additional user with password, apparmor, prevent core dumping, disable root user)
- Automatic updating/upgrading
- Uses Bitwarden for secrets
- Stateless

## Personal recommendations for hosters

Tor needs to be as decentralised as possible, to minimize traffic corrolation attacks and agency interference. This means that the cheapest high performance servers with unlimited bandwidth (like Hetzner), are not the best option for the network. In general it's better to choose a hoster that has relatively low total bandwidth, to better serve the network.

My personal priority was to have a fleet that is well positioned geopolitically, not too expensive, and cares about privacy and anonymity - whilst not be one of the big hosters that has too many relays anyway. Using these principles, I found my way into these hosters;

- https://aeza.net/
    -   [SINCE APRIL 25 DO NOT RECOMMEND!] They are now actively blocking all Tor relay use, and have added it explicitly to their ToS. My account got blocked, funds lost.
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
    -   Ultimatly stopped renting servers after a year, because it's just too expensive compared to the alternatives.
- https://veesp.com/
    -   Reliable, fast speed, privacy friendly, accept crypto, bit more expensive
    -   Primary downside, no exits allowed
- https://4vps.su/
    -   They have high performance servers in lots of unique places. Pricing and hardware is good. Good value in general.
- https://snowcore.io/
    -   Good servers, but stopped - as they don't support e-mail notifications and automatic billing methods.
- https://pfcloud.io/
    -   Good bang for buck, but recently (July 2024) they had an incredible shitshow caused by court orders. Long story short; I had 1 month of downtime for all VMs and had full disk data loss.
- https://macarne.com/
    -   Testing out dedicated server setup, came on my radar as they sponsor servers for GrapheneOS.
    -   Experience after 2 months; best support I've ever seen (via Telegram), top tier hardware and incredibly good international network connection, good pricing as well. Thus far, has been my best experience at a hoster. Biggest downside, they don't accept cryptocurrency as a form of payment. Not a dealbreaker for me, but might for some. They are privacy friendly nonetheless. 

Using these hosters, my relays are distributed across the following locations, routing through interesting cables over the world; 

-   Netherlands
-   Germany
-   Sweden
-   Finland
-   France
-   Austria
-   USA
-   Russia
-   Hong Kong
-   Czech republic

## Some useful commands
```
npm install -g @bitwarden/cli

ansible-galaxy collection install ansible.posix

ansible-galaxy collection install community.general

ansible -i ./tor-hosts -u manjaro all -m ping

ansible -i ./tor-hosts -u manjaro testing -m ping

ansible -i ./tor-hosts -u manjaro tor-fleet -m ping

ansible-playbook -i ./tor-hosts -u root ./setup-tor-node.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u root ./setup-tor-node.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u manjaro ./setup-tor-node.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u manjaro ./set-family.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u manjaro ./update-upgrade-all.yml

ansible-playbook -i ./tor-hosts --ask-become-pass -u manjaro ./get-fingerprints.yml

ansible-playbook -i ./tor-hosts --ask-pass -u root ./setup-tor-node.yml
```
