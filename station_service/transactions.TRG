TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `verify_pompiste_role_before_insert` BEFORE INSERT ON `transactions` FOR EACH ROW BEGIN\n    DECLARE user_role VARCHAR(20);\n    \n    IF NEW.id_pompiste IS NOT NULL THEN\n        SELECT role INTO user_role \n        FROM utilisateurs \n        WHERE id = NEW.id_pompiste;\n        \n        IF user_role != \'pompiste\' THEN\n            SIGNAL SQLSTATE \'45000\'\n            SET MESSAGE_TEXT = \'L\'\'utilisateur assigné comme pompiste doit avoir le rôle "pompiste"\';\n        END IF;\n    END IF;\nEND'
sql_modes=524288
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_general_ci'
db_cl_names='utf8mb4_general_ci'
created=1749844343058755
