# tp-infraascode
Fichiers de configuration Packer pour construire l'infra du TP :
un firewall, un load balancer, deux serveurs Web, une base de données et un serveur de supervision.

## Prérequis :

1. Packer installé dans le `PATH`

2. Une VM dans `/home/etudiant/Téléchargements/DebianStretchPacker.ova` avec les caractéristiques suivantes :
  - Debian Stretch avec installation minimale
  - Une carte réseau en mode NAT
  - Login et mot de passe connus (`root`/`vitrygtr`)
  - Utilitaire `sudo` installé
  - Serveur SSH installé, SSH avec le login root autorisé (`PermitRootLogin yes` dans `/etc/ssh/sshd_config`)
  - OVA version 2.0

## Lancement

*Si nécessaire, éditer les fichiers de conf Packer et changer le `source_path` de tous les éléments.*

*Modifier également le nom de la carte réseau dans la section `vboxmanage_post`*

Lancer la construction de l'infra :

`./start.sh`
