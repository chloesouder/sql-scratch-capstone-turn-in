--Slide 4 Column  Number of potential clients who answered each question
select question, Count(user_id)
from survey
group by question;

--Slide 4 Column 3 Percentage of total clients who answered each question
=(Q1/Q1)*100
=(Q2/Q1)*100
=(Q3/Q1)*100
=(Q4/Q1)*100
=(Q5/Q1)*100

--Slide 5 Top 8 most popular responses from the Take home quiz
select count(user_id) as 'Count', style, fit, shape, color
from quiz
group by style, fit, shape, color
having count(*) > 1
order by count(user_id) desc
limit 8;

--Slide 6 - All product options 
select *
from purchase
group by product_id;

--Slide 7 Is that what people are actually buying?
select count(user_id) as 'Count', product_id, style, color, price
from purchase
group by product_id, style, color, price
having count(*) > 1
order by count(user_id) desc;

--Where I got the bullet note that states there are proportional number of men/women between home try on and purchased
select count(user_id), style
from quiz
group by style;

select count(user_id), style
from purchase
group by style;

--Where I got the total amount received grouped by price of glasses
select count(user_id), price, (count(user_id) * price) as total
from purchase
group by price;


--Slide 8 (Purchased)
Select count(distinct quiz.user_id) as 'count',	
	home_try_on.user_id Is not null as 'home_tryers',
home_try_on.number_of_pairs,	
purchase.user_id is not null as 'purchaser'	
From quiz	
Left join home_try_on	
	On quiz.user_id = home_try_on.user_id
Left join purchase	
	on purchase.user_id = quiz.user_id
Where purchaser > 0	
group by home_try_on.number_of_pairs;	

--Slide 8 (Not Purchased)
Select count(distinct quiz.user_id) as 'count',	
	home_try_on.user_id Is not null as 'home_tryers',
home_try_on.number_of_pairs,	
purchase.user_id is not null as 'purchaser'	
From quiz	
Left join home_try_on	
	On quiz.user_id = home_try_on.user_id
Left join purchase	
	on purchase.user_id = quiz.user_id
Where purchaser = 0	
group by home_try_on.number_of_pairs;



