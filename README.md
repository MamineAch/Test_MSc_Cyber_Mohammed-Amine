# 🚀 Exercice 03 : Infrastructure WordPress avec Docker

Ce dépôt contient la configuration pour le déploiement d'une architecture WordPress complète, isolée et persistante sur un serveur Debian 12.5.

## 📋 Présentation du projet
L'idée de cet exercice est de monter une infrastructure propre en séparant chaque brique logicielle. Au lieu de tout installer sur le serveur, on utilise **Docker** et **Docker Compose** pour isoler les services :
* **Nginx** : Serveur Web / Reverse Proxy.
* **WordPress (PHP-FPM)** : Moteur applicatif.
* **MariaDB** : Système de gestion de base de données.

Cette méthode permet de bien séparer chaque brique, ce qui est beaucoup plus sûr. On peut déplacer le projet n'importe où sans se soucier des versions des logiciels sur la machine hôte.



## 🛠️ Configuration technique

### Docker Compose
Le déploiement est piloté par le fichier `docker-compose.yaml`. Il définit :
* **La persistance** : Utilisation de volumes Docker pour que les données de la base et les fichiers du site soient conservés, même si les conteneurs sont supprimés.
* **Le réseau interne** : Les services sont reliés de manière interne, permettant à WordPress de contacter la base de données via son nom de service `db`.

### Configuration Nginx
Un fichier `default.conf` a été rédigé spécifiquement pour ce projet. Il contient les règles permettant à Nginx de transmettre les requêtes PHP au conteneur WordPress via le protocole **FastCGI** sur le port **9000**.

## 🚀 Déploiement et résultat

### Lancement des services
L'intégralité de la pile logicielle est lancée avec une seule commande : 
```bash
docker-compose up -d
```
Docker se charge automatiquement de télécharger les images et d'initialiser les conteneurs en arrière-plan.

## Vérification
La commande docker ps permet de confirmer que les trois services sont opérationnels (Up) et que le port 80 est correctement exposé.

## ✅ Résultat final
Le bon fonctionnement de l'infrastructure est validé par l'accès à la page de configuration de WordPress via le navigateur. Cela démontre que la communication entre le serveur web, le moteur PHP et la base de données est parfaitement établie.

---
**Note :** Les fichiers sources et les scripts de configuration spécifiques sont disponibles sur la branche dédiée : [lab/docker](https://github.com/MamineAch/test-msc-cyber/tree/lab/docker)
