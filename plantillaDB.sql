--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-05-10 03:20:12

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

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16909)
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16910)
-- Name: d008t_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d008t_usuarios (
    co_usuario integer DEFAULT nextval('public.d008t_usuarios_co_usuario_seq'::regclass) NOT NULL,
    ced_usuario integer NOT NULL,
    nu_clave character varying(100),
    nb_usuario character varying(30) NOT NULL,
    ap_usuario character varying(30) NOT NULL,
    co_rol integer,
    tx_correo character varying(50),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    status_register boolean DEFAULT true NOT NULL,
    ap2_usuario character varying(30),
    nb2_usuario character varying(30)
);


ALTER TABLE public.d008t_usuarios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16916)
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
-- TOC entry 218 (class 1259 OID 16917)
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
-- TOC entry 219 (class 1259 OID 16921)
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
-- TOC entry 220 (class 1259 OID 16922)
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
-- TOC entry 221 (class 1259 OID 16926)
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
-- TOC entry 222 (class 1259 OID 16927)
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
-- TOC entry 223 (class 1259 OID 16934)
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
-- TOC entry 224 (class 1259 OID 16935)
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
-- TOC entry 225 (class 1259 OID 16962)
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
-- TOC entry 227 (class 1259 OID 16990)
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
-- TOC entry 228 (class 1259 OID 16995)
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
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 228
-- Name: i0013t_tipo_personal_co_tipo_personal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i0013t_tipo_personal_co_tipo_personal_seq OWNED BY public.i0013t_tipo_personal.co_tipo_personal;


--
-- TOC entry 226 (class 1259 OID 16968)
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
-- TOC entry 229 (class 1259 OID 16999)
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
-- TOC entry 230 (class 1259 OID 17000)
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
-- TOC entry 231 (class 1259 OID 17009)
-- Name: i008t_parentescos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i008t_parentescos (
    co_parentesco smallint NOT NULL,
    nb_parentesco character varying(50) NOT NULL
);


ALTER TABLE public.i008t_parentescos OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17012)
-- Name: i009t_rutas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i009t_rutas (
    id_ruta integer NOT NULL,
    nb_ruta character varying NOT NULL,
    tx_tag_name character varying
);


ALTER TABLE public.i009t_rutas OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17017)
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
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 233
-- Name: i009t_rutas_id_ruta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i009t_rutas_id_ruta_seq OWNED BY public.i009t_rutas.id_ruta;


--
-- TOC entry 234 (class 1259 OID 17018)
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
-- TOC entry 235 (class 1259 OID 17019)
-- Name: i010t_menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i010t_menus (
    id_menu integer DEFAULT nextval('public.i010t_menus_id_menu_seq'::regclass) NOT NULL,
    co_rol integer NOT NULL,
    tx_menu jsonb NOT NULL
);


ALTER TABLE public.i010t_menus OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17025)
-- Name: i011t_items_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i011t_items_menu (
    id_item integer NOT NULL,
    id_ruta integer NOT NULL,
    json_item jsonb NOT NULL
);


ALTER TABLE public.i011t_items_menu OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17030)
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
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 237
-- Name: i011t_items_menu_id_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i011t_items_menu_id_item_seq OWNED BY public.i011t_items_menu.id_item;


--
-- TOC entry 4698 (class 2604 OID 17051)
-- Name: i0013t_tipo_personal co_tipo_personal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i0013t_tipo_personal ALTER COLUMN co_tipo_personal SET DEFAULT nextval('public.i0013t_tipo_personal_co_tipo_personal_seq'::regclass);


--
-- TOC entry 4700 (class 2604 OID 17056)
-- Name: i009t_rutas id_ruta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i009t_rutas ALTER COLUMN id_ruta SET DEFAULT nextval('public.i009t_rutas_id_ruta_seq'::regclass);


--
-- TOC entry 4702 (class 2604 OID 17057)
-- Name: i011t_items_menu id_item; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i011t_items_menu ALTER COLUMN id_item SET DEFAULT nextval('public.i011t_items_menu_id_item_seq'::regclass);


--
-- TOC entry 4888 (class 0 OID 16910)
-- Dependencies: 216
-- Data for Name: d008t_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d008t_usuarios (co_usuario, ced_usuario, nu_clave, nb_usuario, ap_usuario, co_rol, tx_correo, created_at, updated_at, status_register, ap2_usuario, nb2_usuario) FROM stdin;
1	28484689	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	GABRIEL	MARCANO	1	gabrielmarcano141@cne.gob.ve	2023-01-25 14:23:32.362521	\N	f	REQUENA	FABIAN
2	12073739	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	ANGEL	ROJAS	1	\N	2023-09-25 09:03:34.170919	\N	t	HERNANDEZ	IVAN
\.


