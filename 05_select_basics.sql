-- 1.
-- Show the total population of the world.

-- world(name, continent, area, population, gdp)

SELECT SUM(population)AS world_population
FROM world
