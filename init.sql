--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-21 21:22:52

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16613)
-- Name: billetes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billetes (
    id integer NOT NULL,
    serial character varying(30) NOT NULL,
    monto numeric NOT NULL,
    pago_id integer
);


ALTER TABLE public.billetes OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16618)
-- Name: billetes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.billetes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.billetes_id_seq OWNER TO postgres;

--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 216
-- Name: billetes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.billetes_id_seq OWNED BY public.billetes.id;


--
-- TOC entry 217 (class 1259 OID 16619)
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16624)
-- Name: carreras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carreras_id_seq OWNER TO postgres;

--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 218
-- Name: carreras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_id_seq OWNED BY public.carreras.id;


--
-- TOC entry 219 (class 1259 OID 16625)
-- Name: configuracion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuracion (
    ciclo character varying(10) NOT NULL,
    id integer NOT NULL,
    porc1 integer DEFAULT 30 NOT NULL,
    porc2 integer DEFAULT 30 NOT NULL,
    porc3 integer DEFAULT 40 NOT NULL,
    horario_inicio timestamp without time zone NOT NULL,
    horario_fin timestamp without time zone NOT NULL,
    cuota1 timestamp without time zone,
    cuota2 timestamp without time zone,
    cuota3 timestamp without time zone,
    cuota4 timestamp without time zone,
    cuota5 timestamp without time zone
);


ALTER TABLE public.configuracion OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16631)
-- Name: configuracion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configuracion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.configuracion_id_seq OWNER TO postgres;

--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 220
-- Name: configuracion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuracion_id_seq OWNED BY public.configuracion.id;


--
-- TOC entry 221 (class 1259 OID 16632)
-- Name: control; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.control (
    cedula character varying(20) NOT NULL,
    fullname character varying(150) NOT NULL,
    correo character varying(150) NOT NULL,
    telefono character varying(20) NOT NULL,
    password character varying(150) NOT NULL
);


ALTER TABLE public.control OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16635)
-- Name: coordinacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coordinacion (
    cedula character varying(20) NOT NULL,
    fullname character varying(150) NOT NULL,
    correo character varying(150) NOT NULL,
    telefono character varying(20) NOT NULL,
    password character varying(150) NOT NULL
);


ALTER TABLE public.coordinacion OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16638)
-- Name: docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docentes (
    cedula character varying(20) NOT NULL,
    fullname character varying(150) NOT NULL,
    correo character varying(150) NOT NULL,
    telefono character varying(20) NOT NULL,
    password character varying(150) NOT NULL
);


ALTER TABLE public.docentes OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16641)
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    cedula character varying(20) NOT NULL,
    fullname character varying(150) NOT NULL,
    correo character varying(150) NOT NULL,
    telefono character varying(20) NOT NULL,
    semestre integer NOT NULL,
    estado character varying(50) NOT NULL,
    password character varying(200) NOT NULL,
    carrera integer NOT NULL,
    edad integer NOT NULL,
    sexo character varying(20) NOT NULL,
    promedio numeric NOT NULL,
    direccion character varying(300) NOT NULL,
    fecha_nac timestamp without time zone NOT NULL
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16646)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    id integer NOT NULL
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16649)
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias (
    id character varying(15) NOT NULL,
    nombre character varying(100) NOT NULL,
    prelacion character varying(250) NOT NULL,
    unidad_credito integer NOT NULL,
    hp integer NOT NULL,
    ht integer NOT NULL,
    semestre integer NOT NULL,
    id_carrera integer NOT NULL,
    dia character varying(20),
    hora_inicio character varying(10),
    hora_fin character varying(10),
    dia2 character varying(20),
    hora_inicio2 character varying(10),
    hora_fin2 character varying(10),
    ciclo character varying(10) NOT NULL,
    modalidad character varying(20),
    maximo integer,
    id_docente character varying(20)
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16654)
-- Name: materias_estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias_estudiantes (
    id integer NOT NULL,
    cod_materia character varying(20) NOT NULL,
    cedula_estudiante character varying(20) NOT NULL,
    nota1 integer NOT NULL,
    nota2 integer NOT NULL,
    nota3 integer NOT NULL,
    promedio numeric NOT NULL,
    uc integer NOT NULL,
    ciclo character varying(10) NOT NULL
);


