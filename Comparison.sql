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
/* foursquare: 168, yelp: 180*/

/*Category of venues*/
SELECT Category, COUNT(*) FROM foursquare_data
    GROUP BY Category;
SELECT category, COUNT(*) FROM yelp_data
    GROUP BY category;

/*Comparing the dining category*/
SELECT title, total FROM foursquare_data
    WHERE Category == 'Dining';
SELECT title, total FROM yelp_data
    WHERE category == 'Dining';

/*types of venues*/
SELECT title, COUNT(*) total FROM foursquare_data
    GROUP BY title
    ORDER BY total DESC;
SELECT title, COUNT(*) total FROM yelp_data
    GROUP BY title
    ORDER BY total DESC;
/*foursquare: 74, yelp: 82*/