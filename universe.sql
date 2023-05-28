--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type_id integer NOT NULL,
    description text,
    age_in_millions_of_year integer,
    distance_from_earth numeric(12,4)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean DEFAULT false,
    age_in_millions_of_years numeric,
    distance_from_planet numeric(12,2),
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean DEFAULT false,
    age_in_millions_of_years numeric(12,2),
    orbital_period_days integer,
    distance_from_earth numeric(12,2),
    planet_type_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_c integer,
    age_in_millions_of_years numeric(12,3),
    description text,
    distance_from_earth numeric,
    has_planets boolean,
    number_of_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 1, 'This is our galaxy it has estimated 400 to 600 billion starts', 13000, 0.0000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 'This galaxy the neighbour of our Milkyway and it has estimated 1200 billion stars. It can be seen with naked eye', 6000, 2540000.0000);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 2, 'It is an elliptical galaxy 31 million lightyears from the Earth', 11000, 3100000.0000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 3, 'It is the closest radio galaxy. It has an active galactic nuclei due to a supermassive blackhole', 12000, 1100000.0000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 1, 'A beautiful spiral galaxy with well defined structure', 12000, 3100000.0000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 1, 'face on spiral galaxy', 10000, 2700000.0000);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'It has spiral arms');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'have no distinct spiral arms. Shape like spherical or elongated');
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'do not have a well defined shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, false, 4500, 384400.00, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 4500, 9377.00, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 4500, 23456.00, NULL);
INSERT INTO public.moon VALUES (4, 'Lo', 5, false, 400, 683.30, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, false, 400, 671.30, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, false, 400, 107.30, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, false, 400, 188.00, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 400, 147.00, NULL);
INSERT INTO public.moon VALUES (9, 'Himala', 5, false, 1000, 11.47, NULL);
INSERT INTO public.moon VALUES (10, 'Elara', 5, false, 1000, 11.70, NULL);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 5, false, 1000, 20.70, NULL);
INSERT INTO public.moon VALUES (12, 'Titan', 6, false, 4500, 1221870.00, NULL);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, false, 4500, 238020.00, NULL);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, false, 4500, 185520.00, NULL);
INSERT INTO public.moon VALUES (15, 'Tethys', 6, false, 4500, 294660.00, NULL);
INSERT INTO public.moon VALUES (16, 'Dione', 6, false, 4500, 377415.00, NULL);
INSERT INTO public.moon VALUES (17, 'Rhea', 6, false, 4500, 527040.00, NULL);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, false, 4500, 129390.00, NULL);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, false, 4500, 191020.00, NULL);
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, false, 4500, 266300.00, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3, NULL, false, 4568.00, 88, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 3, NULL, false, 3456.00, 225, NULL, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 3, NULL, true, 4600.00, 365, 0.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3, NULL, false, 4200.00, 687, NULL, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 3, NULL, false, 6100.00, 4332, NULL, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 3, NULL, false, 5800.00, 10759, NULL, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 3, NULL, false, 5400.00, 30685, NULL, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 3, NULL, false, 5200.00, 60190, NULL, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 3, NULL, false, 4700.00, 90560, NULL, 4);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 1, NULL, false, 100.74, 11, 4.22, 1);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 7, NULL, false, 1400.00, 385, NULL, 1);
INSERT INTO public.planet VALUES (12, 'HD 209458b', 8, NULL, false, 2800.00, 3, 153.00, 2);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', NULL);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', NULL);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', NULL);
INSERT INTO public.planet_type VALUES (4, 'Dwarf', NULL);
INSERT INTO public.planet_type VALUES (5, 'Exoplanet', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 5790, 6000.000, 'It the main sequence star in Centauri binary system. It is similar in size to our sun', 4.000, true, 5);
INSERT INTO public.star VALUES (3, 'Sun', 1, 5778, 4600.000, 'It is star of our solar system', 0.00001578, true, 8);
INSERT INTO public.star VALUES (1, 'Proxima Centauri', 1, 3042, 4.850, 'Closest star to the Sun. A red dwarf', 4.000, false, 0);
INSERT INTO public.star VALUES (4, 'Sirius', 2, 9900, 240.000, 'It is the brightest star in the night sky', 8.6, true, 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 2, 3600, 10.100, 'It is a red supergiant located in the constellation Orion', 640, false, 0);
INSERT INTO public.star VALUES (6, 'Vega', 3, 9600, 455.000, 'It is one of the brightest stars in the night sky and located in constellation Lyra', 25, false, 0);
INSERT INTO public.star VALUES (7, 'Kepler-452', 1, 5757, 6000.000, 'It is slightly larger than sun and located in constellation Cygnus', 1800, true, 1);
INSERT INTO public.star VALUES (8, 'HD 209458', 1, 6071, 3500.000, 'It is slightly larger than sun and located in constellation Pegasus', 159, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 10, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

