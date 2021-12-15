/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

select p.name as Product, c.name as Category 
from products as p inner join categories as c 
on c.categoryid = p.categoryid where c.name = 'computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

 select p.name as Product, p.Price, r.rating 
 from products as p inner join reviews as r
 on p.ProductID = r.ProductID where rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

select e.FirstName, e.LastName, Sum(s.quantity) as Total from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
group by e.employeeid order by total desc limit 5;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

select d.name as Department, c.name as Category
from departments as d inner join categories as c
on c.DepartmentID = d.DepartmentID where c.name = 'appliances' or c.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

select p.name as Product, Sum(s.Quantity) as 'Total Sold', Sum(s.priceperunit) as 'Total Price'
from products as p inner join sales as s
where name like '%eagles: hotel california%';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

select p.name as Product, r.Reviewer, r.Rating, r.Comment 
from products as p inner join reviews as r
on p.ProductID = r.ProductID where rating = 1 and name like '%visio%';

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

select e.employeeID as 'Emp. ID', e.FirstName as 'First', e.lastname as 'Last', p.name as Product, Sum(s.quantity) as 'Total Sold' from employees as e
inner join sales as s on e.employeeid = s.employeeid 
inner join products as p on s.productid = p.productid
group by e.employeeid, p.productid
order by e.FirstName;