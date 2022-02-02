CREATE DATABASE cat;
use cat;

CREATE TABLE questionarie (
  id INT(5) NOT NULL,
  name VARCHAR(20),
  min_number_questions INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE topic (
  id INT(5) NOT NULL,
  questionarie INT(5) NOT NULL,
  name VARCHAR(20),
  PRIMARY KEY (id)
);

CREATE TABLE question (
  id INT(5) NOT NULL,
  topic INT(5) NOT NULL,
  complexity INT(3) NOT NULL DEFAULT 1,
  text VARCHAR(200) NOT NULL,
  answer_id INT(5) NOT NULL,
  PRIMARY KEY (id,topic)
);

CREATE TABLE answer_option (
  id INT(5) NOT NULL,
  question INT(5) NOT NULL,
  topic INT(5) NOT NULL,
  answer_text VARCHAR(200) NOT NULL,
  PRIMARY KEY (id,question,topic)
);

INSERT INTO questionarie (id, name, min_number_questions) VALUES (1, 'Prova de Matematica', 15);

INSERT INTO topic (id, questionarie, name) VALUES (1,1,'Soma');
INSERT INTO topic (id, questionarie, name) VALUES (2,1,'Subtracao');
INSERT INTO topic (id, questionarie, name) VALUES (3,1,'Multiplicacao');
INSERT INTO topic (id, questionarie, name) VALUES (4,1,'Divisao');

INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (1,1,1,'Quanto e 1+2?', 1);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (2,1,2,'Quanto e 10+20?', 2);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (3,1,3,'Quanto e 100+200?', 3);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (4,1,4,'Quanto e 1000+2000?', 4);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (5,1,2,'Quanto e 40+50?', 3);

INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (1,2,1,'Quanto e 1-2?', 1);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (2,2,2,'Quanto e 10-20?',  2);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (3,2,3,'Quanto e 100-200',  3);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (4,2,4,'Quanto e 1000-2000', 4);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (5,2,1,'Quanto e 3-5', 2);

INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (1,3,1,'Quanto e 1x2?', 1);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (2,3,2,'Quanto e 10x20?', 2);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (3,3,3,'Quanto e 100x200',3);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (4,3,4,'Quanto e 1000x2000', 4);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (5,3,4,'Quanto e 1000x3000', 1);

INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (1,4,1,'Quanto e 1/2?', 1);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (2,4,2,'Quanto e 10/20?', 2);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (3,4,3,'Quanto e 100/200', 3);
INSERT INTO question (id, topic, complexity, text, answer_id) VALUES (4,4,4,'Quanto e 1000/2000', 4);

-- ANSWER OPTIONS
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,1,1,'3');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,1,1,'2');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,1,1,'4');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,1,1,'5');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,2,1,'10');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,2,1,'30');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,2,1,'40');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,2,1,'50');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,3,1,'200');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,3,1,'100');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,3,1,'300');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,3,1,'400');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,4,1,'2000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,4,1,'1000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,4,1,'4000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,4,1,'3000');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,5,1,'70');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,5,1,'80');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,5,1,'90');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,5,1,'50');

--
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,1,2,'-1');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,1,2,'2');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,1,2,'4');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,1,2,'5');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,2,2,'20');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,2,2,'-10');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,2,2,'50');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,2,2,'25');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,3,2,'400');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,3,2,'200');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,3,2,'-100');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,3,2,'500');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,4,2,'1000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,4,2,'2000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,4,2,'4000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,4,2,'-1000');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,5,2,'6');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,5,2,'8');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,5,2,'9');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,5,2,'7');

--
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,1,3,'2');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,1,3,'3');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,1,3,'4');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,1,3,'5');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,2,3,'20');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,2,3,'200');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,2,3,'50');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,2,3,'25');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,3,3,'400');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,3,3,'200');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,3,3,'20000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,3,3,'500');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,4,3,'1000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,4,3,'2000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,4,3,'4000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,4,3,'20000000');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,5,3,'30000000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,5,3,'2000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,5,3,'4000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,5,3,'30000');

--
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,1,4,'0.5');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,1,4,'3');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,1,4,'4');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,1,4,'5');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,2,4,'20');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,2,4,'0.5');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,2,4,'50');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,2,4,'25');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,3,4,'400');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,3,4,'200');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,3,4,'0.5');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,3,4,'500');

INSERT INTO answer_option (id, question, topic, answer_text) VALUES (1,4,4,'1000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (2,4,4,'2000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (3,4,4,'4000');
INSERT INTO answer_option (id, question, topic, answer_text) VALUES (4,4,4,'0.5');