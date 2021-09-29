-- drop table if exists stations;

create table stations(
	id varchar(10) not null unique,
    name varchar(50),
    cc varchar(50) not null,
    latitude real,
    longitude real
);

insert into stations values(
	'IN13',
    'Pheonix',
    'AZ',
    33,
    139
);

insert into stations values(
	'IN14',
    'Florida Stars',
    'US',
    55,
    334
);

insert into stations values(
	'IN15',
    'Areona',
    'ML',
    220,
    11
);

select * from stations;

select * from stations where latitude > 39.7;

select id,cc,name from stations;

select cc,name from stations where latitude<longitude;

create table stats(
	id varchar(50),
    monthval integer not null,
    temp real,
    rain real,
    primary key (id,monthval),
    foreign key (id) references stations(id)
);

select * from stats;

insert into stats values('IN15',1,34.445,12.4);
insert into stats values('IN15',1,34.45,13.4);

insert into stats values('IN14',3,4.99,0.09);
insert into stats values('IN14',6,34.7,3);
insert into stats values('IN13',7,88.88,0.09);

select stn.name as Name,stn.cc as Country,stn.latitude as Latitude,stn.longitude as Longitude,avg(st.temp) as Avg_Temp from stations as stn
join stats as st on stn.id=st.id
group by stn.id;

select * from stats
order by monthval,rain desc;

insert into stats values('IN15',7,32.23,88);

select stn.name as City,stn.cc as Country,stn.latitude as Latitude,st.temp as Temp from stations as stn
join stats as st on stn.id=st.id
where st.monthval=7
order by Temp;

select id as Station_ID,max(temp) as Max_Temp,min(temp) as Min_Temp,avg(rain) as Avg_Rainfall from stats
group by Station_ID;

drop table if exists stats