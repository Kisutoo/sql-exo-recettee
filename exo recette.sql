Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées
de façon décroissante sur la durée de réalisation

1 :  SELECT nom, typeDePlat, tempsPrep
     FROM recette r
     INNER JOIN categorie c ON r.id_categorie = c.id_categorie
     ORDER BY tempsPrep DESC
 


En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.

2 : SELECT nom, typeDePlat, tempsPrep, COUNT(c.quantite) AS nbIngredients
     FROM recette r
     INNER JOIN categorie ca ON r.id_categorie = ca.id_categorie
     INNER JOIN composer c ON c.id_recette = r.id_recette
     GROUP BY nom, typeDePlat, tempsPrep
     ORDER BY tempsPrep DESC
     

Afficher les recettes qui nécessitent au moins 30 min de préparation

3 : SELECT nom, tempsPrep
	FROM recette
     WHERE tempsPrep >= 30


Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en
question)

4 : SELECT nom 
     FROM recette
     WHERE nom LIKE '%Salade%'


Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec
les instructions de votre choix. Pensez à alimenter votre base de données en conséquence afin de
pouvoir lister les détails de cette recettes (ingrédients)

5 :  INSERT INTO recette (nom, tempsPrep, instructions, id_categorie)
     VALUES ('Pâtes à la carbonara', 20, 'Faire cuire des pâtes, faire revenir des lardons et de la crème dans une poele, mélanger aux pâtes puis servir', 1)



Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre
convenance)

6 : UPDATE recette
    SET nom = 'Brocoli Vapeur'
    WHERE id_recette = 3


Supprimer la recette n°2 de la base de données

7 :  DELETE FROM composer WHERE id_recette = 2;
     DELETE FROM recette WHERE id_recette = 2



Afficher le prix total de la recette n°5

8 : SELECT r.nom, round(sum(quantite * prix), 2) AS coutTotal
     FROM composer c
     INNER JOIN ingredient i ON i.id_ingredient = c.id_ingredient
     INNER JOIN recette r ON r.id_recette = c.id_recette
     WHERE r.id_recette = 5



Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)

9 : SELECT id_recette, i.nom, quantite, i.prix
   FROM composer c
   INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
   WHERE id_recette = 5



Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €

10 : INSERT INTO ingredient (nom, unite, prix)
       VALUES ('Poivre', 'cuillère à café', 2.5)



Modifier le prix de l’ingrédient n°12 (prix à votre convenance)

11 : UPDATE ingredient
       SET prix = 2.5
       WHERE id_ingredient = 12



Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts

12 : SELECT COUNT(r.id_categorie) AS nb, c.typeDePlat
       FROM recette r
       INNER JOIN categorie c ON c.id_categorie = r.id_categorie
       GROUP BY r.id_categorie



Afficher les recettes qui contiennent l’ingrédient « Poulet »

13 : SELECT r.nom, i.nom
     FROM recette r
     INNER JOIN composer c ON r.id_recette = c.id_recette
     INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
     WHERE i.nom LIKE 'poulet'



Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes

14 : UPDATE recette 
     SET tempsPrep = tempsPrep - 5



Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure

15 : SELECT r.nom
     FROM recette r
     WHERE r.id_recette NOT IN (
          SELECT c.id_recette
          FROM composer c
          INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
          WHERE c.id_recette = r.id_recette
          AND i.prix > 2
          );



Afficher la / les recette(s) les plus rapides à préparer

16 : SELECT nom, tempsPrep
     FROM recette 
     WHERE tempsPrep = (
	     SELECT MIN(tempsPrep)
	     FROM recette
	     )


Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau
chaude qui consiste à verser de l’eau chaude dans une tasse)


17 : SELECT r.nom
     FROM recette r
     WHERE id_recette NOT IN(
          SELECT id_recette 
          FROM composer c
          WHERE r.id_recette = c.id_recette
     );



Trouver les ingrédients qui sont utilisés dans au moins 3 recettes


18 : SELECT COUNT(i.id_ingredient) AS UtiliseNbFois, i.nom
     FROM composer c
     INNER	JOIN ingredient i ON i.id_ingredient = c.id_ingredient
     GROUP BY i.id_ingredient
     HAVING COUNT(c.id_ingredient) >= 3



Ajouter un nouvel ingrédient à une recette spécifique

19 : INSERT INTO composer
     VALUES (500, 5, 13);




 Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est
donc exclu d’utiliser la clause LIMIT)


20 : SELECT r.nom, ROUND(SUM(quantite * prix), 2) AS coutTotal
FROM composer c
INNER JOIN ingredient i ON i.id_ingredient = c.id_ingredient
INNER JOIN recette r ON r.id_recette = c.id_recette
GROUP BY r.id_recette, r.nom
HAVING SUM(quantite * prix) >= ALL (
    SELECT SUM(quantite * prix)
    FROM composer c2
    INNER JOIN ingredient i2 ON i2.id_ingredient = c2.id_ingredient
    GROUP BY c2.id_recette
);





