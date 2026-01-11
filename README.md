# Tests d’admission MSc Cyber - Dossier Technique

Ce dépôt regroupe l'ensemble des travaux réalisés pour la validation des compétences techniques requises pour l'intégration du MSc Cyber. Le projet est divisé en trois axes majeurs : Réseau, Administration Système et Conteneurisation.

---

## 📁 Sommaire Global

### 1. Exercice 01 : Architecture Réseau (Packet Tracer)
* **Objectif** : Création d'un miniLab avec segmentation VLAN (VoIP, Wi-Fi, Fixes, Admin).
* **Configuration** : Routeur Cisco 1941 (Gateway & DHCP), Switchs PT, et points d'accès Wi-Fi.
* **Livrables** : Fichier `.pkt`, exports de configuration et documentation du process.
* **Branche dédiée** : [Exercice 01 - Packet Tracer](https://github.com/MamineAch/test-msc-cyber/tree/lab/packet-tracer)

---

### 2. Exercice 02 : Active Directory & Automatisation PowerShell
* **Objectif** : Déploiement du domaine `laplateforme.io` et automatisation de l'import d'utilisateurs.
* **Technique** : Script PowerShell pour le peuplement de l'AD à partir d'un fichier CSV avec gestion des appartenances multi-groupes et politique de mot de passe.
* **Livrables** : Scripts `.ps1`, fichier CSV source.
* **Branche dédiée** : [Exercice 02 - Active Directory](https://github.com/MamineAch/test-msc-cyber/tree/lab/powershell-ad)

---

### 3. Exercice 03 : Infrastructure Conteneurisée Docker
* **Objectif** : Déploiement d'un site WordPress via Docker Compose.
* **Architecture** : Orchestration de trois services (Nginx, MariaDB, PHP-FPM) avec volumes persistants pour les données et configurations.
* **Livrables** : `docker-compose.yaml`, configuration Nginx personnalisée.
* **Branche dédiée** : [Exercice 03 - Docker](https://github.com/MamineAch/test-msc-cyber/tree/lab/docker)

---

## 🚀 Méthodologie Générale
Chaque exercice a été réalisé sur un environnement dédié :
- **Réseau** : Cisco Packet Tracer.
- **Système** : Windows Server 2022 et Debian 12.5 (CLI).
- **Conteneurisation** : Docker Engine & Docker Compose.

L'ensemble des détails techniques, captures d'écran et explications spécifiques se trouvent dans le fichier **README.md** de chaque branche respective.

---
**Candidat :** Achouch Mohammed-Amine
