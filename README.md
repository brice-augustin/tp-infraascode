# tp-infraascode
Fichiers de configuration Packer pour construire l'infra du TP avec :
un firewall, un load balancer, deux serveurs Web, une base de données, un serveur de supervision

Prérequis :

Une VM dans /home/etudiant/Téléchargements/DebianStretchPacker.ova avec les caractéristiques suivantes :
- OVA version 2.0
- Une carte réseau en mode NAT
- Utilitaire sudo installé (si la VM est sous Linux)
- Login et mot de passe connus (root/vitrygtr)
- Serveur SSH installé, SSH avec le login root autorisé (PermitRootLogin yes dans /etc/ssh/sshd_config)

Lancer la construction de l'infra :

./start.sh
