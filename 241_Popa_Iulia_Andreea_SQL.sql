CREATE TABLE restaurant_apo(
            id_restaurant NUMBER(4) NOT NULL PRIMARY KEY,
            nume_rest VARCHAR2(30) NOT NULL,
            adresa_rest VARCHAR2(80),
            nr_contact_rest VARCHAR2(12),
            email_rest VARCHAR2(50));
            
CREATE TABLE comanda_apo(
            id_comanda NUMBER(4) NOT NULL PRIMARY KEY,
            id_client NUMBER(4) NOT NULL,
            id_livrator NUMBER(4) NOT NULL,
            id_restaurant NUMBER(4) NOT NULL,
            pret_comanda NUMBER(4) NOT NULL,
            data_comanda DATE NOT NULL);
            
CREATE TABLE client_apo(
            id_client NUMBER(4) NOT NULL PRIMARY KEY,
            nume_client VARCHAR2(20) NOT NULL,
            prenume_client VARCHAR2(20) NOT NULL,
            adresa_client VARCHAR2(80) NOT NULL,
            nr_tel_client VARCHAR2(12) NOT NULL,
            email_client VARCHAR2(50),
            varsta_client NUMBER(4));
            
CREATE TABLE produs_apo(
            id_produs NUMBER(4) NOT NULL PRIMARY KEY,
            id_restaurant NUMBER(4) NOT NULL,
            nume_produs VARCHAR2(20) NOT NULL,
            pret_produs NUMBER(4) NOT NULL,
            gramaj_produs NUMBER(4),
            categorie_produs VARCHAR2(30));
            
CREATE TABLE produs_comanda_apo(
            id_produs NUMBER(4) NOT NULL,
            id_comanda NUMBER(4) NOT NULL, 
            cantitate_produs NUMBER(4) NOT NULL);
            
ALTER TABLE produs_comanda_apo
ADD CONSTRAINT produs_comanda_apo_PK PRIMARY KEY (id_produs, id_comanda);

CREATE TABLE livrator_apo(
            id_livrator NUMBER(4) NOT NULL PRIMARY KEY,
            nume_livrator VARCHAR2(20) NOT NULL,
            prenume_livrator VARCHAR2(20) NOT NULL,
            nr_tel_livrator VARCHAR2(12) NOT NULL,
            adresa_livrator VARCHAR2(80),
            varsta_livrator NUMBER(4));
            
ALTER TABLE comanda_apo 
ADD CONSTRAINT comanda_apo_FK1 FOREIGN KEY (id_client) REFERENCES client_apo(id_client);

ALTER TABLE comanda_apo 
ADD CONSTRAINT comanda_apo_FK2 FOREIGN KEY (id_livrator) REFERENCES livrator_apo(id_livrator);

ALTER TABLE comanda_apo 
ADD CONSTRAINT comanda_apo_FK3 FOREIGN KEY (id_restaurant) REFERENCES restaurant_apo(id_restaurant);

ALTER TABLE produs_apo 
ADD CONSTRAINT produs_apo_FK1 FOREIGN KEY (id_restaurant) REFERENCES restaurant_apo(id_restaurant);



INSERT INTO restaurant_apo VALUES (1, 'Manor', 'Craiova, Strada Severinului 17', '0756435785', 'restaurant_manor@gmail.com');
INSERT INTO restaurant_apo VALUES (2, 'Big Ben', 'Craiova, Strada Mircea Voda 1', '0764568742', 'big_ben2015@gmail.com');
INSERT INTO restaurant_apo VALUES (3, 'Iberico', 'Craiova, Strada Romain Rolland 13', '0786331402', 'iberico_bardetapas@gmail.com');
INSERT INTO restaurant_apo VALUES (4, 'Acsa', 'Craiova, Strada Traian Demetrescu 2', '0769007355', 'acsa_craiova@gmail.com');
INSERT INTO restaurant_apo VALUES (5, 'Excelsior', 'Craiova, Strada Alexandru Macedonski 1', '0771732230', 'excelsior_restaurant@gmail.com');
INSERT INTO restaurant_apo VALUES (6, 'C House Milano', 'Craiova, Strada 13 Septembrie 7', '0756636482', 'c_house22@gmail.com');


