// this file is for upgrades from a really old version of the app

alter table pageParts
	add column fileName varchar(35);
	
alter table layouts
	add column fileName varchar(35);

// not used
// alter table pages add column fileName varchar(35);