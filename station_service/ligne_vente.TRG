TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `before_ligne_vente_insert` BEFORE INSERT ON `ligne_vente` FOR EACH ROW BEGIN\n    DECLARE stock_actuel INT;\n    \n    -- Récupérer le stock actuel\n    SELECT quantite_stock INTO stock_actuel \n    FROM produits \n    WHERE id = NEW.produit_id;\n    \n    -- Vérifier si le stock serait négatif après la vente\n    IF (stock_actuel - NEW.quantite) < 0 THEN\n        SIGNAL SQLSTATE \'45000\' \n        SET MESSAGE_TEXT = \'Stock insuffisant pour ce produit\';\n    END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `after_ligne_vente_insert` AFTER INSERT ON `ligne_vente` FOR EACH ROW BEGIN\n    -- Diminuer le stock du produit vendu\n    UPDATE produits \n    SET quantite_stock = quantite_stock - NEW.quantite,\n        date_modification = NOW()\n    WHERE id = NEW.produit_id;\nEND'
sql_modes=524288 524288
definers='root@localhost' 'root@localhost'
client_cs_names='utf8mb4' 'utf8mb4'
connection_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1749844342461385 1749844342450690