ALTER TABLE public.materias_estudiantes OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16659)
-- Name: materias_estudiantes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materias_estudiantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materias_estudiantes_id_seq OWNER TO postgres;

--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 228
-- Name: materias_estudiantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materias_estudiantes_id_seq OWNED BY public.materias_estudiantes.id;


--
-- TOC entry 229 (class 1259 OID 16660)
-- Name: metodo_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metodo_pago (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion character varying(150) NOT NULL
);


ALTER TABLE public.metodo_pago OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16663)
-- Name: metodo_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metodo_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metodo_pago_id_seq OWNER TO postgres;

--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 230
-- Name: metodo_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodo_pago_id_seq OWNED BY public.metodo_pago.id;


--
-- TOC entry 231 (class 1259 OID 16664)
-- Name: montos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.montos (
    id integer NOT NULL,
    concepto character varying(50) NOT NULL,
    monto numeric NOT NULL
);


ALTER TABLE public.montos OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16669)
-- Name: monto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.monto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.monto_id_seq OWNER TO postgres;

--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 232
-- Name: monto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monto_id_seq OWNED BY public.montos.id;


--
-- TOC entry 233 (class 1259 OID 16670)
-- Name: pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos (
    id integer NOT NULL,
    cedula_estudiante character varying(20) NOT NULL,
    metodo_pago_id integer NOT NULL,
    monto_id integer NOT NULL,
    fecha_pago timestamp without time zone NOT NULL,
    referencia_transferencias integer,
    ciclo character varying(10) NOT NULL
);


ALTER TABLE public.pagos OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16673)
-- Name: pagos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pagos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagos_id_seq OWNER TO postgres;

--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 234
-- Name: pagos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagos_id_seq OWNED BY public.pagos.id;


--
-- TOC entry 235 (class 1259 OID 16674)
-- Name: peticiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peticiones (
    id integer NOT NULL,
    id_docente character varying(20) NOT NULL,
    descripcion character varying(500) NOT NULL,
    estado character varying(150) NOT NULL,
    id_estudiante character varying(20) NOT NULL,
    id_materia character varying(20) NOT NULL,
    campo character varying(10) NOT NULL
);


ALTER TABLE public.peticiones OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16679)
-- Name: peticiones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peticiones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peticiones_id_seq OWNER TO postgres;

--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 236
-- Name: peticiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peticiones_id_seq OWNED BY public.peticiones.id;


--
-- TOC entry 244 (class 1259 OID 25000)
-- Name: seguridad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seguridad (
    id integer NOT NULL,
    administracion character varying(20) DEFAULT 'Pascal12345*'::character varying NOT NULL,
    control_estudio character varying(20) DEFAULT 'Pascal12345*'::character varying NOT NULL
);


ALTER TABLE public.seguridad OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16680)
-- Name: superusuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.superusuario (
    cedula character varying(20) NOT NULL,
    fullname character varying(150) NOT NULL,
    correo character varying(150) NOT NULL,
    password character varying(150) NOT NULL
);


ALTER TABLE public.superusuario OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16683)
-- Name: transferencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transferencias (
    id integer NOT NULL,
    codigo_referencia character varying(50) NOT NULL
);


ALTER TABLE public.transferencias OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16686)
-- Name: transferencias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transferencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transferencias_id_seq OWNER TO postgres;

--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 239
-- Name: transferencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transferencias_id_seq OWNED BY public.transferencias.id;


