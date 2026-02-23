📱 app_evenements – Application de Gestion des Événements
🎯 Objectif du projet

Ce projet a pour objectif de développer une application mobile Flutter permettant de gérer et consulter des événements.

L'application a été réalisée en utilisant uniquement les notions vues en cours :

Création d’interface utilisateur (UI Flutter)

Utilisation de BottomNavigationBar

Création de formulaires avec validation

Ajout et affichage d’images (assets locaux)

Listes et affichage dynamique de données

Recherche dynamique

Stockage des données en mémoire avec des List Dart

⚠️ Aucune base de données ni API externe n’a été utilisée.
Les données sont stockées uniquement en mémoire.

🚀 Fonctionnalités principales
🔐 Connexion

Page de login simple

Navigation vers l’écran principal

🏠 Accueil

Navigation via BottomNavigationBar

Accès rapide aux différentes sections

📋 Gestion des événements

Chaque événement contient :

Titre

Date

Lieu

Description

Image (img5.jpg)

Fonctionnalités disponibles :

➕ Ajouter un événement

👁 Voir les détails

✏️ Modifier un événement

🗑 Supprimer un événement

🔎 Rechercher par titre

📌 Message affiché s’il n’y a aucun événement :
"Aucun événement disponible"

🗂 Structure du projet
lib/
 ├── main.dart
 ├── models/
 │    └── event.dart
 ├── screens/
 │    ├── login_screen.dart
 │    ├── home_screen.dart
 │    ├── event_list_screen.dart
 │    ├── add_event_screen.dart
 │    ├── edit_event_screen.dart
 │    └── show_event_screen.dart
 ├── widgets/
 │    └── event_card.dart
 └── data/
      └── event_data.dart

assets/
 └── images/
      └── img5.jpg
🛠 Technologies utilisées

Flutter

Dart

Material Design

List (stockage en mémoire)

▶️ Instructions pour lancer l’application
1️⃣ Cloner le projet
git clone <lien-du-repository>
cd app_evenements
2️⃣ Installer les dépendances
flutter pub get
3️⃣ Nettoyer le projet (recommandé)
flutter clean
4️⃣ Lancer l’application

Pour Web :

flutter run -d edge

Pour Windows :

flutter run -d windows

Pour Android :

flutter run
📌 Remarques

Les données sont temporaires (elles disparaissent après redémarrage).

Les images sont stockées dans assets/images/.

Le projet respecte les bonnes pratiques Flutter :

Code structuré

Séparation des fichiers (models, screens, widgets, data)

Navigation propre

Validation des formulaires