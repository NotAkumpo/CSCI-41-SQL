INSERT INTO publisher(pub_id, name, city, state, country, pr_info) VALUES('111111', 'Abdiel', 'Marikina', 'Region 2', 'Canada', CURDATE());

INSERT INTO author(name, address, contract) SELECT author_name, author_address, author_contract FROM book;