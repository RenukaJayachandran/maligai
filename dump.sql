--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bill; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bill (
    bill_id bigint NOT NULL,
    product_id integer NOT NULL,
    product_name text NOT NULL,
    price numeric NOT NULL,
    unit integer NOT NULL,
    amount integer NOT NULL
);


--
-- Name: customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL
);


--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: owner; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.owner (
    owner_id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL
);


--
-- Name: owner_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.owner_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: owner_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.owner_owner_id_seq OWNED BY public.owner.owner_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    name text NOT NULL,
    quantity integer NOT NULL,
    cost_price numeric NOT NULL,
    selling_price numeric NOT NULL,
    shop_id integer NOT NULL
);


--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: sale; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sale (
    shop_id integer NOT NULL,
    customer_id integer NOT NULL,
    bill_id bigint NOT NULL,
    total numeric NOT NULL,
    "time" time with time zone NOT NULL,
    date date NOT NULL
);


--
-- Name: sale_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sale_bill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sale_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sale_bill_id_seq OWNED BY public.sale.bill_id;


--
-- Name: shop; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shop (
    shop_id integer NOT NULL,
    owner_id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    phone text NOT NULL
);


--
-- Name: shop_shop_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shop_shop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shop_shop_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shop_shop_id_seq OWNED BY public.shop.shop_id;


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: owner owner_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.owner ALTER COLUMN owner_id SET DEFAULT nextval('public.owner_owner_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: sale bill_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale ALTER COLUMN bill_id SET DEFAULT nextval('public.sale_bill_id_seq'::regclass);


--
-- Name: shop shop_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop ALTER COLUMN shop_id SET DEFAULT nextval('public.shop_shop_id_seq'::regclass);


--
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bill (bill_id, product_id, product_name, price, unit, amount) FROM stdin;
1	14	fluffy_unicorn	500	1	500
1	17	crayons	25	2	50
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customer (customer_id, name, address, phone, email) FROM stdin;
1	gru	43,fgvue street,tiruvallur	372647719	gru@email.com
2	agnes	12,hfebu apartment,tiruvallur	94126046127	agnes@email.com
4	margo	23,hfvb street,hfj nagar,tiruvallur	34632401920	margo@email.com
3	edith	32,fbfk road,tiruvallr	857497834	edith2email.com
5	bob	46,dhgjwa street,tiruvallur	4617834974	bob@email.com
6	kevin	74th avenue,ewuhi street,tiruvallur	766535817	kevin@email.com
\.


--
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.owner (owner_id, name, address, phone, email) FROM stdin;
1	minion	no 12,qwe street,tiruvallur	271371268	minion@email.com
2	vector	pl no 23,dhgsd lane,tiruvallur	674572947	vector@email.com
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.product (product_id, name, quantity, cost_price, selling_price, shop_id) FROM stdin;
1	tata_salt_1kg	50	30	35	4
2	udayam_tur_500g	20	70	75	4
3	udayam_tur_1kg	50	140	150	4
4	udayam_urad_500g	20	75	80	4
5	udayam_urad_1kg	45	150	160	4
6	sugar-1kg	0	50	60	4
7	sakthi-turmeric-100g	60	25	30	4
8	sakthi-chilli-100g	35	45	50	4
9	sakthi-thaniya-100g	25	25	30	4
10	maggi-250g	41	60	65	4
11	shrinker	5	4632	5983	3
12	rocket	2	2634	2738	3
13	airplane	10	7853	8477	3
14	fluffy_unicorn	50	473	500	1
15	one_eye_alien	28	322	350	1
16	persian_cat	33	325	450	1
17	crayons	78	15	25	1
18	pizza_toppings_50g	50	120	135	4
19	cotton_candy_25g	112	7	10	4
20	space_suit	5	8742	10000	3
\.


--
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sale (shop_id, customer_id, bill_id, total, "time", date) FROM stdin;
1	2	1	550	22:20:00+00	2018-07-30
\.


--
-- Data for Name: shop; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.shop (shop_id, owner_id, name, address, phone) FROM stdin;
1	1	unicorn_toy	no 12,bdsi street,tiruvallur	463247889
4	1	bello_bi	14th avenue,dgwj road,tiruvallur	23724893
3	1	mission_moon	no 47,hdfw nagar,tiruvallur	458627489
\.


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 6, true);


--
-- Name: owner_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.owner_owner_id_seq', 2, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.product_product_id_seq', 20, true);


--
-- Name: sale_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sale_bill_id_seq', 1, true);


--
-- Name: shop_shop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shop_shop_id_seq', 4, true);


--
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (bill_id, product_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: owner owner_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (owner_id);


--
-- Name: product product_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_name_key UNIQUE (name);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id, name);


--
-- Name: product product_product_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_id_key UNIQUE (product_id);


--
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (bill_id);


--
-- Name: shop shop_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_pkey PRIMARY KEY (shop_id);


--
-- Name: bill bill_bill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.sale(bill_id);


--
-- Name: bill bill_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: product product_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: sale sale_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: sale sale_shop_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_shop_id_fkey FOREIGN KEY (shop_id) REFERENCES public.shop(shop_id);


--
-- Name: shop shop_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owner(owner_id);


--
-- PostgreSQL database dump complete
--

