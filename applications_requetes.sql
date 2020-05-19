1/ 
  
SELECT medecin.numero_medecin , medecin.nom FROM medecin WHERE nom_specialite = "S1"


2/ SELECT DISTINCT nom_specialite FROM medecin;
   
3/ SELECT num_malade, nom ,date_de_naissance FROM `malade` WHERE sexe="h" ORDER BY date_de_naissance ASC ;

4/ SELECT num_malade , nom ,date_de_naissance FROM  malade WHERE sexe="F" AND adresse LIKE "%p%" ORDER BY nom  ;  

5/   
SELECT malade.num_malade ,malade.nom ,malade.date_de_naissance, chambre.categorie,chambre.type FROM malade, chambre,occuper,lit WHERE malade.num_malade=occuper.num_malade AND lit.numero_chambre=chambre.numero_chambre AND occuper.numero_lit=lit.numero_lit ;
6/

SELECT m.num_malade , m.nom ,m.date_de_naissance ,d.numero_departement ,d.nom FROM malade m, departement_medical d,feuilledevolution f 
WHERE m.num_malade = f.numero AND d.numero_departement = f.numero_departement 
AND day(m.date_de_naissance) = 22 AND YEAR(m.date_de_naissance)=2012 AND MONTH(m.date_de_naissance)=4 ;

7/
SELECT DISTINCT ma.nom ,ma.num_malade ,ma.date_de_naissance  
FROM medecin me , malade ma, etre_suivi e
WHERE e.num_malade = ma.num_malade AND e.numero_medecin = me.numero_medecin   AND me.nom = "M3" ;
8/
SELECT DISTINCT malade.nom ,malade.num_malade ,malade.date_de_naissance FROM medecin , malade , etre_suivi ,occuper ,lit WHERE etre_suivi.num_malade = malade.num_malade AND medecin.nom = "M3" AND lit.numero_lit = 21 ;

9/
SELECT m.nom ,m.num_malade ,m.nom 
FROM malade m , lit l , occuper o
WHERE l.numero_lit = o.numero_lit AND m.num_malade = o.num_malade AND l.numero_lit = 21 ;

10/
SELECT malade.num_malade , malade.nom , malade.date_de_naissance , feuilledevolution.numero , feuilledevolution.date 
FROM malade , feuilledevolution 
WHERE malade.num_malade = feuilledevolution.num_malade  AND malade.num_malade = 11 ; 

11/ 
SELECT numero_departement , 
COUNT( numero_departement) FROM feuilledevolution 
GROUP BY numero_departement

SELECT feuilledevolution.numero_departement, departement_medical.nom, 
SUM( feuilledevolution.numero_departement) FROM feuilledevolution, departement_medical 
WHERE feuilledevolution.numero_departement=departement_medical.numero_departement
 GROUP BY (feuilledevolution.numero_departement) ;

12/
 SELECT  ma.nom ,ma.num_malade,ma.adresse,me.nom
 FROM malade ma , medecin me , etre_suivi e ,departement_medical d
 WHERE ma.num_malade = e.num_malade AND me.numero_medecin = e.numero_medecin
 AND d.numero_departement = "D2" ;

 13/
 SELECT DISTINCT  m.num_malade ,m.nom,m.adresse 
 FROM malade m,feuilledevolution f
 WHERE m.num_malade = f.num_malade 
 AND  MONTH(f.date)IN (2,12)  ;

 14/
 SELECT c.* 
FROM malade m ,chambre c 
JOIN lit l On l.numero_chambre= c.numero_chambre 
JOIN occuper o ON o.numero_lit=l.numero_lit 
GROUP BY c.numero_chambre 
ORDER BY COUNT(*) DESC LIMIT 1

 15/
 SELECT d.* , 
 COUNT(malade.num_malade) AS NOMBRE 
 FROM departement_medical d 
 JOIN feuilledevolution on feuilledevolution.numero_departement=d.numero_departement 
 JOIN malade ON malade.num_malade=feuilledevolution.num_malade 
 group by feuilledevolution.numero_departement order by NOMBRE DESC LIMIT 1

16/
17/
SELECT m.* , COUNT(ma.num_malade) AS MALADE 
FROM medecin m JOIN etre_suivi ON etre_suivi.numero_medecin= m.numero_medecin 
JOIN malade ma ON etre_suivi.num_malade = ma.num_malade 
GROUP BY etre_suivi.num_malade ORDER BY MALADE DESC LIMIT 1

 18/SELECT m.num_malade , m.nom,m.date_de_naissance,ch.numero_chambre,l.numero_lit 
 FROM lit l ,malade m , chambre ch ,occuper o , medecin 
 WHERE o.numero_lit = l.numero_lit AND o.num_malade = m.num_malade 
 AND l.numero_chambre = ch.numero_chambre AND medecin.nom = "S2"

 19/

  SELECT * FROM feuilledevolution f 
  JOIN departement_medical dep ON f.numero_departement =dep.numero_departement 
  WHERE dep.numero_departement=2 AND 
  EXTRACT( YEAR FROM date )=2020 AND EXTRACT( MONTH FROM date) =6 LIMIT 1

 20/

 SELECT DISTINCT  numero_lit FROM lit l
 JOIN occuper o ON o.numero_lit = l.numero_lit 
 WHERE EXTRACT( MONTH FROM  date ) <>3;
