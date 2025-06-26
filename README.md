# 🍽️ Requêtes SQL - Gestion de recettes de cuisine

Ce dépôt contient un ensemble de **20 requêtes SQL** permettant d'interroger et de manipuler une base de données de **recettes culinaires**. Ces exercices couvrent les opérations essentielles du SQL : **jointures, agrégations, insertions, mises à jour, suppressions**, et plus encore.

---

## 📚 Structure de la base (résumé)

Les requêtes s'appuient sur les tables suivantes :

- `recette(id_recette, nom, tempsPrep, instructions, id_categorie)`
- `categorie(id_categorie, typeDePlat)`
- `ingredient(id_ingredient, nom, unite, prix)`
- `composer(id_recette, id_ingredient, quantite)` – table de liaison recette ↔ ingrédients

---

📦 Objectif pédagogique
Maîtriser les jointures internes `(INNER JOIN)`

Utiliser les fonctions d’agrégation : `COUNT(), SUM(), MIN()`

Gérer les filtrages avancés `(HAVING, NOT IN, LIKE)`

Manipuler des données avec `INSERT, UPDATE, DELETE`

Apprendre à écrire des requêtes `performantes et précises`
