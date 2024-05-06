-- https://sqlzoo.net/wiki/More_JOIN_operations

-- 1.
-- List the films where the yr is 1962 [Show id, title]

SELECT id, title
 FROM movie
 WHERE yr=1962


-- When was Citizen Kane released?
-- 2.
-- Give year of 'Citizen Kane'.
SELECT yr
FROM movie
WHERE title="Citizen Kane"

-- 3.
-- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id,title,yr
FROM movie
WHERE title LIKE "%Star Trek%"
ORDER BY yr

-- 4.
-- What id number does the actor 'Glenn Close' have?

SELECT id
FROM actor
WHERE name="Glenn Close"

-- 5.
-- What is the id of the film 'Casablanca'

SELECT id
FROM movie
WHERE title="Casablanca"

-- 6.
-- Obtain the cast list for 'Casablanca'.

-- what is a cast list?
-- Use movieid=11768, (or whatever value you got from the previous question)

SELECT name
FROM actor JOIN casting ON (id=actorid)
WHERE movieid=11768

-- 7.
-- Obtain the cast list for the film 'Alien'

SELECT name
FROM actor JOIN casting ON (casting.actorid=actor.id)
           JOIN movie ON (movie.id=casting.movieid)
WHERE title="Alien"


-- 8.
-- List the films in which 'Harrison Ford' has appeared

SELECT 
title
FROM 
actor 
JOIN casting ON (casting.actorid=actor.id)
           JOIN movie ON (movie.id=casting.movieid)
WHERE 
name="Harrison Ford"

-- 9.
-- List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT 
title
FROM 
movie 
JOIN casting ON (movie.id=casting.movieid 
AND casting.ord != 1) 
JOIN actor ON (casting.actorid = actor.id)
WHERE 
actor.name="Harrison Ford"


-- 10.
-- List the films together with the leading star for all 1962 films.

SELECT movie.title, actor.name
FROM movie JOIN casting ON (movie.id=casting.movieid AND casting.ord=1)  
JOIN actor ON (casting.actorid=actor.id)   
WHERE yr=1962

-- 11.
-- Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

SELECT yr,COUNT(title) As num_movies
 FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'

GROUP BY yr
HAVING COUNT(title) > 2


movie
id	title	yr	director	budget	gross 
actor
id	name 
casting
movieid	actorid	ord


More details about the database.


Summary

Contents
1	1962 movies
2	When was Citizen Kane released?
3	Star Trek movies
4	id for actor Glenn Close
5	id for Casablanca
6	Cast list for Casablanca
7	Alien cast list
8	Harrison Ford movies
9	Harrison Ford as a supporting actor
10	Lead actors in 1962 movies
11	Busy years for Rock Hudson
12	Lead actor in Julie Andrews movies
13	Actors with 15 leading roles
14	released in the year 1978
15	with 'Art Garfunkel'
1962 movies
1.
List the films where the yr is 1962 [Show id, title]

SELECT id, title
 FROM movie
 WHERE yr=1962

Submit SQLrestore default
result
When was Citizen Kane released?
2.
Give year of 'Citizen Kane'.

SELECT yr
FROM movie
WHERE title="Citizen Kane"
Submit SQLrestore default
result
Star Trek movies
3.
List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id,title,yr
FROM movie
WHERE title LIKE "%Star Trek%"
ORDER BY yr
Submit SQLrestore default
Correct answer
id	title	yr
17772	Star Trek: The Motion Picture	1979
17775	Star Trek II: The Wrath of Khan	1982
17776	Star Trek III: The Search for Spock	1984
17777	Star Trek IV: The Voyage Home	1986
17779	Star Trek V: The Final Frontier	1989
17780	Star Trek VI: The Undiscovered Country	1991
17774	Star Trek Generations	1994
17770	Star Trek: First Contact	1996
17771	Star Trek: Insurrection	1998
17778	Star Trek Nemesis	2002
17773	Star Trek	2009
id for actor Glenn Close
4.
What id number does the actor 'Glenn Close' have?

SELECT id
FROM actor
WHERE name="Glenn Close"
Submit SQLrestore default
Correct answer
id
140

id for Casablanca
5.
What is the id of the film 'Casablanca'