--
-- TOC entry 240 (class 1259 OID 16687)
-- Name: trazabilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trazabilidad (
    id integer NOT NULL,
    accion character varying(300) NOT NULL,
    usuario character varying(300) NOT NULL,
    fecha timestamp without time zone NOT NULL,
    modulo character varying(50) NOT NULL,
    nivel_alerta integer
);


ALTER TABLE public.trazabilidad OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16692)
-- Name: trazabilidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trazabilidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trazabilidad_id_seq OWNER TO postgres;

--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 241
-- Name: trazabilidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trazabilidad_id_seq OWNED BY public.trazabilidad.id;


--
-- TOC entry 242 (class 1259 OID 16693)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    usuario character varying(50) NOT NULL,
    nombre character varying(100) NOT NULL,
    clave character varying(200) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16696)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 243
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4770 (class 2604 OID 16697)
-- Name: billetes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billetes ALTER COLUMN id SET DEFAULT nextval('public.billetes_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 16698)
-- Name: carreras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ALTER COLUMN id SET DEFAULT nextval('public.carreras_id_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 16699)
-- Name: configuracion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion ALTER COLUMN id SET DEFAULT nextval('public.configuracion_id_seq'::regclass);


--
-- TOC entry 4776 (class 2604 OID 16700)
-- Name: materias_estudiantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_estudiantes ALTER COLUMN id SET DEFAULT nextval('public.materias_estudiantes_id_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 16701)
-- Name: metodo_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodo_pago ALTER COLUMN id SET DEFAULT nextval('public.metodo_pago_id_seq'::regclass);


--
-- TOC entry 4778 (class 2604 OID 16702)
-- Name: montos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.montos ALTER COLUMN id SET DEFAULT nextval('public.monto_id_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 16703)
-- Name: pagos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos ALTER COLUMN id SET DEFAULT nextval('public.pagos_id_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 16704)
-- Name: peticiones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones ALTER COLUMN id SET DEFAULT nextval('public.peticiones_id_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 16705)
-- Name: transferencias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias ALTER COLUMN id SET DEFAULT nextval('public.transferencias_id_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 16706)
-- Name: trazabilidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trazabilidad ALTER COLUMN id SET DEFAULT nextval('public.trazabilidad_id_seq'::regclass);


--
-- TOC entry 4783 (class 2604 OID 16707)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4979 (class 0 OID 16613)
-- Dependencies: 215
-- Data for Name: billetes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4981 (class 0 OID 16619)
-- Dependencies: 217
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carreras VALUES (1, 'Informática');
INSERT INTO public.carreras VALUES (2, 'Tecnología de alimentos');
INSERT INTO public.carreras VALUES (3, 'Comunicación y electrónica');
INSERT INTO public.carreras VALUES (4, 'Diseño gráfico');
INSERT INTO public.carreras VALUES (5, 'Contabilidad y costos');
INSERT INTO public.carreras VALUES (6, 'Administración bancaria y financiera');
INSERT INTO public.carreras VALUES (7, 'Administración de empresas');


--
-- TOC entry 4983 (class 0 OID 16625)
-- Dependencies: 219
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.configuracion VALUES ('2024-1', 1, 30, 30, 40, '2024-06-06 00:00:00', '2024-07-15 00:00:00', '2024-06-27 00:00:00', '2024-07-11 00:00:00', '2024-07-25 00:00:00', '2024-08-08 00:00:00', '2024-08-22 00:00:00');


--
-- TOC entry 4985 (class 0 OID 16632)
-- Dependencies: 221
-- Data for Name: control; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4986 (class 0 OID 16635)
-- Dependencies: 222
-- Data for Name: coordinacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4987 (class 0 OID 16638)
-- Dependencies: 223
-- Data for Name: docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4988 (class 0 OID 16641)
-- Dependencies: 224
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4989 (class 0 OID 16646)
-- Dependencies: 225
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factura VALUES (30);


--
-- TOC entry 4990 (class 0 OID 16649)
-- Dependencies: 226
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4991 (class 0 OID 16654)
-- Dependencies: 227
-- Data for Name: materias_estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4993 (class 0 OID 16660)
-- Dependencies: 229
-- Data for Name: metodo_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4995 (class 0 OID 16664)
-- Dependencies: 231
-- Data for Name: montos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4997 (class 0 OID 16670)
-- Dependencies: 233
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4999 (class 0 OID 16674)
-- Dependencies: 235
-- Data for Name: peticiones; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5008 (class 0 OID 25000)
-- Dependencies: 244
-- Data for Name: seguridad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.seguridad VALUES (1, 'Pascal12345*', 'Pascal12345*');


--
-- TOC entry 5001 (class 0 OID 16680)
-- Dependencies: 237
-- Data for Name: superusuario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5002 (class 0 OID 16683)
-- Dependencies: 238
-- Data for Name: transferencias; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5004 (class 0 OID 16687)
-- Dependencies: 240
-- Data for Name: trazabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5006 (class 0 OID 16693)
-- Dependencies: 242
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios VALUES (1, 'caja_pascal', 'Caja', 'sha256$m2ba9umlkOm921VQ$c1e2b387efebdd71927e768131f7b07f8bad0243e4c63a688ee4a3412d8e1412');


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 216
-- Name: billetes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billetes_id_seq', 43, true);


--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 218
-- Name: carreras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_id_seq', 1, false);


--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 220
-- Name: configuracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuracion_id_seq', 1, false);


--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 228
-- Name: materias_estudiantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materias_estudiantes_id_seq', 10, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 230
-- Name: metodo_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodo_pago_id_seq', 79, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 232
-- Name: monto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monto_id_seq', 79, true);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 234
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_id_seq', 62, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 236
-- Name: peticiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peticiones_id_seq', 4, true);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 239
-- Name: transferencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transferencias_id_seq', 22, true);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 241
-- Name: trazabilidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trazabilidad_id_seq', 2290, true);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 243
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);


--
-- TOC entry 4787 (class 2606 OID 16709)
-- Name: billetes billetes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billetes
    ADD CONSTRAINT billetes_pkey PRIMARY KEY (id);


--
-- TOC entry 4789 (class 2606 OID 16711)
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (id);


--
-- TOC entry 4791 (class 2606 OID 16713)
-- Name: configuracion configuracion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion
    ADD CONSTRAINT configuracion_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 16715)
-- Name: control control_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control
    ADD CONSTRAINT control_pkey PRIMARY KEY (cedula);


--
-- TOC entry 4795 (class 2606 OID 16717)
-- Name: coordinacion coordinacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coordinacion
    ADD CONSTRAINT coordinacion_pkey PRIMARY KEY (cedula);


--
-- TOC entry 4797 (class 2606 OID 16719)
-- Name: docentes docente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docentes
    ADD CONSTRAINT docente_pkey PRIMARY KEY (cedula);


--
-- TOC entry 4799 (class 2606 OID 16721)
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (cedula);


--
-- TOC entry 4801 (class 2606 OID 16723)
-- Name: factura facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- TOC entry 4805 (class 2606 OID 16725)
-- Name: materias_estudiantes materias_estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_estudiantes
    ADD CONSTRAINT materias_estudiantes_pkey PRIMARY KEY (id);


--
-- TOC entry 4803 (class 2606 OID 16727)
-- Name: materias materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id);


--
-- TOC entry 4807 (class 2606 OID 16729)
-- Name: metodo_pago metodo_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodo_pago
    ADD CONSTRAINT metodo_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 4809 (class 2606 OID 16731)
-- Name: montos monto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.montos
    ADD CONSTRAINT monto_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 16733)
-- Name: pagos pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id);


--
-- TOC entry 4813 (class 2606 OID 16735)
-- Name: peticiones peticiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones
    ADD CONSTRAINT peticiones_pkey PRIMARY KEY (id);


--
-- TOC entry 4823 (class 2606 OID 25006)
-- Name: seguridad seguridad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seguridad
    ADD CONSTRAINT seguridad_pkey PRIMARY KEY (id);


--
-- TOC entry 4815 (class 2606 OID 16737)
-- Name: superusuario superusuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.superusuario
    ADD CONSTRAINT superusuario_pkey PRIMARY KEY (cedula);


--
-- TOC entry 4817 (class 2606 OID 16739)
-- Name: transferencias transferencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias
    ADD CONSTRAINT transferencias_pkey PRIMARY KEY (id);


--
-- TOC entry 4819 (class 2606 OID 16741)
-- Name: trazabilidad trazabilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trazabilidad
    ADD CONSTRAINT trazabilidad_pkey PRIMARY KEY (id);


--
-- TOC entry 4821 (class 2606 OID 16743)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4824 (class 2606 OID 16744)
-- Name: materias materias_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_carrera_id_fkey FOREIGN KEY (id_carrera) REFERENCES public.carreras(id) NOT VALID;


--
-- TOC entry 4825 (class 2606 OID 16749)
-- Name: materias materias_docente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_docente_id_fkey FOREIGN KEY (id_docente) REFERENCES public.docentes(cedula) NOT VALID;


--
-- TOC entry 4826 (class 2606 OID 16754)
-- Name: materias_estudiantes materias_estudiantes_cedula_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_estudiantes
    ADD CONSTRAINT materias_estudiantes_cedula_estudiante_fkey FOREIGN KEY (cedula_estudiante) REFERENCES public.estudiantes(cedula);


--
-- TOC entry 4827 (class 2606 OID 16759)
-- Name: materias_estudiantes materias_estudiantes_cod_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_estudiantes
    ADD CONSTRAINT materias_estudiantes_cod_materia_fkey FOREIGN KEY (cod_materia) REFERENCES public.materias(id);


--
-- TOC entry 4828 (class 2606 OID 16764)
-- Name: pagos pagos_cedula_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_cedula_estudiante_fkey FOREIGN KEY (cedula_estudiante) REFERENCES public.estudiantes(cedula);


--
-- TOC entry 4829 (class 2606 OID 16769)
-- Name: pagos pagos_metodo_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_metodo_pago_id_fkey FOREIGN KEY (metodo_pago_id) REFERENCES public.metodo_pago(id);


--
-- TOC entry 4830 (class 2606 OID 16774)
-- Name: pagos pagos_monto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_monto_id_fkey FOREIGN KEY (monto_id) REFERENCES public.montos(id);


--
-- TOC entry 4831 (class 2606 OID 16779)
-- Name: pagos pagos_referencia_transferencias_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_referencia_transferencias_fkey FOREIGN KEY (referencia_transferencias) REFERENCES public.transferencias(id) NOT VALID;


--
-- TOC entry 4832 (class 2606 OID 16784)
-- Name: pagos pagos_transf_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_transf_id_fkey FOREIGN KEY (referencia_transferencias) REFERENCES public.transferencias(id) NOT VALID;


--
-- TOC entry 4833 (class 2606 OID 16789)
-- Name: peticiones peticiones_id_docente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones
    ADD CONSTRAINT peticiones_id_docente_fkey FOREIGN KEY (id_docente) REFERENCES public.docentes(cedula);


--
-- TOC entry 4834 (class 2606 OID 16794)
-- Name: peticiones peticiones_id_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones
    ADD CONSTRAINT peticiones_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiantes(cedula);


--
-- TOC entry 4835 (class 2606 OID 16799)
-- Name: peticiones peticiones_id_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones
    ADD CONSTRAINT peticiones_id_materia_fkey FOREIGN KEY (id_materia) REFERENCES public.materias(id);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-08-21 21:22:53

--
-- PostgreSQL database dump complete
--

