TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `before_affectations_insert` BEFORE INSERT ON `affectations` FOR EACH ROW BEGIN\n    DECLARE user_role VARCHAR(20);\n    \n    -- Récupérer le rôle de l\'utilisateur\n    SELECT role INTO user_role \n    FROM utilisateurs \n    WHERE id = NEW.pompiste_id;\n    \n    -- Vérifier si le rôle est différent de \'pompiste\'\n    IF user_role != \'pompiste\' THEN\n        SIGNAL SQLSTATE \'45000\' \n        SET MESSAGE_TEXT = \'Seuls les utilisateurs avec le rôle "pompiste" peuvent être affectés\';\n    END IF;\nEND' 'CREATE DEFINER=`root`@`localhost` TRIGGER `before_affectations_update` BEFORE UPDATE ON `affectations` FOR EACH ROW BEGIN\n    DECLARE user_role VARCHAR(20);\n    \n    -- Récupérer le rôle de l\'utilisateur\n    SELECT role INTO user_role \n    FROM utilisateurs \n    WHERE id = NEW.pompiste_id;\n    \n    -- Vérifier si le rôle est différent de \'pompiste\'\n    IF user_role != \'pompiste\' THEN\n        SIGNAL SQLSTATE \'45000\' \n        SET MESSAGE_TEXT = \'Seuls les utilisateurs avec le rôle "pompiste" peuvent être affectés\';\n    END IF;\nEND'
sql_modes=524288 524288
definers='root@localhost' 'root@localhost'
client_cs_names='utf8mb4' 'utf8mb4'
connection_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
db_cl_names='utf8mb4_general_ci' 'utf8mb4_general_ci'
created=1749844342114212 1749844342125190
