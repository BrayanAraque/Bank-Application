--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-09-08 13:48:20

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

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 24866)
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id bigint NOT NULL,
    balance double precision,
    card_number character varying(255) NOT NULL,
    is_card_blocked boolean NOT NULL,
    pin text NOT NULL,
    user_id bigint
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24865)
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cards ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 24874)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    date text NOT NULL,
    from_card_number character varying(16) NOT NULL,
    to_card_number character varying(16) NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24873)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 24882)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying(255) NOT NULL,
    iin character varying(255),
    last_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone_number character varying(12) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24881)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3338 (class 0 OID 24866)
-- Dependencies: 216
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (id, balance, card_number, is_card_blocked, pin, user_id) FROM stdin;
\.


--
-- TOC entry 3340 (class 0 OID 24874)
-- Dependencies: 218
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, amount, date, from_card_number, to_card_number) FROM stdin;
\.


--
-- TOC entry 3342 (class 0 OID 24882)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, iin, last_name, password, phone_number) FROM stdin;
\.


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 215
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_id_seq', 1, false);


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 217
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3185 (class 2606 OID 24872)
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 24880)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 24890)
-- Name: users uk_24b28piuww48bpe721k2gmdwa; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_24b28piuww48bpe721k2gmdwa UNIQUE (iin);


--
-- TOC entry 3191 (class 2606 OID 24892)
-- Name: users uk_9q63snka3mdh91as4io72espi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_9q63snka3mdh91as4io72espi UNIQUE (phone_number);


--
-- TOC entry 3193 (class 2606 OID 24888)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 24893)
-- Name: cards fkcmanafgwbibfijy2o5isfk3d5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT fkcmanafgwbibfijy2o5isfk3d5 FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2023-09-08 13:48:20

--
-- PostgreSQL database dump complete
--

