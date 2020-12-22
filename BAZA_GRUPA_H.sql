CREATE TABLE Aviokompanija (
aviokompanija_ID INT NOT NULL AUTO_INCREMENT,
ime_aviokompanije VARCHAR(255) NOT NULL,
PRIMARY KEY(aviokompanija_ID)
);

CREATE TABLE Avion (
avion_ID INT NOT NULL AUTO_INCREMENT,
model VARCHAR(255),
kapacitet INT,
PRIMARY KEY(avion_ID)
);

CREATE TABLE Aerodrom (
aerodrom_ID INT NOT NULL AUTO_INCREMENT,
ime_aerodroma VARCHAR(255) NOT NULL,
grad VARCHAR(255),
drzava VARCHAR(255),
PRIMARY KEY(aerodrom_ID)
);
 DROP TABLE let;

CREATE TABLE Let (
aviokompanija_ID INT,
avion_ID INT,
aerodrom_ID INT,
let_ID INT NOT NULL AUTO_INCREMENT,
ime_leta VARCHAR(255),
datum_polijetanja INT,
vrijeme_polijetanja INT,
broj_putnika INT,
PRIMARY KEY(let_ID),
FOREIGN KEY (aviokompanija_ID) REFERENCES Aviokompanija(aviokompanija_ID),
FOREIGN KEY (avion_ID) REFERENCES Avion(avion_ID),
FOREIGN KEY (aerodrom_ID) REFERENCES Aerodrom(aerodrom_ID)
);

CREATE TABLE Osoblje (
osoba_ID INT NOT NULL AUTO_INCREMENT,
ime VARCHAR (255) NOT NULL,
prezime VARCHAR (255) NOT NULL,
JMBG INT NOT NULL,
opis_posla VARCHAR(255),
plata INT,
aerodrom_ID INT,
PRIMARY KEY (osoba_ID),
FOREIGN KEY (aerodrom_ID) REFERENCES Aerodrom(aerodrom_ID)
);

CREATE TABLE Putnik (
putnik_ID INT NOT NULL AUTO_INCREMENT,
ime VARCHAR(255) NOT NULL,
prezime VARCHAR(255) NOT NULL,
JMBG INT NOT NULL,
Pasos VARCHAR(255),
let_ID INT,
PRIMARY KEY (putnik_ID),
FOREIGN KEY (let_ID) REFERENCES Let(Let_ID)
);

CREATE TABLE Odrediste (
datum_slijetanja INT,
vrijeme_slijetanja INT,
mjesto_slijetanja INT,
let_ID INT,
FOREIGN KEY (let_ID) REFERENCES Let(Let_ID),
FOREIGN KEY (mjesto_slijetanja) REFERENCES Aerodrom(Aerodrom_id)
); 

CREATE TABLE cijena (
let_ID INT,
cijena_karte INT,
FOREIGN KEY (let_ID) REFERENCES Let(Let_ID)
);

INSERT INTO Avion (model, kapacitet)
VALUES ('Boeing 787', '242');

INSERT INTO Aviokompanija (ime_aviokompanije)
VALUES ('Delta Air Lines'), ('America Airlines Group'), ('Lufthansa group'), ('Air France'), ('China Southern Airlines'), ('China Eastern Airlines'), ('Emirates'), ('British Airways');

INSERT INTO Aerodrom (ime_aerodroma, grad, drzava)
VALUES ('Charles de Gaulle Airport', 'Paris', 'France');

INSERT INTO Let (aviokompanija_ID, aerodrom_ID, avion_ID, ime_leta, datum_vrijeme_polijetanja, broj_putnika)
VALUES ('3', '1', '7', 'Sarajevo-Paris', '2020-03-15 08:45:00', '110');

INSERT INTO putnik (ime, prezime, JMBG, pasos, let_ID)
VALUES ('Samir', 'Zeljkovic', '26215', 'Bosna i Hercegovina', '8');

INSERT INTO osoblje (ime, prezime, JMBG, opis_posla, plata, aerodrom_ID)
VALUES ('Irma', 'Hodzic', '42421', 'Pilot', '0', '1');

INSERT INTO odrediste (datum_vrijeme_slijetanja, mjesto_slijetanja, let_ID)
VALUES ('2020-03-15 12:34:00', '13', '35');




 


create view let_putnika                
AS
select p.ime,
       p.prezime,
       p.pasos,         /* pogled */
       p.jmbg,
       l.ime_leta
 from putnik p
inner join let l
on p.let_ID = l.let_ID
order by pasos;

drop trigger tr_plata;

delimiter //
 CREATE TRIGGER tr_plata BEFORE INSERT ON osoblje
       FOR EACH ROW
       BEGIN
           IF NEW.opis_posla = 'Pilot' THEN
               SET NEW.plata = 2700;
               END IF;
               END; //
               
               






       
       
     
     select p.ime,        
            p.prezime,
            p.let_ID,
            l.ime_leta,
            l.datum_vrijeme_polijetanja,
            o.datum_vrijeme_slijetanja,
            a.ime_aerodroma,
            a.grad,
            a.drzava
            from aerodrom a
            inner join odrediste o
            on a.aerodrom_ID = o.mjesto_slijetanja
            inner join let l 
            on o.let_ID = l.let_ID
            inner join putnik p
            on p.let_ID = l.let_ID;
          
            
           
            
            
            select o.ime,  
                   o.prezime,
                   o.opis_posla,
                   o.plata
                   from osoblje o
                   where plata > (select AVG(plata) from osoblje)
                   order by plata DESC;
                   
	select l.ime_leta,
           a.model,
           a.kapacitet
           from let l 
           inner join avion a
           on l.avion_ID = a.avion_ID
           where kapacitet in (select a.kapacitet from avion a where a.kapacitet > 200 );
           
         
    
    DELETE FROM osoblje WHERE osoba_ID = '27';
           
                   
                   
	
    
            
            
            
            
            
      


              
              
              
       
       
              
      

       


select * from aviokompanija;
select * from aerodrom;
select * from avion;
select * from let;
select * from putnik;
select * from osoblje where osoba_ID = '29'; 
order by osoba_ID;
select * from odrediste;













