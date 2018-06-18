#!/bin/bash

# Effacer toutes les règles actuelles
iptables -F

# Politique par défaut : tout DROPer (ne laisser passer aucun paquet)
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Accepter la réception des paquets venant du réseau Host-only
iptables -A INPUT -s 192.168.56.0/24 -j ACCEPT

# Accepter le routage des paquets à destination
# du réseau du load balancer, sur le port 80 (HTTP)
iptables -A FORWARD -d 198.51.100.0/24 -p tcp --dport 80 -j ACCEPT

# Accepter le routage des paquets ICMP (Ex : ping)
iptables -A FORWARD -p icmp -j ACCEPT

# -m state disparu depuis Linux 3.7
#iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -m state --state ESTABLISHED -j ACCEPT

# Accepter le routage des paquets appartenant à des connexions déjà établies
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED -j ACCEPT
# Accepter l'émission de paquets appartenant à des connexions déjà établies
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Tout le reste est droppé (voir Politique par défaut au début)
