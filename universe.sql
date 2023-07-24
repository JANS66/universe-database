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
    name character varying NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_type character varying NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    type_name character varying NOT NULL,
    name character varying DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    planet_type character varying NOT NULL,
    description text,
    has_moons boolean NOT NULL,
    is_in_habitable_zone boolean NOT NULL,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    spectral_type character varying NOT NULL,
    description text,
    has_planets boolean NOT NULL,
    is_binary_star boolean NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric DEFAULT 0.0 NOT NULL
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 'Spiral', 'Home to Earth', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 22000, 'Spiral', 'Closest galaxy to Milky Way', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000, 'Spiral', 'Third-largest galaxy in the Local Group', false, true);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 12000, 'Elliptical', 'Distinctive dust lane across its center', false, false);
INSERT INTO public.galaxy VALUES (5, 'Bode''s Galaxy', 12000, 'Spiral', 'Located in the constellation Ursa Major', false, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 13000, 'Irregular', 'High rate of star formation', false, false);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', '0.0');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', '0.0');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', '0.0');
INSERT INTO public.galaxy_types VALUES (4, 'Lenticular', '0.0');
INSERT INTO public.galaxy_types VALUES (5, 'Dwarf', '0.0');
INSERT INTO public.galaxy_types VALUES (6, 'Barred Spiral', '0.0');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, 'Earth''s only natural satellite', false, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4000, 'Mars''s innermost and larger moon', false, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4100, 'Mars''s outer and smaller moon', false, true, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 3900, 'Jupiter''s largest and most massive moon', false, true, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 4600, 'Jupiter''s icy moon with subsurface ocean', false, true, 4);
INSERT INTO public.moon VALUES (6, 'Titan', 4500, 'Saturn''s largest moon with atmosphere', false, true, 5);
INSERT INTO public.moon VALUES (7, 'Triton', 4000, 'Neptune''s largest moon', false, true, 7);
INSERT INTO public.moon VALUES (8, 'Charon', 4200, 'Pluto''s largest moon', false, true, 7);
INSERT INTO public.moon VALUES (9, 'Callisto', 4100, 'Jupiter''s second-largest moon', false, true, 4);
INSERT INTO public.moon VALUES (10, 'Io', 3900, 'Jupiter''s volcanic moon', false, true, 4);
INSERT INTO public.moon VALUES (11, 'Miranda', 4600, 'Uranu''s smallest and innermost moon', false, true, 8);
INSERT INTO public.moon VALUES (12, 'Enceladus', 4500, 'Saturn''s moon with active geysers', false, true, 5);
INSERT INTO public.moon VALUES (13, 'Hyperion', 4000, 'Saturn''s irregularly shaped moon', false, true, 5);
INSERT INTO public.moon VALUES (14, 'Rhea', 4200, 'Saturn''s second-largest moon', false, true, 5);
INSERT INTO public.moon VALUES (15, 'Phoebe', 4100, 'Saturn''s outermost moon', false, true, 5);
INSERT INTO public.moon VALUES (16, 'Dione', 3900, 'Saturn''s fourth-largest moon', false, true, 5);
INSERT INTO public.moon VALUES (17, 'Ariel', 4600, 'Uranus''s bright and youngest moon', false, true, 8);
INSERT INTO public.moon VALUES (18, 'Umbriel', 4500, 'Uranus''s darkest moon', false, true, 8);
INSERT INTO public.moon VALUES (19, 'Tethys', 4000, 'Saturn''s fifth-largest moon', false, true, 5);
INSERT INTO public.moon VALUES (20, 'Larissa', 4200, 'Neptune''s small and irregularly shaped moon', false, true, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 'Terrestrial', 'Thirs planet from the Sun', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4000, 'Terrestrial', 'Fourth planet from the Sun', true, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4200, 'Terrestrial', 'Second planet from the Sun', false, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 4100, 'Gas Giant', 'Largest planet in the Solar System', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 3900, 'Gas Giant', 'Sixth planet from the Sun', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 4600, 'Ice Giant', 'Eight and farthest planet from the Sun', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Kepler-452b', 600, 'Terrestrial', 'Exoplanet in the habitable zone', false, true, 3);
INSERT INTO public.planet VALUES (8, 'Proxima Centauri b', 200, 'Terrestrial', 'Exoplanet closest to the Solar System', false, true, 3);
INSERT INTO public.planet VALUES (9, 'Gliese 581d', 500, 'Terrestrial', 'Exoplanet potentially habitable', false, true, 4);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 600, 'Gas Giant', 'First exoplanet discovered transiting its star', false, false, 6);
INSERT INTO public.planet VALUES (11, 'WASP-12b', 300, 'Gas Giant', 'One of the hottest known exoplanets', false, false, 6);
INSERT INTO public.planet VALUES (12, 'HD 189733 b', 400, 'Gas Giant', 'Exoplanet with a deep blue color', false, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 'G2V', 'Our Solar System star', true, false, 1, 0.0);
INSERT INTO public.star VALUES (2, 'Sirius', 240, 'A1V', 'Brightest star in the night sky', false, false, 2, 0.0);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 6200, 'G2V', 'Closest star system to the Sun', true, false, 2, 0.0);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 5800, 'K1V', 'Companion star to Alpha Centauri A', false, false, 2, 0.0);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 8000, 'M1Ia', 'Red supergiant in Orion constellation', false, false, 1, 0.0);
INSERT INTO public.star VALUES (6, 'Antares', 12000, 'M1.5Iab-Ib', 'Brightest star in Scorpius constellation', false, false, 5, 0.0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_type_name_key UNIQUE (type_name);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

