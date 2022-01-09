---QUESTION 2

---Find the number of classes (using classID in count) in the Classes table as class_count
---grouped by the CategoryDescription field in the Categories table as category_name. Only 
---return a single record (or row) from a grouping of rows with the same class_count.
---Sort by the class_count descending and category_name ascending. Limit to 5 results.

---tables needed:  Categories, Subjects, Classes

select distinct on (count(a.classid))
count(a.classid) as class_count,
ca.CategoryDescription as category_name
from classes a
join subjects b on a.subjectid = b.subjectid
join categories ca on b.categoryid = ca.categoryid
group by ca.CategoryDescription
order by class_count desc, category_name asc
limit 5;



----QUESTION 2

---Find the number of classes (using the StaffID key in the count) from the Classes Faculty_Classes table as class_count and the number of distinct subjects (using SubjectID in the count) as subject_count for each person in the Staff table even if they have no classes or subjects. Return the StfFirstName, StfLastname, Position, DateHired (all Staff table), 
---and the Title (Faculty table). However, from these results, only return a single record (or row) 
---from a grouping of rows with the same class_count. 
---Sort by the class_count and Title both ascending, and DateHired descending. 
---Limit to 6 results.


---tables needed: Staff, Faculty_Classes, Faculty, Faculty_Subjects, Subjects

select count(fc.staffid) as class_count,
	count(distinct(sb.subjectid)) as subject_count,
	s.StfFirstName, 
	s.StfLastname, 
	s.Position, 
	s.DateHired,
	f.Title
from staff s 
join faculty_classes fc on fc.staffid = s.staffid
join faculty f on f.staffid = fc.staffid
join faculty_subjects fs on f.staffid = fs.staffid
join subjects sb on sb.subjectid = fs.subjectid
group by fc.staffid, sb.subjectID, s.StfFirstName, s.StfLastname, s.Position, s.DateHired, f.Title
order by class_count, Title, DateHired desc
limit 6;






---question 3

---Find the number of distinct movies (by movie_id in the movies_actors table) as total_movies,
---number of actors (by actor_id in the movies_actors table) as total_actors, the sum of 
---the revenues_domestic (movies_revenues table) as dom_rev for each director in the Directors table by first_name and last_name. Only return groupings that have a total_movies value equal to 1. From these results, return a single record (or row) from a grouping of rows with the same number of total_actors. 
---Sort by the total_actors descending, dom_rev descending, and last_name desc.


---tables needed: directors, movies,  movies_revenues, movies_actors

select distinct on(a.actor_id)
	count(a.movie_id) as total_movies, 
	count(a.actor_id) as total_actors,
	sum(b.revenues_domestic) as dom_rev,
	c.first_name, 
	c.last_name
	from directors c
	join movies d on c.director_id = d.director_id
	join movies_revenues b on d.movie_id = b.movie_id
	join movies_actors a on b.movie_id = a.movie_id
	group by a.movie_id, a.actor_id, c.first_name, c.last_name 
	having count(distinct(a.movie_id)) = 1
	order by a.actor_id, total_actors desc, dom_rev desc, c.last_name desc;
	
---question 4

--Find the sum of the revenues_domestic plus the revenues_international as total_value grouped by the 
--director_name and actor_name where the revenues_domestic is not null and the revenues_international 
--is not null. Sort by the total_value descending and the director_name descending. Limit to 4 results.

--director_name = is the first_name concatenated with the last_name field from the Directors table as so 'first_name, last_name'

--actor_name = is the first_name concatenated with the last_name field from the Actors table as so 'first_name, last_name'

--tables needed: directors, movies, movie_actors, actors, movies_revenues


select (mr.revenues_domestic + mr.revenues_international) as total_value,
d.first_name || d.last_name as director_name,
a.first_name || a.last_name as actor_name
from directors d
join movies m on d.director_id = m.director_id
join movies_revenues mr on m.movie_id = mr.movie_id
join movies_actors ma on mr.movie_id = ma.movie_id
join actors a on a.actor_id = ma.actor_id
group by director_name, actor_name, mr.revenues_domestic, mr.revenues_international
having revenues_domestic is not null and revenues_international  is not null
order by total_value desc, director_name desc
limit 4;