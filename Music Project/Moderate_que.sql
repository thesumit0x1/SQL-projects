-- MODERATE QUESTIONS
-- Q1. Write a query to return the email, first name, last name, and genre
-- of all rock music listners return your list ordered 
-- alphabetically by email starting with A.

Select Distinct email, First_name, last_name from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
Where track_id IN(
select track_id from track
join genre on track.genre_id = genre.genre_id
Where genre.name like 'Rock'
)
order by email



-- Q2. Let's invite the artist who have written most rock music in our dataset. Write the query that 
-- return the Artist name and total track count of the top 10 rock bands.

SELECT artist.artist_id, artist.name , count(artist.artist_id) as no_of_songs
from track 
join album  on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name LIKE 'Rock'
group by artist.artist_id
order by no_of_songs DESC
limit 10


-- Q3.Return all the track names that have a song length longer than than the average song length.
--    Return the name and milliseconds for each track. Order by the song length with the longest song
--    listed first

SELECT name , milliseconds from track
 where milliseconds > (
   select avg(milliseconds) as avg_track_length
   from track)
  order by  milliseconds DESC