SELECT id
FROM movie
WHERE title="Casablanca"
Submit SQLrestore default
Correct answer
id
11768
Get to the point

Cast list for Casablanca
6.
Obtain the cast list for 'Casablanca'.

what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question)

SELECT name
FROM actor JOIN casting ON (id=actorid)
WHERE movieid=11768
Submit SQLrestore default
Correct answer
name
Peter Lorre
John Qualen
Madeleine LeBeau
Jack Benny
Dan Seymour
Norma Varden
Ingrid Bergman
Conrad Veidt
Leon Belasco
Humphrey Bogart
Sydney Greenstreet
Helmut Dantine
Leonid Kinskey
Wolfgang Zilzer
Claude Rains
Curt Bois
Leo White
Ludwig StÃ¶ssel
Marcel Dalio
Paul Henreid
Joy Page
S. Z. Sakall
Dooley Wilson
William Edmunds
Gregory Gaye
Torben Meyer
Georges Renavent
Jean Del Val
Louis V. Arco
Trude Berliner
Ilka GrÃ¼nig
Richard Ryen
Hans Twardowski
Alien cast list
7.
Obtain the cast list for the film 'Alien'

SELECT name
FROM actor JOIN casting ON (casting.actorid=actor.id)
           JOIN movie ON (movie.id=casting.movieid)
WHERE title="Alien"
Submit SQLrestore default
Correct answer
name
John Hurt
Sigourney Weaver
Yaphet Kotto
Harry Dean Stanton
Ian Holm
Tom Skerritt
Veronica Cartwright
Harrison Ford movies
8.
List the films in which 'Harrison Ford' has appeared

SELECT title
FROM actor JOIN casting ON (casting.actorid=actor.id)
           JOIN movie ON (movie.id=casting.movieid)
WHERE name="Harrison Ford"
Submit SQLrestore default
Correct answer
title
A Hundred and One Nights
Air Force One
American Graffiti
Apocalypse Now
Clear and Present Danger
Cowboys & Aliens
Crossing Over
Dead Heat on a Merry-Go-Round
Extraordinary Measures
Firewall
Force 10 From Navarone
Hanover Street
Hawthorne of the U.S.A.
Hollywood Homicide
Indiana Jones and the Kingdom of the Crystal Skull
Indiana Jones and the Last Crusade
Indiana Jones and the Temple of Doom
Jimmy Hollywood
K-19: The Widowmaker
More American Graffiti
Morning Glory
Patriot Games
Presumed Innocent
Raiders of the Lost Ark
Random Hearts
Regarding Henry
Sabrina
Sally of the Sawdust
Shadows
Six Days Seven Nights
Smilin' Through
Star Wars Episode IV: A New Hope
Star Wars Episode V: The Empire Strikes Back
Star Wars Episode VI: Return of the Jedi
The Conversation
The Devil's Own
The Fugitive
The Mosquito Coast
The Star Wars Holiday Special
What Lies Beneath
Witness
Working Girl
Harrison Ford as a supporting actor
9.
List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT title
FROM movie JOIN casting ON (movie.id=casting.movieid 
AND casting.ord != 1)
           JOIN actor ON (casting.actorid = actor.id)
  
          
WHERE actor.name="Harrison Ford"
Submit SQLrestore default
Correct answer
title
A Hundred and One Nights
American Graffiti
Apocalypse Now
Cowboys & Aliens
Dead Heat on a Merry-Go-Round
Extraordinary Measures
Force 10 From Navarone
Hawthorne of the U.S.A.
Jimmy Hollywood
More American Graffiti
Morning Glory
Sally of the Sawdust
Shadows
Smilin' Through
Star Wars Episode IV: A New Hope
Star Wars Episode V: The Empire Strikes Back
Star Wars Episode VI: Return of the Jedi
The Conversation
Working Girl
Lead actors in 1962 movies
10.
List the films together with the leading star for all 1962 films.

