const cors = require('cors');
const express = require('express');
const mysql = require('mysql');

let getData
const app = express()

/* create pool */


const pool = mysql.createPool({
    host: 'localhost',
    user: "bouzian",
    password: "bouzian",
    database: "bouzian",
    waitForConnections: true,
});

/* app */
const PORT = process.env.PORT || 3000

app.use(cors())



app.get('/', (req, res) => {
  const queries = [
      'SELECT * FROM view_client ORDER BY id_client DESC;',
      'SELECT * FROM view_fournisseur ORDER BY id_fournisseur DESC;',
      'SELECT * FROM view_achat_articles_fournisseur ORDER BY id_achat DESC;',
      'SELECT * FROM view_vente_articles_client ORDER BY id_vente DESC;',
      'SELECT * FROM view_versement_fournisseur ORDER BY id_versement_fournisseur DESC;',
      'SELECT * FROM view_versement_client ORDER BY id_versement_client DESC;',
      'SELECT * FROM view_importation ORDER BY id_achat_importation DESC;',
      'SELECT * FROM importation ORDER BY id_importation DESC;',
      'SELECT * FROM magasin ORDER BY id_magasin DESC;',
      'SELECT * FROM view_retour_client ORDER BY id_retour_client DESC;',
      'SELECT * FROM view_retour_fournisseur ORDER BY id_retour_fournisseur DESC;',
      'SELECT * FROM view_reparation ORDER BY id_reparation DESC;',
      'SELECT * FROM view_charge ORDER BY id_charge DESC;',
      'SELECT id_titre, is_deleted, valeur AS titre FROM titres ORDER BY id_titre DESC ;',
      'SELECT * FROM view_produits ORDER BY id_famille;',
      'SELECT * FROM view_command ORDER BY id_command DESC;'
  ];
  const tables = [
      'view_client', 
      'view_fournisseur',
      'view_achat_articles_fournisseur',
      'view_vente_articles_client',
      'view_versement_fournisseur',
      'view_versement_client',
      'view_importation',
      'importation',
      'magasin',
      'view_retour_client',
      'view_retour_fournisseur',
      'view_reparation',
      'view_charge',
      'titres',
      'view_produits',
      'view_command'
  ]

  let results = {};

  Promise.all(queries.map(query => executeQuery(query)))
      .then(queryResults => {
          queryResults.forEach((result, index) => {
              results[`${tables[index]}`] = result;
          });
          res.json(results);
      })
      .catch(error => {
          console.error('Error executing queries:', error);
          res.status(500).send('Error retrieving data from the database');
      });
});

function executeQuery(query) {
  return new Promise((resolve, reject) => {
      pool.query(query, (error, results, fields) => {
          if (error) {
              reject(error);
          } else {
              resolve(results);
          }
      });
  });
}

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
