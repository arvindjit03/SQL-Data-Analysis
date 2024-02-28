-- Descrptive Data Analysis of FIFA 19 Players dataset

-- Created Database to import the dataset
create database Fifa_19

use Fifa_19

select * from tbl_fifa_players;

--#1 How many players are there in the datasets?
select count(*) as Total_Players from tbl_fifa_players;

--#2 How many nationalities do these players belong to?
select count(distinct nationality) as number_of_nationalities from tbl_fifa_players;

--#3 Which nationality has the highest number of players, what are the top 3 nationalities by # of players?
select nationality, count(*) as frequency from tbl_fifa_players group by nationality order by frequency desc;

select top 3 nationality, count(*) as frequency from tbl_fifa_players group by nationality order by frequency desc;

--#4 What is the total wage, average and standard deviation wage given to all players?
select sum(wage) as total_wage, avg(wage) as average_wage, STDEV(wage) as std_wage from tbl_fifa_players;
--# Alter the data type for wage column
alter table tbl_fifa_players
alter column wage float(50);

--#5 Which player has the highest wage and lowest wage?
select name from tbl_fifa_players where wage=(select max(wage) from tbl_fifa_players);

select name from tbl_fifa_players where wage=(select min(wage) from tbl_fifa_players);

--#6 Which are the top 3 Clubs with highest total of overall rating?
select club, sum(overall_rating) as total_rating from tbl_fifa_players group by club order by total_rating desc;

--# Alter the data type for overall_rating column
alter table tbl_fifa_players
alter column  overall_rating float(50);

select top 3 club,  sum(overall_rating) as total_rating from tbl_fifa_players group by club order by total_rating desc;

--#7 What are the top 5 clubs based on the average ratings of their players?
select top 5 club, avg(overall_rating) as average_rating from tbl_fifa_players group by club order by average_rating desc;

--#8 What is the distribution of players whose preferred foot is left vs right?
select preferred_foot, count(*) as frequency  from tbl_fifa_players group by preferred_foot order by frequency desc;

--#9 Which jersey number is the luckiest for penalties?
select top 1 jersey_no, Penalties as Penalties from tbl_fifa_players order by Penalties desc;

--#10 Which jersey number is the top with highest wage?
select top 1 sum(wage) as total_wage, [jersey_no] from tbl_fifa_players group by [jersey_no] order by total_wage desc;
--will show top jersey number with highest wage