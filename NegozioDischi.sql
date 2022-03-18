--Risposte teoria
--1. B
--2. L'associazione molti a molti del modello concettuale si traduce poi nel modello logico, poi riportato sul database, come una relazione 
--molti a uno con una terza tabella che deve contenere i due campi PK delle prime due tabelle. I due campi ID PK nella terza tabella diventano delle FK. 
--3. B
--4. AB
--5. B

Create database GestioneNegozioDischi

--Creazione tabelle e collegamenti

create table Band(
    IdBand int primary key identity(1,1) not null,
    Nome varchar(20) not null,
    NumeroComponenti int not null,
)
create table Album(
    IdAlbum int primary key identity(1,1) not null,
    Titolo varchar(50) not null,
    AnnoUscita int not null,
    CasaDiscografica varchar(20) not null,
    Genere varchar(10) not null default 'Sconosciuto',
	Supporto varchar(20) not null default 'Sconosciuto',
	IdBand int not null constraint FK_BandAlbum foreign key references Band(IdBand),

    constraint UNQ_AlbumSupporto unique(Titolo, AnnoUscita, CasaDiscografica, Genere, Supporto),
	constraint CHK_Genere check (Genere='Sconosciuto' or Genere='Classico' or Genere='Jazz' or Genere='Pop' or Genere='Rock' or Genere='Metal'),
	constraint CHK_Supporto check (Supporto='Sconosciuto' or Supporto='CD' or Supporto='Vinile' or Supporto='Streaming'),
	--constraint UNQ_AlbumSupporto unique(Supporto), --Controllare
)
create table Brano(
    IdBrano int primary key identity(1,1) not null,
    Titolo varchar(50) not null,
    Durata int not null,
)
create table AlbumBrano(
    IdAlbum int not null,
    IdBrano int not null,
	--Supporto varchar(20) not null default 'Sconosciuto',

    constraint FK_AlbumBrano foreign key(IdAlbum) references Album(IdAlbum),
    constraint FK_BranoAlbum foreign key (IdBrano) references Brano(IdBrano),
    constraint PK_AlbumBrano primary key (IdAlbum, IdBrano),
	--constraint CHK_Supporto check (Supporto='Sconosciuto' or Supporto='CD' or Supporto='Vinile' or Supporto='Streaming'),
	--constraint UNQ_AlbumBrano unique(Supporto),
)

--Inserimento dati
select* from Album
select* from Brano
select* from AlbumBrano
select* from Band

--delete from Band
--delete from Brano
--delete from Album
--delete from AlbumBrano

insert into Band values ('883', '2')
insert into Band values ('Maneskin', '4')
insert into Band values ('TheGiornalisti', '2')
insert into Band values ('Beatles', '4')
insert into Band values ('GreenDay', '3')
insert into Band values ('Muse', '3')
insert into Band values ('John Lennon', '1')

insert into Album values ('Hanno ucciso l''uomo ragno', 1995, 'SonyMusic', 'Pop','CD', 1)
insert into Album values ('Nord sud ovest Est', 2020, 'SonyMusic', 'Pop','CD', 1 )
insert into Album values ('Il ballo della vita', 2018, 'RCA Records', 'Pop','CD', 2)
insert into Album values ('Chosen', 2017, 'RCA Records', 'Pop', 'Streaming', 2)
insert into Album values ('Love', 2018, 'RCA Records', 'Pop', 'CD', 3)
insert into Album values ('Fuori campo', 2014, 'Foolica Records', 'Pop', 'CD', 3) 
insert into Album values ('Imagine', 2011, 'Foolica Records', 'Pop', 'CD', 7) 

insert into Brano values ('Imagine', '180') --jon
insert into Brano values ('Hanno ucciso l''uomo ragno', '170') --hanno uc
insert into Brano values ('Non me la menare', '180')
insert into Brano values ('Sei un mito', '190')--nord sud
insert into Brano values ('Come mai', '160')
insert into Brano values ('New song', '190')--the giornal
insert into Brano values ('Torna a casa', '160')
insert into Brano values ('Chosen', '160')
insert into Brano values ('Vengo dalla luna', '160')--Man
insert into Brano values ('Brano1', '160')
insert into Brano values ('Brano2', '160')


insert into AlbumBrano values ('1', '2'), ('1', '3')
insert into AlbumBrano values ('2', '4'), ('2', '5')
insert into AlbumBrano values ('3', '6'), ('3', '7')
insert into AlbumBrano values ('4', '8'), ('4', '9')--Man
insert into AlbumBrano values ('7', '1')--Jon


--Query
--1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;
--2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;
--3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti
--ad album pubblicati prima del 2019;
--4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;
--5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;
--6) Contare per ogni album, la “durata totale” cioè la somma dei secondi dei suoi brani
--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i
--secondi quindi 180 s).
--8) Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”.
--9) Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un
--Album:
--‘Very Old’ se il suo anno di uscita è precedente al 1980,
--‘New Entry’ se l’anno di uscita è il 2021,
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020,
--‘Old’ altrimenti.
--10) Mostrare i brani non contenuti in nessun album.

--1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;

select A.Titolo
from Album A join Band B on A.IdBand=B.IdBand
  where B.Nome='883'
  order by Titolo asc

select* from Album
select* from Brano
select* from AlbumBrano
select* from Band
select* from Album
select* from Brano

--2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;
select *
from Album
  where CasaDiscografica='SonyMusic' and AnnoUscita=2020

--3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti
--ad album pubblicati prima del 2019;

select BR.Titolo, BA.Nome
from Band BA join Album A on BA.IdBand=A.IdBand
             join AlbumBrano AB on A.IdAlbum=AB.IdAlbum
			 join Brano BR on AB.IdBrano=BR.IdBrano
  where BA.Nome='Maneskin' and A.AnnoUscita<2019

--4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;
select *
from Album A join AlbumBrano AB on A.IdAlbum=AB.IdAlbum
			 join Brano BR on AB.IdBrano=BR.IdBrano             
 where BR.Titolo='Imagine'

--5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;
select BA.Nome, count(BR.IdBrano) as 'NumTotCanzoni'
from Band BA join Album A on BA.IdBand=A.IdBand
             join AlbumBrano AB on A.IdAlbum=AB.IdAlbum
			 join Brano BR on AB.IdBrano=BR.IdBrano
group by BA.Nome
having BA.Nome='TheGiornalisti'--Verificare

--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i
--secondi quindi 180 s).
select distinct *
from Band BA join Album A on BA.IdBand=A.IdBand
             join AlbumBrano AB on A.IdAlbum=AB.IdAlbum
			 join Brano BR on AB.IdBrano=BR.IdBrano
where BA.Nome='883' and BR.Durata>180

--8) Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”.
select Nome
from Band
where Nome like 'M%n'

--9) Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un Album:
--‘Very Old’ se il suo anno di uscita è precedente al 1980,
--‘New Entry’ se l’anno di uscita è il 2021,
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020,
--‘Old’ altrimenti.

select Titolo,
case
when A.AnnoUscita>1980 then 'VeryOld'
when A.AnnoUscita=2021 then 'NewEntry'
when A.AnnoUscita between 2010 and 2020 then 'Recente'
else 'Old'
end as [Classificazione]
from Album A

--10) Mostrare i brani non contenuti in nessun album.
select *
from Album A join AlbumBrano AB on A.IdAlbum=AB.IdAlbum
			 right join Brano BR on AB.IdBrano=BR.IdBrano  