--
-- TOC entry 4890 (class 0 OID 16917)
-- Dependencies: 218
-- Data for Name: d009t_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d009t_personal (co_personal, co_empleado, co_colegio_medicos, co_ministerio_sanidad, visible, co_usuario, co_tipo_personal, created_at, updated_at) FROM stdin;
2	40512	23120	20136	t	1	1	\N	\N
3	39457	201130	32003	t	2	1	\N	\N
\.


--
-- TOC entry 4892 (class 0 OID 16922)
-- Dependencies: 220
-- Data for Name: d010t_especialidad_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d010t_especialidad_personal (co_especialidad_personal, co_especialidad, co_personal, created_at, updated_at) FROM stdin;
2	1	2	\N	\N
3	3	3	\N	\N
\.


--
-- TOC entry 4894 (class 0 OID 16927)
-- Dependencies: 222
-- Data for Name: d011t_horarios_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d011t_horarios_personal (co_horario_personal, co_turno, co_personal, co_locacion, co_especialidad, created_at, updated_at) FROM stdin;
4	1	3	1	3	\N	\N
5	1	2	1	1	\N	\N
\.


--
-- TOC entry 4896 (class 0 OID 16935)
-- Dependencies: 224
-- Data for Name: d013t_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d013t_permisos (id_permiso, co_rol, id_ruta, tx_permisos) FROM stdin;
1	1	3	{t,t,t,t}
2	1	1	{t,t,t,t}
3	1	2	{t,t,t,t}
4	1	4	{t,t,t,t}
5	1	6	{t,t,t,t}
6	1	5	{t,t,t,t}
7	1	7	{t,t,t,t}
8	1	8	{t,t,t,t}
\.


--
-- TOC entry 4899 (class 0 OID 16990)
-- Dependencies: 227
-- Data for Name: i0013t_tipo_personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i0013t_tipo_personal (co_tipo_personal, nb_tipo_personal, created_at, updated_at) FROM stdin;
1	MÉDICO	\N	\N
2	ADMINISTRATIVO	\N	\N
\.


--
-- TOC entry 4898 (class 0 OID 16968)
-- Dependencies: 226
-- Data for Name: i001t_especialidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i001t_especialidades (co_especialidad, nb_especialidad, created_at, update_at) FROM stdin;
1	MEDICINA GENERAL	2022-09-05 14:21:25.745703	2022-09-05 14:21:25.745703
3	GINECOLOGÍA	2023-09-25 09:00:43.967402	2023-09-25 09:00:43.967402
\.


--
-- TOC entry 4902 (class 0 OID 17000)
-- Dependencies: 230
-- Data for Name: i005t_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i005t_roles (co_rol, nb_rol, created_at, updated_at) FROM stdin;
1	SUPERUSER	\N	\N
\.


--
-- TOC entry 4903 (class 0 OID 17009)
-- Dependencies: 231
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
-- TOC entry 4904 (class 0 OID 17012)
-- Dependencies: 232
-- Data for Name: i009t_rutas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i009t_rutas (id_ruta, nb_ruta, tx_tag_name) FROM stdin;
1	/recepcion/solicitudes	Recepción Solicitudes
3	/recepcion/pacientes	Recepción Pacientes
4	/gestion-usuarios	Gestión Usuarios
5	/personal/horarios	Personal Horarios
6	/personal/gestion	Personal Gestión
7	/especialidades/gestion	Especialidades Gestión
8	/especialidades/horarios	Especialidades Horarios
2	/recepcion/crear-citas	Recepción Crear Citas
\.


--
-- TOC entry 4907 (class 0 OID 17019)
-- Dependencies: 235
-- Data for Name: i010t_menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i010t_menus (id_menu, co_rol, tx_menu) FROM stdin;
1	1	[{"icon": "pi pi-fw pi-user", "label": "Pacientes", "command": "() => { router.push('/recepcion/pacientes') }"}, {"icon": "pi pi-fw pi-file", "label": "Solicitudes", "command": "() => { router.push('/recepcion/solicitudes')}"}, {"icon": "pi pi-fw pi-pencil", "label": "Crear Citas", "command": "() => { router.push('/recepcion/crear-citas')}"}, {"icon": "pi pi-fw pi-id-card", "label": "Gestion de Usuarios", "command": "() => { router.push('/gestion-usuarios')}"}, {"icon": "pi pi-fw pi-users", "label": "Gestion de Personal", "command": "() => { router.push('/personal/gestion')}"}, {"icon": "pi pi-fw pi-calendar-plus", "label": "Horarios de Personal", "command": "() => { router.push('/personal/horarios')}"}, {"icon": "pi pi-fw pi-book", "label": "Gestion de Especialidades", "command": "() => { router.push('/especialidades/gestion')}"}, {"icon": "pi pi-fw pi-calendar", "label": "Horarios de Especialidades", "command": "() => { router.push('/especialidades/horarios')}"}]
\.


