# 🚀 Lab Packet Tracer : Segmentation Multi-VLAN & Services Réseau

Les fichiers sources et les scripts de configuration de ce projet sont disponibles sur la branche dédiée : [Accès au dépôt](https://github.com/MamineAch/test-msc-cyber/tree/lab/packet-tracer)

## A. Présentation de la topologie
Ce projet représente la topologie réseau globale mise en place pour interconnecter trois bureaux, tout en respectant la segmentation demandée. L'architecture repose sur un routeur central qui assure la communication entre les différents sous-réseaux, répondant ainsi aux besoins d'une infrastructure répartie sur plusieurs sites.



## B. Plan d’adressage et segmentation
L'objectif est de segmenter l'infrastructure en plusieurs réseaux logiques afin d'isoler chaque service. Cette séparation améliore la sécurité en limitant les accès non autorisés entre les zones et optimise les performances globales.

Pour accompagner cette segmentation, un service DHCP est déployé sur le routeur **Rt-Gw-A**, permettant aux clients de recevoir une configuration IP adaptée dès leur branchement.

### Tableau d’adressage

| VLAN | Segment | Réseau (Network ID) | Passerelle (Gateway) | Plage DHCP (Pool) |
| :--- | :--- | :--- | :--- | :--- |
| 1 | VoIP | 192.168.0.0/24 | 192.168.0.254 | 192.168.0.10 - .50 |
| 10 | Wi-Fi | 192.168.10.0/24 | 192.168.10.254 | 192.168.10.10 - .50 |
| 20 | PC Fixes | 192.168.20.0/24 | 192.168.20.254 | 192.168.20.10 - .50 |
| 30 | Administration | 192.168.30.0/24 | 192.168.30.254 | 192.168.30.10 - .50 |

### Configuration des commutateurs d'accès
Les commutateurs **Sw-Bur1-A**, **Sw-Bur2-A** et **Sw-Bur3-A** ont été configurés pour attribuer les ports physiques aux VLANs correspondants :

| Port | Affectation | VLAN | Mode |
| :--- | :--- | :--- | :--- |
| Port 8 | Administration | VLAN 30 | Access |
| Ports 6-7 | PC fixes | VLAN 20 | Access |
| Ports 4-5 | Points d’accès Wi-Fi | VLAN 10 | Access |
| Ports 2-3 | Téléphones IP (VoIP) | VLAN 1 | Access |
| Ports 1 et 9 | Uplink (Ethernet/Fibre) | Tous | **TRUNK** |

## C. Méthodologie de configuration
La mise en place a suivi une approche hiérarchique pour garantir que le routage soit opérationnel avant le déploiement des accès utilisateurs.

### Configuration du routeur central
Le routeur **Rt-Gw-A** agit comme la passerelle unique pour les trois bureaux :
1. **Routage inter-VLAN :** Utilisation de la méthode "Router-on-a-stick" sur l'interface Gig0/0 avec des sous-interfaces logiques et encapsulation dot1Q.
2. **Service DHCP :** Déploiement de quatre pools DHCP rattachés aux sous-interfaces pour l'attribution automatique des adresses.

### Configuration des switchs
1. **Segmentation des ports :** Interfaces physiques assignées à leurs VLANs respectifs.
2. **Liaisons Trunk :** Interconnexions configurées pour transporter l'intégralité du trafic tagué.
3. **Interface d'administration (SVI) :** Configuration d'une IP statique sur le VLAN 30 pour la gestion à distance.
4. **Passerelle par défaut :** Configuration indispensable pour permettre au trafic de gestion de transiter par le routeur.

## D. Observations sur la configuration DHCP
Lors de la configuration des exclusions sur le routeur Cisco 1941, une limitation de **Packet Tracer** a été identifiée.

**Observation :** À cause d'un bug technique, l'exclusion des adresses allant de .51 à .254 a été retirée du packet tracer. Le cumul de plusieurs plages d'exclusions rendait le service DHCP instable. `.pkt`.

**Configuration cible (équipement réel) :**
```cisco
ip dhcp excluded-address 192.168.20.1 192.168.20.9
ip dhcp excluded-address 192.168.20.51 192.168.20.254
!
ip dhcp pool POOL_PC
 network 192.168.20.0 255.255.255.0
 default-router 192.168.20.254
 dns-server 8.8.8.8
