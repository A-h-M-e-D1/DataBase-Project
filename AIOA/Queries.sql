use aioa;

/*-------------Display all Information about Passenger Table-------------*/
select * from passenger;


/*------------Display Full name about Passenger sex is male--------------*/
select CONCAT(F_name, ' ', M_name, ' ', L_name) AS Passenger_name, passenger_id
from PASSENGER
where sex = 'male';


/*------------Display full name Passenger That address in new  Assuit----------*/
select CONCAT(F_name, ' ', M_name, ' ', L_name) AS Passenger_name, passenger_id, address
from PASSENGER
where address LIKE '%New Asyut%';


/*-----------Display Passenger Name and distinct phone number Start by 012------------*/
select F_name,  M_name, L_name AS Passenger_name, passenger_id
from PASSENGER
where phone LIKE '12%';


/*-----------Display Passenger name based on some condition like phone 015 and address-------*/
select CONCAT(F_name, ' ', M_name, ' ', L_name) AS Passenger_name, passenger_id
from PASSENGER
where phone LIKE '15%' and address LIKE '%Kom Ombo%';


/*-----------Display information about Train and ticket ---------*/
select *
from train t1
join ticket t2 on t1.train_no = t2.train_train_no
where t2.pay_method = 'visa' and t1.class = 'normal';


/*--------Display number of ticket reserved --------*/
select COUNT(ticket_no) AS Total_Ticket_reserved
from ticket;

/*--------Display number of train that start from specific station------------*/
select COUNT(*) AS number_of_train
from train t
where t.station_start = 'Aswan';


/*------Dispaly avarage number of seat in specific train and start from specific station  ---------*/
select  AVG(seat_no_avaiable) AVG_avaiable_seat from train t
where t.station_start = 'Sidi GaberSation' and t.class = 'air conditioner';


/*-------Display min price from Ticket from specific train-------*/
select MAX(price) AS max_price, MIN(price) AS min_price
from ticket t
where t.train_train_no = 871;


/*-----Display employee name that manages a specific station-------*/
select e.ssn, CONCAT(e.F_name, ' ', e.M_name, ' ', e.L_name) AS employee_name, e.salary
from employee e
join station s on e.ssn = s.mg_ssn
where s.station_name = 'Masr';


/*-------Display price of ticket from max to min price--------*/
select price from ticket t
order by price DESC;

/*------Display all information about Passenger who reserved ticket that departing from spcific station------*/
select CONCAT(F_name, ' ', M_name, ' ', L_name) AS Passenger_name
from PASSENGER p
join ticket t on p.passenger_id = t.passenger_passenger_id
join train tr on t.train_train_no = tr.train_no
where tr.station_start = 'Zagazig' limit 1;


/*----Display information about train that leave in specific date----*/
select station_start,station_end,dep_time,arr_time from train tr
join ticket t on tr.train_no = t.train_train_no
where t.date = '2023-03-20'; 


/*----Dispaly information about passenger who booked spacifci train----*/
select distinct p.passenger_id, p.F_name, p.M_name, p.L_name, p.sex, p.address, p.phone,
                t.train_no, t.station_start, t.station_end, t.dep_time, t.arr_time, t.class
from passenger p
join book b on p.passenger_id = b.passenger_passenger_id
join ticket ti on b.ticket_ticket_no = ti.ticket_no
join train t on ti.train_train_no = t.train_no
where b.ticket_ticket_no = '1002';

/*-----Display number of ticket that revesed for each passenger----*/
select CONCAT(F_name, ' ', M_name, ' ', L_name) AS Passenger_name 
          ,(select count(no_of_ticket) from ticket 
		    where passenger_passenger_id  = passenger.passenger_id ) As num_tickets_reserved
from passenger;

/* -----Display  all information about station and manager who has max salary----*/
select * from station s
			join employee e
			on s.mg_ssn = e.ssn
where e.salary = (select max(salary) from employee);


/*-------Display information about ticket that reserved and start specific station-------*/
select * from ticket 
where train_train_no in (select train_no from train t where t.station_start = 'Zagazig' );


/*-----Display information about ticket who passenger have more than 1 ticket------*/
select * from ticket t
where passenger_passenger_id in 
				(select passenger_passenger_id from ticket 
                 group by  passenger_passenger_id 
                 having count(no_of_ticket) > 1 ) and t.no_of_ticket > 1;
			
            
/*------Display all ticket are reserved by passenger that have more than one Ticket ---- */
select p.passenger_id,p.F_name ,t.ticket_no,t.price,t.no_of_ticket,t.date,t.total_price,t.pay_method,tr.train_no,tr.station_start,tr.station_end,tr.dep_time,
tr.arr_time,tr.class
from passenger p
join ticket t on p.passenger_id = t.passenger_passenger_id
join train tr on t.train_train_no = tr.train_no
where p.passenger_id in (
        select passenger_passenger_id
        from ticket
        group by passenger_passenger_id
        having count(no_of_ticket) > 1
    )
order by
    p.passenger_id, t.date;



















