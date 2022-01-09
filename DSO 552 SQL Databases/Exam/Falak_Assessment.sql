-- Question 1
select distinct on (count(distinct cl.classid)) c.categorydescription category_name, count(distinct cl.classid) class_count
from classes cl join subjects s on cl.subjectid = s.subjectid
join categories c on c.categoryid = s.categoryid
group by c.categorydescription
order by class_count desc, category_name asc
limit 5;

-- Question 2
select distinct on (count( distinct fc.classid))
	sf.stffirstname,
	sf.stflastname,
	sf.staffid,
	sf.position,
	sf.datehired,
	sf.title,
	count(distinct fc.classid) class_count,
	count(distinct fs.subjectid) subject_count
from (select s.stffirstname,
	 s.stflastname,
	 s.position,
	 s.datehired,
	 s.staffid,
	 f.title
	 from staff s left join faculty f on s.staffid = f.staffid) sf
	 left join faculty_classes fc on sf.staffid = fc.staffid
	 left join faculty_subjects fs on sf.staffid = fs.staffid
group by sf.staffid, sf.stffirstname, sf.stflastname, sf.position, sf.datehired, sf.title
order by count(distinct fc.classid), sf.title, sf.datehired desc
limit 6;

-- Question 3
select distinct on (total_actors)
	d.first_name, d.last_name,
	count(distinct ma.movie_id) total_movies,
	count(ma.actor_id) total_actors,
	sum(mr.revenues_domestic) dom_rev
from movies m join directors d on d.director_id = m.director_id
join movies_revenues mr on m.movie_id = mr.movie_id
join movies_actors ma on ma.movie_id = m.movie_id
group by d.first_name, d.last_name
having count(distinct ma.movie_id) = 1
order by total_actors desc,
	dom_rev desc,
	d.last_name desc;

-- Question 4
select d.first_name || ', ' || d.last_name director_name,
	a.first_name || ', ' || a.last_name actor_name,
	sum(mr.revenues_domestic) + sum(mr.revenues_international) total_value
from movies m join directors d on d.director_id = m.director_id
join movies_revenues mr on m.movie_id = mr.movie_id
join movies_actors ma on ma.movie_id = m.movie_id
join actors a on a.actor_id = ma.actor_id
where revenues_international is not null and revenues_domestic is not null
group by d.first_name || ', ' || d.last_name, a.first_name || ', ' || a.last_name
order by total_value desc, director_name desc
limit 4;
	
-- Question 5
select t1.subjectname, count(distinct cl.classid) class_count, count(ss.studentid) student_count
from classes cl join
(select subjectname, subjectid
from subjects
where subjectid not in (select distinct subjectid
					   from faculty_subjects)) t1
on cl.subjectid = t1.subjectid
left join student_schedules ss on cl.classid = ss.classid
group by t1.subjectname;

-- Question 6
select s.subjectname, count(distinct cl.classid) class_count
from classes cl join subjects s on cl.subjectid = s.subjectid
join student_schedules ss on cl.classid = ss.classid
join student_class_status scs on ss.classstatus = scs.classstatus
where scs.classstatusdescription = 'Completed'
group by s.subjectname
having s.subjectname ilike '%fundamental%';

-- Question 7
select m.major, scs.classstatusdescription, count(s.studentid) student_count
from students s join majors m on s.studmajor = m.majorid
join student_schedules ss on s.studentid = ss.studentid
join student_class_status scs on scs.classstatus = ss.classstatus
group by m.major, scs.classstatusdescription
order by student_count desc, m.major asc
limit 4;

-- Question 8
select distinct c.company_name, extract(year from o.order_date) order_year, sum(od.quantity) total_quantity, count(od.order_id) total_orders
from customers c join orders o on c.customer_id = o.customer_id
join order_details od on od.order_id = o.order_id
where c.country = 'UK'
group by c.company_name, extract(year from o.order_date)
having count(od.order_id)>10
order by total_quantity desc, total_orders desc;


