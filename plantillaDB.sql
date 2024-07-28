--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-07-27 23:27:15

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 237 (class 1259 OID 168561)
-- Name: d008t_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d008t_usuarios (
    co_usuario integer NOT NULL,
    usuario character varying(60) NOT NULL,
    nu_clave character varying(100) NOT NULL,
    nb_usuario character varying(30),
    ap_usuario character varying(30),
    nb2_usuario character varying(30),
    ap2_usuario character varying(30),
    co_rol integer,
    tx_correo character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.d008t_usuarios OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 168560)
-- Name: d008t_usuarios_co_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d008t_usuarios_co_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d008t_usuarios_co_usuario_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 236
-- Name: d008t_usuarios_co_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.d008t_usuarios_co_usuario_seq OWNED BY public.d008t_usuarios.co_usuario;


--
-- TOC entry 215 (class 1259 OID 168368)
-- Name: d009t_personal_co_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d009t_personal_co_personal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d009t_personal_co_personal_seq OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 168369)
-- Name: d009t_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d009t_personal (
    co_personal integer DEFAULT nextval('public.d009t_personal_co_personal_seq'::regclass) NOT NULL,
    co_empleado integer NOT NULL,
    co_colegio_medicos integer,
    co_ministerio_sanidad integer,
    visible boolean,
    co_usuario integer NOT NULL,
    co_tipo_personal integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.d009t_personal OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 168373)
-- Name: d010t_especialidad_personal_co_especialidad_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d010t_especialidad_personal_co_especialidad_personal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d010t_especialidad_personal_co_especialidad_personal_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 168374)
-- Name: d010t_especialidad_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d010t_especialidad_personal (
    co_especialidad_personal integer DEFAULT nextval('public.d010t_especialidad_personal_co_especialidad_personal_seq'::regclass) NOT NULL,
    co_especialidad integer NOT NULL,
    co_personal integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.d010t_especialidad_personal OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 168378)
-- Name: d011t_horarios_personal_co_horario_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d011t_horarios_personal_co_horario_personal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d011t_horarios_personal_co_horario_personal_seq OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 168379)
-- Name: d011t_horarios_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d011t_horarios_personal (
    co_horario_personal integer DEFAULT nextval('public.d011t_horarios_personal_co_horario_personal_seq'::regclass) NOT NULL,
    co_turno integer NOT NULL,
    co_personal integer NOT NULL,
    co_locacion integer NOT NULL,
    co_especialidad integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.d011t_horarios_personal OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 168383)
-- Name: d013t_permisos_id_permiso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d013t_permisos_id_permiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d013t_permisos_id_permiso_seq OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 168384)
-- Name: d013t_permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d013t_permisos (
    id_permiso bigint DEFAULT nextval('public.d013t_permisos_id_permiso_seq'::regclass) NOT NULL,
    co_rol integer NOT NULL,
    id_ruta integer NOT NULL,
    tx_permisos boolean[] NOT NULL
);


ALTER TABLE public.d013t_permisos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 168390)
-- Name: e001m_especialidades_co_especialidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.e001m_especialidades_co_especialidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.e001m_especialidades_co_especialidad_seq OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 168391)
-- Name: i0013t_tipo_personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i0013t_tipo_personal (
    co_tipo_personal integer NOT NULL,
    nb_tipo_personal character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.i0013t_tipo_personal OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 168396)
-- Name: i0013t_tipo_personal_co_tipo_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i0013t_tipo_personal_co_tipo_personal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i0013t_tipo_personal_co_tipo_personal_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 225
-- Name: i0013t_tipo_personal_co_tipo_personal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i0013t_tipo_personal_co_tipo_personal_seq OWNED BY public.i0013t_tipo_personal.co_tipo_personal;


--
-- TOC entry 226 (class 1259 OID 168397)
-- Name: i001t_especialidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i001t_especialidades (
    co_especialidad integer DEFAULT nextval('public.e001m_especialidades_co_especialidad_seq'::regclass) NOT NULL,
    nb_especialidad character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.i001t_especialidades OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 168403)
-- Name: r004m_roles_co_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.r004m_roles_co_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.r004m_roles_co_rol_seq OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 168404)
-- Name: i005t_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i005t_roles (
    co_rol integer DEFAULT nextval('public.r004m_roles_co_rol_seq'::regclass) NOT NULL,
    nb_rol character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.i005t_roles OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 168408)
-- Name: i008t_parentescos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i008t_parentescos (
    co_parentesco smallint NOT NULL,
    nb_parentesco character varying(50) NOT NULL
);


ALTER TABLE public.i008t_parentescos OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 168411)
-- Name: i009t_rutas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i009t_rutas (
    id_ruta integer NOT NULL,
    nb_ruta character varying NOT NULL,
    tx_tag_name character varying
);