INSERT INTO livrator_apo VALUES (1, 'Stefanescu', 'Codrin Mihai', '0765458630', 'Craiova, Str Severin 19, bl M19, ap 3', '23');
INSERT INTO livrator_apo VALUES (2, 'Popescu', 'Andrei Tudor', '0764563142', 'Craiova, Str Vasilescu Carpen 2, bl M4, ap 5', '27');
INSERT INTO livrator_apo VALUES (3, 'Avramescu', 'Roberta', '0769438603', 'Slatina, Str Rozelor 3', '24');
INSERT INTO livrator_apo VALUES (4, 'Vulea', 'Anastasia Mirela', '0753246863', 'Carcea, Strada Imparatului 6', '31');
INSERT INTO livrator_apo VALUES (5, 'Sorescu', 'Andrei Stefan', '0753246789', 'Craiova, Strada Nanterre 3, bl C4, ap 6', '28');
INSERT INTO livrator_apo VALUES (6, 'Vidica', 'Stefania Maria', '0765458742', 'Craiova, Strada Fratii Golesti 7, bl H4, ap 11', '45');

INSERT INTO produs_apo VALUES (1, 1, 'Snitel de pui', 20, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (2, 1, 'Snitel de porc', 22, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (3, 1, 'Snitel de vita', 25, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (4, 1, 'Cartofi prajiti', 10, 200, 'Garnitura');
INSERT INTO produs_apo VALUES (5, 1, 'Legume mexicane', 12, 200, 'Garnitura');
INSERT INTO produs_apo VALUES (6, 1, 'Salata Caesar', 31, 400, 'Salata');
INSERT INTO produs_apo VALUES (7, 1, 'Coca Cola', 9, 250, 'Bautura racoritoare');
INSERT INTO produs_apo VALUES (8, 1, 'Sprite', 9, 250, 'Bautura racoritoare');
INSERT INTO produs_apo VALUES (9, 2, 'Pui la gratar', 23, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (10, 2, 'Cascaval pane', 15, 300, 'Fel principal');
INSERT INTO produs_apo VALUES (11, 2, 'Ceafa de porc', 23, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (12, 2, 'Piure de mazare', 12, 200, 'Garnitura');
INSERT INTO produs_apo VALUES (13, 2, 'Cartofi wedges', 12, 250, 'Garnitura');
INSERT INTO produs_apo VALUES (14, 2, 'Salata greceasca', 27, 400, 'Salata');
INSERT INTO produs_apo VALUES (15, 2, 'Lava cake', 20, 150, 'Desert');
INSERT INTO produs_apo VALUES (16, 2, 'Creme brulee', 20, 150, 'Desert');
INSERT INTO produs_apo VALUES (17, 3, 'Crispy de pui', 25, 300, 'Fel principal');
INSERT INTO produs_apo VALUES (18, 3, 'Snitel de pui', 20, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (19, 3, 'Cotlet de porc', 24, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (20, 3, 'Pastrav la gratar', 28, 300, 'Fel principal');
INSERT INTO produs_apo VALUES (21, 3, 'Cartofi prajiti', 10, 250, 'Garnitura');
INSERT INTO produs_apo VALUES (22, 3, 'Cartofi la cuptor', 10, 250, 'Garnitura');
INSERT INTO produs_apo VALUES (23, 3, 'Legume mexicane', 10, 250, 'Garnitura');
INSERT INTO produs_apo VALUES (24, 3, 'Vin alb', 12, 150, 'Bautura alcoolica');
INSERT INTO produs_apo VALUES (25, 3, 'Vin rosu', 12, 150, 'Bautura alcoolica');
INSERT INTO produs_apo VALUES (26, 3, 'Vin alb', 12, 150, 'Bautura alcoolica');
INSERT INTO produs_apo VALUES (27, 4, 'Mix bruschete', 18, 200, 'Aperitiv');
INSERT INTO produs_apo VALUES (28, 4, 'Salata de vinete', 12, 150, 'Aperitiv');
INSERT INTO produs_apo VALUES (29, 4, 'Bruschete cu somon', 14, 150, 'Aperitiv');
INSERT INTO produs_apo VALUES (30, 4, 'Parmachef', 30, 350, 'Fel principal');
INSERT INTO produs_apo VALUES (31, 4, 'Focaccia', 12, 150, 'Extra');
INSERT INTO produs_apo VALUES (32, 4, 'Sos de usturoi', 4, 100, 'Extra');
INSERT INTO produs_apo VALUES (33, 4, 'Sos barbeque', 4, 100, 'Extra');
INSERT INTO produs_apo VALUES (35, 4, 'Tiramisu', 21, 200, 'Desert');
INSERT INTO produs_apo VALUES (36, 5, 'Pui la gratar', 18, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (37, 5, 'Snitel de pui', 20, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (38, 5, 'Crispy de pui', 22, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (39, 5, 'Parmachef de pui', 28, 300, 'Fel princiapl');
INSERT INTO produs_apo VALUES (40, 5, 'Cartofi gratinati', 10, 200, 'Garnitura');
INSERT INTO produs_apo VALUES (41, 5, 'Cartofi prajiti', 10, 250, 'Garnitura');
INSERT INTO produs_apo VALUES (42, 5, 'Legume mexicane', 12, 250, 'Garnitura');
INSERT INTO produs_apo VALUES (43, 5, 'Cidru de mere', 9, 250, 'Bautura alcoolica');
INSERT INTO produs_apo VALUES (44, 5, 'Sprite', 8, 250, 'Bautura racoritoare');
INSERT INTO produs_apo VALUES (45, 5, 'Sos sour', 4, 100, 'Extra');
INSERT INTO produs_apo VALUES (46, 5, 'Tiramisu', 15, 200, 'Desert');
INSERT INTO produs_apo VALUES (47, 6, 'Pui la gratar', 16, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (48, 6, 'Salata Caesar', 24, 300, 'Salata');
INSERT INTO produs_apo VALUES (49, 6, 'Paste Carbonara', 28, 300, 'Paste');
INSERT INTO produs_apo VALUES (50, 6, 'Paste bollognese', 26, 300, 'Paste');
INSERT INTO produs_apo VALUES (51, 6, 'Tiramisu', 20, 200, 'Desert');
INSERT INTO produs_apo VALUES (52, 6, 'Sos barbeque', 5, 100, 'Extra');
INSERT INTO produs_apo VALUES (53, 6, 'Crispy de pui', 23, 250, 'Fel principal');
INSERT INTO produs_apo VALUES (54, 6, 'Cartofi prajiti', 12, 200, 'Garnitura');
INSERT INTO produs_apo VALUES (55, 6, 'Sprite', 10, 250, 'Bautura racoritoare');
INSERT INTO produs_apo VALUES (56, 6, 'Cidru de mere', 12, 250, 'Bautura alcoolica');

INSERT INTO client_apo VALUES (1, 'Popa', 'Iulia Andreea', 'Craiova, Str Vasilescu Carpen 2, bl M15, ap 6', '0756548535', 'andreea_popa22@yahoo.ro', 20);
INSERT INTO client_apo VALUES (2, 'Badescu', 'Gabriel', 'Pitesti, Str Eroilor 5, bl C4, ap 6', '0768546830', 'gabri16@gmail.com', 20);
INSERT INTO client_apo VALUES (3, 'Dorneanu', 'Alina Mihaela', 'Piatra-Neamt, Str Florilor 12', '0756754324', 'alina_mihaela@gmail.com', 20);
INSERT INTO client_apo VALUES (4, 'Filip', 'Bianca Camelia', 'Craiova, Str Ramuri 22B', '0756547653', 'bia_filip@yahoo.com', 21);
INSERT INTO client_apo VALUES (5, 'Ciobarca', 'Stefan Alexandru', 'Craiova, Str Horia 41', '0754678430', 'fnt_ciobarca41@gmail.com', 23);
INSERT INTO client_apo VALUES (6, 'Popa', 'Bianca Lavinia', 'Craiova, Str Vasilescu Carpen 2, bl M15, ap 6', '0756453450', 'byanca29andre@yahoo.com', 43);
INSERT INTO client_apo VALUES (7, 'Filip', 'Elena', 'Craiova, Str Ramuri 22B', '0768543264', 'elena_filip@gmail.com', 42);


INSERT INTO comanda_apo VALUES (1, 1, 2, 3, 129, '21-JAN-06');
INSERT INTO produs_comanda_apo VALUES (17, 1, 1);
INSERT INTO produs_comanda_apo VALUES (19, 1, 1);
INSERT INTO produs_comanda_apo VALUES (18, 1, 1);
INSERT INTO produs_comanda_apo VALUES (21, 1, 3);
INSERT INTO produs_comanda_apo VALUES (23, 1, 3);

INSERT INTO comanda_apo VALUES (2, 6, 2, 3, 90, '21-JAN-05');
INSERT INTO produs_comanda_apo VALUES (18, 2, 1);
INSERT INTO produs_comanda_apo VALUES (20, 2, 1);
INSERT INTO produs_comanda_apo VALUES (24, 2, 1);
INSERT INTO produs_comanda_apo VALUES (22, 2, 2);

INSERT INTO comanda_apo VALUES (3, 2, 3, 4, 90, '21-JAN-04');
INSERT INTO produs_comanda_apo VALUES (30, 3, 2);
INSERT INTO produs_comanda_apo VALUES (31, 3, 1);
INSERT INTO produs_comanda_apo VALUES (32, 3, 1);
INSERT INTO produs_comanda_apo VALUES (33, 3, 2);

INSERT INTO comanda_apo VALUES (4, 1, 3, 5, 125, '20-DEC-23');
INSERT INTO produs_comanda_apo VALUES (38, 4, 1);
INSERT INTO produs_comanda_apo VALUES (39, 4, 1);
INSERT INTO produs_comanda_apo VALUES (40, 4, 2);
INSERT INTO produs_comanda_apo VALUES (43, 4, 2);
INSERT INTO produs_comanda_apo VALUES (46, 4, 2);

INSERT INTO comanda_apo VALUES (5, 3, 2, 1, 115, '20-DEC-22');
INSERT INTO produs_comanda_apo VALUES (1, 5, 1);
INSERT INTO produs_comanda_apo VALUES (3, 5, 2);
INSERT INTO produs_comanda_apo VALUES (4, 5, 3);
INSERT INTO produs_comanda_apo VALUES (7, 5, 1);

INSERT INTO comanda_apo VALUES (6, 1, 4, 3, 140, '21-JAN-07');
INSERT INTO produs_comanda_apo VALUES (17, 6, 4);
INSERT INTO produs_comanda_apo VALUES (21, 6, 4);

INSERT INTO comanda_apo VALUES (7, 3, 2, 1, 115, '20-DEC-22');
INSERT INTO produs_comanda_apo VALUES (1, 7, 1);
INSERT INTO produs_comanda_apo VALUES (3, 7, 2);
INSERT INTO produs_comanda_apo VALUES (4, 7, 3);
INSERT INTO produs_comanda_apo VALUES (7, 7, 1);

INSERT INTO comanda_apo VALUES (8, 3, 2, 1, 115, '20-DEC-22');
INSERT INTO produs_comanda_apo VALUES (1, 8, 1);
INSERT INTO produs_comanda_apo VALUES (3, 8, 2);
INSERT INTO produs_comanda_apo VALUES (4, 8, 3);
INSERT INTO produs_comanda_apo VALUES (7, 8, 1);

--6. Pentru fiecare client (nume, prenume) cu varsta mai mare decat un numar dat de la tastatura, afisati numele 
--restaurantului la care a plasat cele mai multe comenzi.
CREATE OR REPLACE PROCEDURE proc_ex6 
    (idd1 IN OUT NUMBER)
IS
    TYPE tab_ind_comenzi IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    t1 tab_ind_comenzi;
    idr comanda_apo.id_restaurant%TYPE := NULL;
BEGIN
    SELECT id_restaurant
    BULK COLLECT INTO t1
    FROM (SELECT COUNT(*) AS num, id_restaurant
                FROM comanda_apo c, client_apo cl
                WHERE c.id_client = cl.id_client
                AND c.id_client = idd1
                GROUP BY id_restaurant) y
    order by y.num desc;  
    idd1 := t1(1);
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR (-200, '');
END;
/

DECLARE
    TYPE rec IS RECORD (id1 client_apo.id_client%TYPE,
                        nume client_apo.nume_client%TYPE,
                        prenume client_apo.prenume_client%TYPE);
    TYPE tab_ind_clienti IS TABLE OF rec INDEX BY PLS_INTEGER;
    t tab_ind_clienti;
    age client_apo.varsta_client%TYPE := '19';
    idd client_apo.id_client%TYPE := NULL;
    rest restaurant_apo.nume_rest%TYPE;
BEGIN
    SELECT distinct c.id_client, c.nume_client, c.prenume_client 
    BULK COLLECT INTO t
    FROM client_apo c RIGHT JOIN comanda_apo cm
    ON c.id_client = cm.id_client
    WHERE varsta_client > age
    order by c.id_client;  --punem in tabelul indexat clientii care au plasat cel putin o comanda si care au varsta mai mare decat numarul dat de la tastatura
    FOR i IN t.FIRST..t.LAST LOOP
        idd := t(i).id1;
        proc_ex6(idd);
        SELECT nume_rest
        INTO rest
        FROM restaurant_apo
        WHERE id_restaurant = idd;
        DBMS_OUTPUT.PUT_LINE(t(i).nume || ' ' || t(i).prenume || ' -> ' || rest);
    END LOOP;
END;
/


--7. Pentru restaurant cu un id dat, afisati numele produselor care au fost comandate cel putin o data si de cate ori. (ciclu cursor cu subcereri)

CREATE OR REPLACE PROCEDURE proc_ex7 
    (idd IN NUMBER)
IS
nume produs_apo.nume_produs%TYPE;
BEGIN
    FOR i IN (SELECT p.id_produs idp, SUM(pc.cantitate_produs) cantitate
            from produs_apo p,  produs_comanda_apo pc
            WHERE p.id_produs = pc.id_produs
            AND p.id_restaurant = idd
            group by p.id_produs) LOOP
                SELECT nume_produs
                into nume
                from produs_apo
                where id_produs = i.idp;
                DBMS_OUTPUT.PUT_LINE(nume || ' ' || i.cantitate);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR (-200, '');
END;
/

DECLARE
    idr restaurant_apo.id_restaurant%TYPE := 3;
BEGIN
    proc_ex7(idr);
END;


--8. Pentru fiecare livrator(nume, prenume), afisati numele si prenumele clientului la care a mers cel mai des si cate comenzi i-a livrat.
CREATE OR REPLACE FUNCTION fct_ex8
    (idd NUMBER)
RETURN number
IS
    exceptie EXCEPTION;
    rezultat number := 0;
    TYPE rec IS RECORD (idd livrator_apo.id_livrator%TYPE,
                        nume client_apo.nume_client%TYPE,
                        prenume client_apo.prenume_client%TYPE,
                        nr number(4));
    TYPE tab_ind_clienti IS TABLE OF rec INDEX BY PLS_INTEGER;
    t tab_ind_clienti;
BEGIN
     SELECT l.id_livrator, cl.nume_client, cl.prenume_client, COUNT(cl.nume_client) NR
     BULK COLLECT INTO t
     from livrator_apo l inner join comanda_apo c on l.id_livrator = c.id_livrator inner join client_apo cl on c.id_client = cl.id_client
     where l.id_livrator = idd
     group by l.id_livrator, cl.nume_client, cl.prenume_client
     order by NR desc;
     IF t.COUNT() = 0 THEN RAISE exceptie;
     ELSE
         DBMS_OUTPUT.PUT_LINE(' a livrat la ' || t(1).nume || ' ' || t(1).prenume);
         rezultat := t(1).nr;
         return rezultat;
    end if;
    EXCEPTION 
        when exceptie then
            DBMS_OUTPUT.PUT('nu a livrat nicio comanda.');
            DBMS_OUTPUT.PUT_LINE(' ');
            return -1;
END;
/

DECLARE
    v_id livrator_apo.id_livrator%TYPE;
    v_nume livrator_apo.nume_livrator%TYPE;
    v_prenume livrator_apo.prenume_livrator%TYPE;
    CURSOR c IS 
        SELECT id_livrator, nume_livrator, prenume_livrator
        FROM livrator_apo;
    rez VARCHAR2(150);
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO v_id, v_nume, v_prenume;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT(v_nume || ' ' || v_prenume || ' ');
        rez := fct_ex8(v_id);
        IF rez <> -1 THEN
            DBMS_OUTPUT.PUT_LINE( rez || ' comenzi');
        END IF;
    END LOOP;
    CLOSE c;
END;
/


--9. Pentru toate comenzile plasate pe o data anume, afisati toate detaliile acesteia( nume, 
--prenume livrator; produse comandate; nume restaurant; nume, prenume client)
CREATE OR REPLACE PROCEDURE proc_ex9 
    (idd IN number)
IS
    TYPE rec IS RECORD (id_com comanda_apo.id_comanda%TYPE,
                        nume_rest restaurant_apo.nume_rest%TYPE,
                        nume_cl client_apo.nume_client%TYPE,
                        prenume_cl client_apo.prenume_client%TYPE,
                        nume_liv livrator_apo.nume_livrator%TYPE,
                        prenume_liv livrator_apo.prenume_livrator%TYPE);
    r rec;
    TYPE tab_ind IS TABLE OF produs_apo.nume_produs%TYPE INDEX BY PLS_INTEGER;
    t tab_ind;
BEGIN
    select c.id_comanda, r.nume_rest, cl.nume_client, cl.prenume_client, l.nume_livrator, l.prenume_livrator
    into r
    from restaurant_apo r join comanda_apo c on r.id_restaurant = c.id_restaurant join livrator_apo l on c.id_livrator = l.id_livrator join client_apo cl on c.id_client = cl.id_client
    where id_comanda = idd;
    DBMS_OUTPUT.PUT_LINE('Comanda cu id-ul ' || r.id_com || ' a fost plasata de ' || r.nume_cl ||' '||r.prenume_cl||' la '||r.nume_rest||' si livrata de '||r.nume_liv||' '||r.prenume_liv||' si contine urmatoarele produse: ');
    select p.nume_produs
    bulk collect into t
    from produs_apo p join produs_comanda_apo pc on p.id_produs = pc.id_produs join comanda_apo c on c.id_comanda = pc.id_comanda
    where c.id_comanda = idd;
    for i in t.first()..t.last() loop
        DBMS_OUTPUT.PUT(t(i) || ' ');
        DBMS_OUTPUT.PUT_LINE(' ');
    end loop;
END;
/

DECLARE
    v_data DATE := '20-DEC-02';
    i number := -1;
    exceptie1 exception;
BEGIN
    FOR i IN (SELECT id_comanda
            from comanda_apo
            where data_comanda = v_data) LOOP
        proc_ex9(i.id_comanda);
    END LOOP;
    if i = -1 then raise exceptie1;
    end if;
EXCEPTION
    WHEN exceptie1 THEN DBMS_OUTPUT.PUT_LINE('Nu au fost plasate comenzi in ziua aleasa.');
END;
/



--10. Definiti un trigger care sa nu permita plasarea/editarea/stergerea comenzilor miercurea de la 17 la 19 (interval de mentenanta).
CREATE OR REPLACE TRIGGER trig_ex10
    BEFORE INSERT OR DELETE OR UPDATE on comanda_apo
BEGIN
    IF(TO_CHAR(SYSDATE,'D') = 4) AND (TO_CHAR(SYSDATE,'HH24') BETWEEN 17 AND 19) THEN
        IF INSERTING THEN
            RAISE_APPLICATION_ERROR(-20001,'Plasarea comenzilor nu este posibila in intervalul destinat mentenantei bazei de date.');
        ELSIF DELETING THEN
            RAISE_APPLICATION_ERROR(-20002,'Stergea comenzilor nu este posibila in intervalul destinat mentenantei bazei de date.');
        ELSE 
            RAISE_APPLICATION_ERROR(-20002,'Actualizarea comenzilor nu este posibila in intervalul destinat mentenantei bazei de date.');
        END IF;
    END IF;
END;
/

--Pentru verificare:
INSERT INTO comanda_apo VALUES (9, 1, 4, 3, 140, '21-JAN-07');
INSERT INTO produs_comanda_apo VALUES (17, 9, 4);
INSERT INTO produs_comanda_apo VALUES (21, 9, 4);


--11. Definiti un trigger care sa nu permita micsorarea  pretului unei comenzi cu valoare mai mica de 100 de lei.
--(pentru acestea nu sunt disponibile reduceri)
CREATE OR REPLACE PROCEDURE f_reducere
    (v_id number)
IS
BEGIN
    UPDATE comanda_apo
    SET pret_comanda = pret_comanda - 10
    WHERE id_comanda = v_id;
END;
/

CREATE OR REPLACE TRIGGER trig_ex11
    BEFORE UPDATE of pret_comanda on comanda_apo
    FOR EACH ROW
BEGIN
    IF :OLD.pret_comanda < 100 AND :NEW.pret_comanda < :OLD.pret_comanda THEN
        RAISE_APPLICATION_ERROR(-20004,'Comenzile cu valoare mai mica de 100 de lei nu pot beneficia de reduceri.');
    END IF;
END;
/
DECLARE
    v_idd comanda_apo.id_comanda%TYPE := '2';
BEGIN
    f_reducere(v_idd);
END;
/


--12. Defini?i un declan?ator care s? introduc? date în acest tabel dup? ce utilizatorul a folosit o comand? LDD
CREATE TABLE audit_user
(eveniment VARCHAR2(20),
tip_obiect_referit VARCHAR2(30),
nume_obiect_referit VARCHAR2(30),
data TIMESTAMP(3));
CREATE OR REPLACE TRIGGER audit_schema
 AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
 INSERT INTO audit_user
 VALUES (SYS.SYSEVENT, SYS.DICTIONARY_OBJ_TYPE,
 SYS.DICTIONARY_OBJ_NAME, SYSTIMESTAMP(3));
END;
/
CREATE TABLE tabel (coloana_1 number(2));
ALTER TABLE tabel ADD (coloana_2 number(2));
INSERT INTO tabel VALUES (1,2);
CREATE INDEX ind_tabel ON tabel(coloana_1);
SELECT * FROM audit_user;


--13. 
CREATE OR REPLACE PACKAGE pachet1_apo AS
    PROCEDURE proc_ex6 (idd1 IN OUT number);
    PROCEDURE proc_ex7 (idd number);
    FUNCTION fct_ex8 (idd number) return number;
    PROCEDURE proc_ex9 (idd number);
END pachet1_apo;
/

CREATE OR REPLACE PACKAGE BODY pachet1_apo AS
    PROCEDURE proc_ex6 
        (idd1 IN OUT NUMBER)
    IS
        TYPE tab_ind_comenzi IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
        t1 tab_ind_comenzi;
        idr comanda_apo.id_restaurant%TYPE := NULL;
    BEGIN
        SELECT id_restaurant
        BULK COLLECT INTO t1
        FROM (SELECT COUNT(*) AS num, id_restaurant
                    FROM comanda_apo c, client_apo cl
                    WHERE c.id_client = cl.id_client
                    AND c.id_client = idd1
                    GROUP BY id_restaurant) y
        order by y.num desc;  
        idd1 := t1(1);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR (-200, '');
    END proc_ex6;
    
    PROCEDURE proc_ex7 
        (idd IN NUMBER)
    IS
    nume produs_apo.nume_produs%TYPE;
    BEGIN
        FOR i IN (SELECT p.id_produs idp, SUM(pc.cantitate_produs) cantitate
                from produs_apo p,  produs_comanda_apo pc
                WHERE p.id_produs = pc.id_produs
                AND p.id_restaurant = idd
                group by p.id_produs) LOOP
                    SELECT nume_produs
                    into nume
                    from produs_apo
                    where id_produs = i.idp;
                    DBMS_OUTPUT.PUT_LINE(nume || ' ' || i.cantitate);
        END LOOP;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            RAISE_APPLICATION_ERROR (-200, '');
    END proc_ex7;
    
    FUNCTION fct_ex8
        (idd NUMBER)
    RETURN number
    IS
        exceptie EXCEPTION;
        rezultat number := 0;
        TYPE rec IS RECORD (idd livrator_apo.id_livrator%TYPE,
                            nume client_apo.nume_client%TYPE,
                            prenume client_apo.prenume_client%TYPE,
                            nr number(4));
        TYPE tab_ind_clienti IS TABLE OF rec INDEX BY PLS_INTEGER;
        t tab_ind_clienti;
    BEGIN
         SELECT l.id_livrator, cl.nume_client, cl.prenume_client, COUNT(cl.nume_client) NR
         BULK COLLECT INTO t
         from livrator_apo l inner join comanda_apo c on l.id_livrator = c.id_livrator inner join client_apo cl on c.id_client = cl.id_client
         where l.id_livrator = idd
         group by l.id_livrator, cl.nume_client, cl.prenume_client
         order by NR desc;
         IF t.COUNT() = 0 THEN RAISE exceptie;
         ELSE
             DBMS_OUTPUT.PUT_LINE(' a livrat la ' || t(1).nume || ' ' || t(1).prenume);
             rezultat := t(1).nr;
             return rezultat;
        end if;
        EXCEPTION 
            when exceptie then
                DBMS_OUTPUT.PUT('nu a livrat nicio comanda.');
                DBMS_OUTPUT.PUT_LINE(' ');
                return -1;
    END fct_ex8;
    
    PROCEDURE proc_ex9 
        (idd IN number)
    IS
        TYPE rec IS RECORD (id_com comanda_apo.id_comanda%TYPE,
                            nume_rest restaurant_apo.nume_rest%TYPE,
                            nume_cl client_apo.nume_client%TYPE,
                            prenume_cl client_apo.prenume_client%TYPE,
                            nume_liv livrator_apo.nume_livrator%TYPE,
                            prenume_liv livrator_apo.prenume_livrator%TYPE);
        r rec;
        TYPE tab_ind IS TABLE OF produs_apo.nume_produs%TYPE INDEX BY PLS_INTEGER;
        t tab_ind;
    BEGIN
        select c.id_comanda, r.nume_rest, cl.nume_client, cl.prenume_client, l.nume_livrator, l.prenume_livrator
        into r
        from restaurant_apo r join comanda_apo c on r.id_restaurant = c.id_restaurant join livrator_apo l on c.id_livrator = l.id_livrator join client_apo cl on c.id_client = cl.id_client
        where id_comanda = idd;
        DBMS_OUTPUT.PUT_LINE('Comanda cu id-ul ' || r.id_com || ' a fost plasata de ' || r.nume_cl ||' '||r.prenume_cl||' la '||r.nume_rest||' si livrata de '||r.nume_liv||' '||r.prenume_liv||' si contine urmatoarele produse: ');
        select p.nume_produs
        bulk collect into t
        from produs_apo p join produs_comanda_apo pc on p.id_produs = pc.id_produs join comanda_apo c on c.id_comanda = pc.id_comanda
        where c.id_comanda = idd;
        for i in t.first()..t.last() loop
            DBMS_OUTPUT.PUT(t(i) || ' ');
            DBMS_OUTPUT.PUT_LINE(' ');
        end loop;
    END proc_ex9;
END pachet1_apo;

--apelare pachet1_apo.proc_ex6:
DECLARE 
    TYPE rec IS RECORD (id1 client_apo.id_client%TYPE,
                        nume client_apo.nume_client%TYPE,
                        prenume client_apo.prenume_client%TYPE);
    TYPE tab_ind_clienti IS TABLE OF rec INDEX BY PLS_INTEGER;
    t tab_ind_clienti;
    age client_apo.varsta_client%TYPE := '19';
    idd client_apo.id_client%TYPE := NULL;
    rest restaurant_apo.nume_rest%TYPE;
BEGIN
    SELECT distinct c.id_client, c.nume_client, c.prenume_client 
    BULK COLLECT INTO t
    FROM client_apo c RIGHT JOIN comanda_apo cm
    ON c.id_client = cm.id_client
    WHERE varsta_client > age
    order by c.id_client;  --punem in tabelul indexat clientii care au plasat cel putin o comanda si care au varsta mai mare decat numarul dat de la tastatura
    FOR i IN t.FIRST..t.LAST LOOP
        idd := t(i).id1;
        pachet1_apo.proc_ex6(idd);
        SELECT nume_rest
        INTO rest
        FROM restaurant_apo
        WHERE id_restaurant = idd;
        DBMS_OUTPUT.PUT_LINE(t(i).nume || ' ' || t(i).prenume || ' -> ' || rest);
    END LOOP;
END;
/

--apelare pachet1_apo.proc_ex7
DECLARE
    idr restaurant_apo.id_restaurant%TYPE := 3;
BEGIN
    pachet1_apo.proc_ex7(idr);
END;

--apelare pachet1_apo.fct_ex8
DECLARE
    v_id livrator_apo.id_livrator%TYPE;
    v_nume livrator_apo.nume_livrator%TYPE;
    v_prenume livrator_apo.prenume_livrator%TYPE;
    CURSOR c IS 
        SELECT id_livrator, nume_livrator, prenume_livrator
        FROM livrator_apo;
    rez VARCHAR2(150);
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO v_id, v_nume, v_prenume;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT(v_nume || ' ' || v_prenume || ' ');
        rez := pachet1_apo.fct_ex8(v_id);
        IF rez <> -1 THEN
            DBMS_OUTPUT.PUT_LINE( rez || ' comenzi');
        END IF;
    END LOOP;
    CLOSE c;
END;
/

--apelare pachet1_apo.proc_ex9
DECLARE
    v_data DATE := '20-DEC-02';
    i number := -1;
    exceptie1 exception;
BEGIN
    FOR i IN (SELECT id_comanda
            from comanda_apo
            where data_comanda = v_data) LOOP
        pachet1_apo.proc_ex9(i.id_comanda);
    END LOOP;
    if i = -1 then raise exceptie1;
    end if;
EXCEPTION
    WHEN exceptie1 THEN DBMS_OUTPUT.PUT_LINE('Nu au fost plasate comenzi in ziua aleasa.');
END;
/