--
-- TOC entry 4908 (class 0 OID 17025)
-- Dependencies: 236
-- Data for Name: i011t_items_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i011t_items_menu (id_item, id_ruta, json_item) FROM stdin;
1	1	{"icon": "pi pi-fw pi-file", "label": "Solicitudes", "command": "() => { router.push('/recepcion/solicitudes')}"}
2	2	{"icon": "pi pi-fw pi-pencil", "label": "Crear Citas", "command": "() => { router.push('/recepcion/crear-citas')}"}
3	3	{"icon": "pi pi-fw pi-user", "label": "Pacientes", "command": "() => { router.push('/recepcion/pacientes') }"}
4	4	{"icon": "pi pi-fw pi-id-card", "label": "Gestion de Usuarios", "command": "() => { router.push('/gestion-usuarios')}"}
6	6	{"icon": "pi pi-fw pi-users", "label": "Gestion de Personal", "command": "() => { router.push('/personal/gestion')}"}
5	5	{"icon": "pi pi-fw pi-calendar-plus", "label": "Horarios de Personal", "command": "() => { router.push('/personal/horarios')}"}
7	7	{"icon": "pi pi-fw pi-book", "label": "Gestion de Especialidades", "command": "() => { router.push('/especialidades/gestion')}"}
8	8	{"icon": "pi pi-fw pi-calendar", "label": "Horarios de Especialidades", "command": "() => { router.push('/especialidades/horarios')}"}
\.


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 215
-- Name: d008t_usuarios_co_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d008t_usuarios_co_usuario_seq', 2, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 217
-- Name: d009t_personal_co_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d009t_personal_co_personal_seq', 3, true);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 219
-- Name: d010t_especialidad_personal_co_especialidad_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d010t_especialidad_personal_co_especialidad_personal_seq', 3, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 221
-- Name: d011t_horarios_personal_co_horario_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d011t_horarios_personal_co_horario_personal_seq', 5, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 223
-- Name: d013t_permisos_id_permiso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d013t_permisos_id_permiso_seq', 13, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 225
-- Name: e001m_especialidades_co_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.e001m_especialidades_co_especialidad_seq', 3, true);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 228
-- Name: i0013t_tipo_personal_co_tipo_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i0013t_tipo_personal_co_tipo_personal_seq', 2, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 233
-- Name: i009t_rutas_id_ruta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i009t_rutas_id_ruta_seq', 8, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 234
-- Name: i010t_menus_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i010t_menus_id_menu_seq', 5, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 237
-- Name: i011t_items_menu_id_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i011t_items_menu_id_item_seq', 8, true);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 229
-- Name: r004m_roles_co_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.r004m_roles_co_rol_seq', 5, true);


--
-- TOC entry 4704 (class 2606 OID 17066)
-- Name: d008t_usuarios d008t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d008t_usuarios
    ADD CONSTRAINT d008t_usuarios_pkey PRIMARY KEY (co_usuario);


--
-- TOC entry 4706 (class 2606 OID 17068)
-- Name: d009t_personal d009t_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT d009t_personal_pkey PRIMARY KEY (co_personal);


--
-- TOC entry 4716 (class 2606 OID 17070)
-- Name: d010t_especialidad_personal d010t_especialidad_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d010t_especialidad_personal
    ADD CONSTRAINT d010t_especialidad_personal_pkey PRIMARY KEY (co_especialidad_personal);


--
-- TOC entry 4720 (class 2606 OID 17072)
-- Name: d011t_horarios_personal d011t_horarios_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d011t_horarios_personal
    ADD CONSTRAINT d011t_horarios_personal_pkey PRIMARY KEY (co_horario_personal);


--
-- TOC entry 4722 (class 2606 OID 17074)
-- Name: d013t_permisos d013t_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d013t_permisos
    ADD CONSTRAINT d013t_permisos_pkey PRIMARY KEY (id_permiso);


--
-- TOC entry 4724 (class 2606 OID 17082)
-- Name: i001t_especialidades e001m_especialidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i001t_especialidades
    ADD CONSTRAINT e001m_especialidades_pkey PRIMARY KEY (co_especialidad);


--
-- TOC entry 4726 (class 2606 OID 17086)
-- Name: i0013t_tipo_personal i0013t_tipo_personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i0013t_tipo_personal
    ADD CONSTRAINT i0013t_tipo_personal_pkey PRIMARY KEY (co_tipo_personal);


