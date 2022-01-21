/*Comparing two sample data tables:
one from Foursquare, one from Yelp

Sample inputs
center location: '45.6387,-122.6615'
radius: 1KM (1000M)
categories: Entertainment, Dining, Health, Landmarks
*/

/*total venues*/
SELECT SUM(total) FROM foursquare_data; 
SELECT SUM(total) FROM yelp_data; 
/* foursquare: 394, yelp: 313*/

/*Category of venues*/
SELECT Category, COUNT(*) total FROM foursquare_data
    GROUP BY Category
    ORDER BY total DESC;
SELECT category, COUNT(*) total FROM yelp_data
    GROUP BY category
    ORDER BY total DESC;

SELECT four.category, four.total f_total, yelp.total y_total 
FROM(
    SELECT Category AS category, COUNT(*) total 
        FROM foursquare_data
        GROUP BY Category
        ORDER BY total DESC) four 
    LEFT OUTER JOIN(
        SELECT category, COUNT(*) total 
        FROM yelp_data
        GROUP BY category
        ORDER BY total DESC) yelp 
        ON four.category = yelp.category;

/*Comparing the dining category*/
SELECT title, total FROM foursquare_data
    WHERE Category == 'Business and Professional Services';
SELECT title, total FROM yelp_data
    WHERE category == 'Business and Professional Services';

/*types of venues*/
SELECT title, COUNT(*) total FROM foursquare_data
    GROUP BY title
    ORDER BY total DESC
    LIMIT 10;
SELECT title, COUNT(*) total FROM yelp_data
    GROUP BY title
    ORDER BY total DESC
    LIMIT 10;
/*foursquare: 200, yelp: 149*/

/*In terms of using API as a source of broadscale
venue data (what's in the area), how do these two compare?

Foursquare is better to get an idea of the types of venues,
it also provides more Landmark and event data for the area.

Another major limitation is that the results are randomized and returned
by a limit of 50. With a 1km radius that does not seem to occur however.

Yelp is better to get a specific and distinct venue data.
Results do not overlap between categories
    (ex: a building under Dining > restauraunt and under
    Entertainment > theatre will count once for each)