ALTER TABLE public.i009t_rutas OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 168416)
-- Name: i009t_rutas_id_ruta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i009t_rutas_id_ruta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i009t_rutas_id_ruta_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 231
-- Name: i009t_rutas_id_ruta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i009t_rutas_id_ruta_seq OWNED BY public.i009t_rutas.id_ruta;


--
-- TOC entry 232 (class 1259 OID 168417)
-- Name: i010t_menus_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i010t_menus_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i010t_menus_id_menu_seq OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 168418)
-- Name: i010t_menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i010t_menus (
    id_menu integer DEFAULT nextval('public.i010t_menus_id_menu_seq'::regclass) NOT NULL,
    co_rol integer NOT NULL,
    tx_menu jsonb NOT NULL
);


ALTER TABLE public.i010t_menus OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 168424)
-- Name: i011t_items_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i011t_items_menu (
    id_item integer NOT NULL,
    id_ruta integer NOT NULL,
    json_item jsonb NOT NULL
);


ALTER TABLE public.i011t_items_menu OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 168429)
-- Name: i011t_items_menu_id_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i011t_items_menu_id_item_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i011t_items_menu_id_item_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 235
-- Name: i011t_items_menu_id_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i011t_items_menu_id_item_seq OWNED BY public.i011t_items_menu.id_item;