--
-- TOC entry 4730 (class 2606 OID 17088)
-- Name: i009t_rutas i009t_rutas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i009t_rutas
    ADD CONSTRAINT i009t_rutas_pkey PRIMARY KEY (id_ruta);


--
-- TOC entry 4732 (class 2606 OID 17090)
-- Name: i010t_menus i010t_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i010t_menus
    ADD CONSTRAINT i010t_menus_pkey PRIMARY KEY (id_menu);


--
-- TOC entry 4734 (class 2606 OID 17092)
-- Name: i011t_items_menu i011t_items_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i011t_items_menu
    ADD CONSTRAINT i011t_items_menu_pkey PRIMARY KEY (id_item);


--
-- TOC entry 4728 (class 2606 OID 17102)
-- Name: i005t_roles r004m_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i005t_roles
    ADD CONSTRAINT r004m_roles_pkey PRIMARY KEY (co_rol);


--
-- TOC entry 4708 (class 2606 OID 17110)
-- Name: d009t_personal unique_co_colegio_medicos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT unique_co_colegio_medicos UNIQUE (co_colegio_medicos);


--
-- TOC entry 4710 (class 2606 OID 17112)
-- Name: d009t_personal unique_co_empleado; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT unique_co_empleado UNIQUE (co_empleado);


--
-- TOC entry 4712 (class 2606 OID 17114)
-- Name: d009t_personal unique_co_ministerio_sanidad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT unique_co_ministerio_sanidad UNIQUE (co_ministerio_sanidad);


--
-- TOC entry 4718 (class 2606 OID 17116)
-- Name: d010t_especialidad_personal unique_co_personal_especialidad_personal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d010t_especialidad_personal
    ADD CONSTRAINT unique_co_personal_especialidad_personal UNIQUE (co_personal);


--
-- TOC entry 4714 (class 2606 OID 17118)
-- Name: d009t_personal unique_co_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT unique_co_usuario UNIQUE (co_usuario);


--
-- TOC entry 4737 (class 2606 OID 17139)
-- Name: d010t_especialidad_personal fk_co_especialidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d010t_especialidad_personal
    ADD CONSTRAINT fk_co_especialidad FOREIGN KEY (co_especialidad) REFERENCES public.i001t_especialidades(co_especialidad);


--
-- TOC entry 4738 (class 2606 OID 17179)
-- Name: d010t_especialidad_personal fk_co_personal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d010t_especialidad_personal
    ADD CONSTRAINT fk_co_personal FOREIGN KEY (co_personal) REFERENCES public.d009t_personal(co_personal);


--
-- TOC entry 4739 (class 2606 OID 17184)
-- Name: d011t_horarios_personal fk_co_personal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d011t_horarios_personal
    ADD CONSTRAINT fk_co_personal FOREIGN KEY (co_personal) REFERENCES public.d009t_personal(co_personal);


--
-- TOC entry 4735 (class 2606 OID 17189)
-- Name: d008t_usuarios fk_co_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d008t_usuarios
    ADD CONSTRAINT fk_co_rol FOREIGN KEY (co_rol) REFERENCES public.i005t_roles(co_rol);


--
-- TOC entry 4736 (class 2606 OID 17214)
-- Name: d009t_personal fk_co_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d009t_personal
    ADD CONSTRAINT fk_co_usuario FOREIGN KEY (co_usuario) REFERENCES public.d008t_usuarios(co_usuario);


--
-- TOC entry 4743 (class 2606 OID 17224)
-- Name: i011t_items_menu fk_item_ruta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i011t_items_menu
    ADD CONSTRAINT fk_item_ruta FOREIGN KEY (id_ruta) REFERENCES public.i009t_rutas(id_ruta) NOT VALID;


--
-- TOC entry 4742 (class 2606 OID 17229)
-- Name: i010t_menus fk_menu_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i010t_menus
    ADD CONSTRAINT fk_menu_rol FOREIGN KEY (co_rol) REFERENCES public.i005t_roles(co_rol) NOT VALID;


--
-- TOC entry 4740 (class 2606 OID 17234)
-- Name: d013t_permisos fk_permisos_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d013t_permisos
    ADD CONSTRAINT fk_permisos_rol FOREIGN KEY (co_rol) REFERENCES public.i005t_roles(co_rol) NOT VALID;


--
-- TOC entry 4741 (class 2606 OID 17239)
-- Name: d013t_permisos fk_permisos_rutas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d013t_permisos
    ADD CONSTRAINT fk_permisos_rutas FOREIGN KEY (id_ruta) REFERENCES public.i009t_rutas(id_ruta) NOT VALID;


--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-05-10 03:20:13

--
-- PostgreSQL database dump complete
--