SELECT movie.title, actor.name
FROM movie JOIN casting ON (movie.id=casting.movieid AND casting.ord=1)  
JOIN actor ON (casting.actorid=actor.id)   
WHERE yr=1962
Submit SQLrestore default
Correct answer
title	name
A Kind of Loving	Alan Bates
A Symposium on Popular Songs	Paul Frees
A Very Private Affair (Vie PrivÃ©e)	Brigitte Bardot
An Autumn Afternoon	Chishu Ryu
Atraco a las tres	JosÃ© Luis LÃ³pez VÃ¡zquez
Barabbas	Anthony Quinn
Battle Beyond the Sun (ÐÐµÐ±Ð¾ Ð·Ð¾Ð²ÐµÑ‚)	Aleksandr Shvorin
Big and Little Wong Tin Bar	Jackie Chan
Billy Budd	Terence Stamp
Billy Rose's Jumbo	Doris Day
Birdman of Alcatraz	Burt Lancaster
Boccaccio '70	Anita Ekberg
Bon Voyage!	Fred MacMurray
Boys' Night Out	Kim Novak
Cape Fear	Gregory Peck
Carnival of Souls	Candace Hilligoss
Carry On Cruising	Sid James
David and Lisa	Keir Dullea
Days of Wine and Roses	Jack Lemmon
Dr. No	Sean Connery
L'Eclisse	Alain Delon
Tutti a casa	Alberto Sordi
Experiment in Terror	Glenn Ford
Eyes Without a Face	Pierre Brasseur
Gay Purr-ee	Judy Garland
Gigot	Jackie Gleason
Gorath	Ryo Ikebe
Gypsy	Rosalind Russell
Half Ticket	Kishore Kumar
Harakiri	Tatsuya Nakadai
In Search of the Castaways	Hayley Mills
It's Only Money	Jerry Lewis
Jigsaw	Jack Warner
Kid Galahad	Elvis Presley
La commare secca	Marisa Solinas
La notte	Marcello Mastroianni
Life for Ruth	Michael Craig
Lolita	James Mason
Long Day's Journey into Night	Katharine Hepburn
Love at Twenty	Jean-Pierre LÃ©aud
Lycanthropus	Barbara Lass
Mamma Roma	Anna Magnani
Merrill's Marauders	Jeff Chandler
Mother Joan of the Angels	Lucyna Winnicka
Mr. Hobbs Takes a Vacation	James Stewart
Mutiny on the Bounty	Marlon Brando
On the Beat	Norman Wisdom
Os Cafajestes	Daniel Filho
Panic in Year Zero!	Ray Milland
Period of Adjustment	Anthony Franciosa
Results truncated. Only the first 50 rows have been shown.
Harder Questions

-- Busy years for Rock Hudson
-- 11.
-- Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

SELECT yr,COUNT(title) As num_movies
 FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- Submit SQLrestore default
-- Correct answer
-- yr	num_movies
-- 1953	5
-- 1961	3
-- Lead actor in Julie Andrews movies
-- 12.
-- List the film title and the leading actor for all of the films 'Julie Andrews' played in.

-- Did you get "Little Miss Marker twice"?

SELECT title, actor.name 
 FROM movie JOIN casting ON (movie.id=casting.movieid AND casting.ord=1)
JOIN actor ON (casting.actorid=actor.id)
WHERE movie.id IN (
  SELECT movie.id 
  FROM
            movie
            JOIN casting ON (movie.id = casting.movieid)
            JOIN actor ON (
                actor.id = casting.actorid
                AND actor.name = "Julie Andrews"
            )
);

-- 13.
-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

SELECT
    actor.name
FROM
    actor
    JOIN casting ON (
        actor.id = casting.actorid
        AND casting.ord = 1
    )
GROUP BY
    actor.name
HAVING
    COUNT(*) >= 15
ORDER BY
    actor.name ASC;

--     14.
-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

SELECT
    title,
    COUNT(casting.actorid)
FROM
    movie
    JOIN casting ON (movie.id = casting.movieid)
WHERE
    yr = 1978
GROUP BY
    casting.movieid
ORDER BY
    COUNT(casting.actorid) desc,
    title asc;

--     15.
-- List all the people who have worked with 'Art Garfunkel'.
SELECT DISTINCT a.name
FROM actor a
JOIN casting c ON a.id = c.actorid
WHERE c.movieid IN (
    SELECT movieid
    FROM casting
    WHERE actorid = (
        SELECT id
        FROM actor
        WHERE name = 'Art Garfunkel'
    )
) AND a.name != 'Art Garfunkel';