--
-- TOC entry 4754 (class 2604 OID 168564)
-- Name: d008t_usuarios co_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d008t_usuarios ALTER COLUMN co_usuario SET DEFAULT nextval('public.d008t_usuarios_co_usuario_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 168430)
-- Name: i0013t_tipo_personal co_tipo_personal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i0013t_tipo_personal ALTER COLUMN co_tipo_personal SET DEFAULT nextval('public.i0013t_tipo_personal_co_tipo_personal_seq'::regclass);


--
-- TOC entry 4751 (class 2604 OID 168431)
-- Name: i009t_rutas id_ruta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i009t_rutas ALTER COLUMN id_ruta SET DEFAULT nextval('public.i009t_rutas_id_ruta_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 168432)
-- Name: i011t_items_menu id_item; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i011t_items_menu ALTER COLUMN id_item SET DEFAULT nextval('public.i011t_items_menu_id_item_seq'::regclass);


--
-- TOC entry 4961 (class 0 OID 168561)
-- Dependencies: 237
-- Data for Name: d008t_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d008t_usuarios (co_usuario, usuario, nu_clave, nb_usuario, ap_usuario, nb2_usuario, ap2_usuario, co_rol, tx_correo, created_at, updated_at) FROM stdin;
2	gmarcano	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	\N	\N	\N	\N	1	gabrielmarcano141@gmail.com	2024-07-28 02:41:18.671961	\N
\.


--
-- TOC entry 4940 (class 0 OID 168369)
-- Dependencies: 216
-- Data for Name: d009t_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d009t_personal (co_personal, co_empleado, co_colegio_medicos, co_ministerio_sanidad, visible, co_usuario, co_tipo_personal, created_at, updated_at) FROM stdin;
2	40512	23120	20136	t	1	1	\N	\N
3	39457	201130	32003	t	2	1	\N	\N
\.


--
-- TOC entry 4942 (class 0 OID 168374)
-- Dependencies: 218
-- Data for Name: d010t_especialidad_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d010t_especialidad_personal (co_especialidad_personal, co_especialidad, co_personal, created_at, updated_at) FROM stdin;
2	1	2	\N	\N
3	3	3	\N	\N
\.


--
-- TOC entry 4944 (class 0 OID 168379)
-- Dependencies: 220
-- Data for Name: d011t_horarios_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d011t_horarios_personal (co_horario_personal, co_turno, co_personal, co_locacion, co_especialidad, created_at, updated_at) FROM stdin;
4	1	3	1	3	\N	\N
5	1	2	1	1	\N	\N
\.


--
-- TOC entry 4946 (class 0 OID 168384)
-- Dependencies: 222
-- Data for Name: d013t_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d013t_permisos (id_permiso, co_rol, id_ruta, tx_permisos) FROM stdin;
4	1	4	{t,t,t,t}
\.


--
-- TOC entry 4948 (class 0 OID 168391)
-- Dependencies: 224
-- Data for Name: i0013t_tipo_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i0013t_tipo_personal (co_tipo_personal, nb_tipo_personal, created_at, updated_at) FROM stdin;
1	MÉDICO	\N	\N
2	ADMINISTRATIVO	\N	\N
\.


--
-- TOC entry 4950 (class 0 OID 168397)
-- Dependencies: 226
-- Data for Name: i001t_especialidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i001t_especialidades (co_especialidad, nb_especialidad, created_at, update_at) FROM stdin;
1	MEDICINA GENERAL	2022-09-05 14:21:25.745703	2022-09-05 14:21:25.745703
3	GINECOLOGÍA	2023-09-25 09:00:43.967402	2023-09-25 09:00:43.967402
\.


--
-- TOC entry 4952 (class 0 OID 168404)
-- Dependencies: 228
-- Data for Name: i005t_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i005t_roles (co_rol, nb_rol, created_at, updated_at) FROM stdin;
1	SUPERUSER	\N	\N
\.


--
-- TOC entry 4953 (class 0 OID 168408)
-- Dependencies: 229
-- Data for Name: i008t_parentescos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i008t_parentescos (co_parentesco, nb_parentesco) FROM stdin;
0	TITULAR
1	HIJO
2	CÓNYUGE
3	MADRE
4	PADRE
5	CARGA ESPECIAL
\.


--
-- TOC entry 4954 (class 0 OID 168411)
-- Dependencies: 230
-- Data for Name: i009t_rutas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i009t_rutas (id_ruta, nb_ruta, tx_tag_name) FROM stdin;
4	/gestion-usuarios	Gestión Usuarios
\.


--
-- TOC entry 4957 (class 0 OID 168418)
-- Dependencies: 233
-- Data for Name: i010t_menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i010t_menus (id_menu, co_rol, tx_menu) FROM stdin;
1	1	[{"icon": "pi pi-fw pi-id-card", "label": "Gestion de Usuarios", "command": "() => { router.push('/gestion-usuarios')}"}]
\.


--
-- TOC entry 4958 (class 0 OID 168424)
-- Dependencies: 234
-- Data for Name: i011t_items_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i011t_items_menu (id_item, id_ruta, json_item) FROM stdin;
4	4	{"icon": "pi pi-fw pi-id-card", "label": "Gestion de Usuarios", "command": "() => { router.push('/gestion-usuarios')}"}
\.


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 236
-- Name: d008t_usuarios_co_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d008t_usuarios_co_usuario_seq', 2, true);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 215
-- Name: d009t_personal_co_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d009t_personal_co_personal_seq', 3, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 217
-- Name: d010t_especialidad_personal_co_especialidad_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d010t_especialidad_personal_co_especialidad_personal_seq', 3, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 219
-- Name: d011t_horarios_personal_co_horario_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d011t_horarios_personal_co_horario_personal_seq', 5, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 221
-- Name: d013t_permisos_id_permiso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d013t_permisos_id_permiso_seq', 13, true);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 223
-- Name: e001m_especialidades_co_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.e001m_especialidades_co_especialidad_seq', 3, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 225
-- Name: i0013t_tipo_personal_co_tipo_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i0013t_tipo_personal_co_tipo_personal_seq', 2, true);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 231
-- Name: i009t_rutas_id_ruta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i009t_rutas_id_ruta_seq', 8, true);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 232
-- Name: i010t_menus_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i010t_menus_id_menu_seq', 5, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 235
-- Name: i011t_items_menu_id_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i011t_items_menu_id_item_seq', 8, true);


--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 227
-- Name: r004m_roles_co_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.r004m_roles_co_rol_seq', 5, true);


--
-- TOC entry 4787 (class 2606 OID 168567)
-- Name: d008t_usuarios d008t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d008t_usuarios
    ADD CONSTRAINT d008t_usuarios_pkey PRIMARY KEY (co_usuario);


--
-- TOC entry 4757 (class 2606 OID 168436)
-- Name: d009t_personal d009t_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT d009t_personal_pkey PRIMARY KEY (co_personal);


--
-- TOC entry 4767 (class 2606 OID 168438)
-- Name: d010t_especialidad_personal d010t_especialidad_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d010t_especialidad_personal
    ADD CONSTRAINT d010t_especialidad_personal_pkey PRIMARY KEY (co_especialidad_personal);


--
-- TOC entry 4771 (class 2606 OID 168440)
-- Name: d011t_horarios_personal d011t_horarios_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d011t_horarios_personal
    ADD CONSTRAINT d011t_horarios_personal_pkey PRIMARY KEY (co_horario_personal);


--
-- TOC entry 4773 (class 2606 OID 168442)
-- Name: d013t_permisos d013t_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d013t_permisos
    ADD CONSTRAINT d013t_permisos_pkey PRIMARY KEY (id_permiso);


--
-- TOC entry 4777 (class 2606 OID 168444)
-- Name: i001t_especialidades e001m_especialidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i001t_especialidades
    ADD CONSTRAINT e001m_especialidades_pkey PRIMARY KEY (co_especialidad);


--
-- TOC entry 4775 (class 2606 OID 168446)
-- Name: i0013t_tipo_personal i0013t_tipo_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i0013t_tipo_personal
    ADD CONSTRAINT i0013t_tipo_personal_pkey PRIMARY KEY (co_tipo_personal);


--
-- TOC entry 4781 (class 2606 OID 168448)
-- Name: i009t_rutas i009t_rutas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i009t_rutas
    ADD CONSTRAINT i009t_rutas_pkey PRIMARY KEY (id_ruta);


--
-- TOC entry 4783 (class 2606 OID 168450)
-- Name: i010t_menus i010t_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i010t_menus
    ADD CONSTRAINT i010t_menus_pkey PRIMARY KEY (id_menu);


--
-- TOC entry 4785 (class 2606 OID 168452)
-- Name: i011t_items_menu i011t_items_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i011t_items_menu
    ADD CONSTRAINT i011t_items_menu_pkey PRIMARY KEY (id_item);


--
-- TOC entry 4779 (class 2606 OID 168454)
-- Name: i005t_roles r004m_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i005t_roles
    ADD CONSTRAINT r004m_roles_pkey PRIMARY KEY (co_rol);


--
-- TOC entry 4759 (class 2606 OID 168456)
-- Name: d009t_personal unique_co_colegio_medicos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT unique_co_colegio_medicos UNIQUE (co_colegio_medicos);


--
-- TOC entry 4761 (class 2606 OID 168458)
-- Name: d009t_personal unique_co_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT unique_co_empleado UNIQUE (co_empleado);


--
-- TOC entry 4763 (class 2606 OID 168460)
-- Name: d009t_personal unique_co_ministerio_sanidad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT unique_co_ministerio_sanidad UNIQUE (co_ministerio_sanidad);


--
-- TOC entry 4769 (class 2606 OID 168462)
-- Name: d010t_especialidad_personal unique_co_personal_especialidad_personal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d010t_especialidad_personal
    ADD CONSTRAINT unique_co_personal_especialidad_personal UNIQUE (co_personal);


--
-- TOC entry 4765 (class 2606 OID 168464)
-- Name: d009t_personal unique_co_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT unique_co_usuario UNIQUE (co_usuario);


--
-- TOC entry 4788 (class 2606 OID 168465)
-- Name: d010t_especialidad_personal fk_co_especialidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d010t_especialidad_personal
    ADD CONSTRAINT fk_co_especialidad FOREIGN KEY (co_especialidad) REFERENCES public.i001t_especialidades(co_especialidad);


--
-- TOC entry 4789 (class 2606 OID 168470)
-- Name: d010t_especialidad_personal fk_co_personal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d010t_especialidad_personal
    ADD CONSTRAINT fk_co_personal FOREIGN KEY (co_personal) REFERENCES public.d009t_personal(co_personal);


--
-- TOC entry 4790 (class 2606 OID 168475)
-- Name: d011t_horarios_personal fk_co_personal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d011t_horarios_personal
    ADD CONSTRAINT fk_co_personal FOREIGN KEY (co_personal) REFERENCES public.d009t_personal(co_personal);


--
-- TOC entry 4795 (class 2606 OID 168568)
-- Name: d008t_usuarios fk_co_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d008t_usuarios
    ADD CONSTRAINT fk_co_rol FOREIGN KEY (co_rol) REFERENCES public.i005t_roles(co_rol);


--
-- TOC entry 4794 (class 2606 OID 168490)
-- Name: i011t_items_menu fk_item_ruta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i011t_items_menu
    ADD CONSTRAINT fk_item_ruta FOREIGN KEY (id_ruta) REFERENCES public.i009t_rutas(id_ruta) NOT VALID;


--
-- TOC entry 4793 (class 2606 OID 168495)
-- Name: i010t_menus fk_menu_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i010t_menus
    ADD CONSTRAINT fk_menu_rol FOREIGN KEY (co_rol) REFERENCES public.i005t_roles(co_rol) NOT VALID;


--
-- TOC entry 4791 (class 2606 OID 168500)
-- Name: d013t_permisos fk_permisos_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d013t_permisos
    ADD CONSTRAINT fk_permisos_rol FOREIGN KEY (co_rol) REFERENCES public.i005t_roles(co_rol) NOT VALID;


--
-- TOC entry 4792 (class 2606 OID 168505)
-- Name: d013t_permisos fk_permisos_rutas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d013t_permisos
    ADD CONSTRAINT fk_permisos_rutas FOREIGN KEY (id_ruta) REFERENCES public.i009t_rutas(id_ruta) NOT VALID;


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-07-27 23:27:17

--
-- PostgreSQL database dump complete
--

