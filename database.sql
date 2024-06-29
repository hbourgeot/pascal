--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-28 21:18:46

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 23900)
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
-- TOC entry 210 (class 1259 OID 23905)
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
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 210
-- Name: billetes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.billetes_id_seq OWNED BY public.billetes.id;


--
-- TOC entry 211 (class 1259 OID 23906)
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 23911)
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
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 212
-- Name: carreras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_id_seq OWNED BY public.carreras.id;


--
-- TOC entry 213 (class 1259 OID 23912)
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
-- TOC entry 214 (class 1259 OID 23918)
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
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 214
-- Name: configuracion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuracion_id_seq OWNED BY public.configuracion.id;


--
-- TOC entry 215 (class 1259 OID 23919)
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
-- TOC entry 216 (class 1259 OID 23922)
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
-- TOC entry 217 (class 1259 OID 23925)
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
-- TOC entry 218 (class 1259 OID 23928)
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
-- TOC entry 219 (class 1259 OID 23933)
-- Name: factura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factura (
    id integer NOT NULL
);


ALTER TABLE public.factura OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 23936)
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
    dia character varying(20) NOT NULL,
    hora_inicio character varying(10) NOT NULL,
    hora_fin character varying(10) NOT NULL,
    dia2 character varying(20),
    hora_inicio2 character varying(10),
    hora_fin2 character varying(10),
    ciclo character varying(10) NOT NULL,
    modalidad character varying(20) NOT NULL,
    maximo integer NOT NULL,
    id_docente character varying(20) NOT NULL
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 23939)
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
-- TOC entry 222 (class 1259 OID 23944)
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
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 222
-- Name: materias_estudiantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materias_estudiantes_id_seq OWNED BY public.materias_estudiantes.id;


--
-- TOC entry 223 (class 1259 OID 23945)
-- Name: metodo_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metodo_pago (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion character varying(150) NOT NULL
);


ALTER TABLE public.metodo_pago OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 23948)
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
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 224
-- Name: metodo_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metodo_pago_id_seq OWNED BY public.metodo_pago.id;


--
-- TOC entry 225 (class 1259 OID 23949)
-- Name: montos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.montos (
    id integer NOT NULL,
    concepto character varying(50) NOT NULL,
    monto numeric NOT NULL
);


ALTER TABLE public.montos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 23954)
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
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 226
-- Name: monto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.monto_id_seq OWNED BY public.montos.id;


--
-- TOC entry 227 (class 1259 OID 23955)
-- Name: pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos (
    id integer NOT NULL,
    cedula_estudiante character varying(20) NOT NULL,
    metodo_pago_id integer NOT NULL,
    monto_id integer NOT NULL,
    fecha_pago timestamp without time zone NOT NULL,
    referencia_transferencias integer NOT NULL,
    ciclo character varying(10) NOT NULL
);


ALTER TABLE public.pagos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 23958)
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
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 228
-- Name: pagos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pagos_id_seq OWNED BY public.pagos.id;


--
-- TOC entry 229 (class 1259 OID 23959)
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
-- TOC entry 230 (class 1259 OID 23964)
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
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 230
-- Name: peticiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peticiones_id_seq OWNED BY public.peticiones.id;


--
-- TOC entry 231 (class 1259 OID 23965)
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
-- TOC entry 232 (class 1259 OID 23968)
-- Name: transferencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transferencias (
    id integer NOT NULL,
    codigo_referencia character varying(50) NOT NULL
);


ALTER TABLE public.transferencias OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 23971)
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
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 233
-- Name: transferencias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transferencias_id_seq OWNED BY public.transferencias.id;


--
-- TOC entry 237 (class 1259 OID 40561)
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
-- TOC entry 236 (class 1259 OID 40560)
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
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 236
-- Name: trazabilidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trazabilidad_id_seq OWNED BY public.trazabilidad.id;


--
-- TOC entry 234 (class 1259 OID 23972)
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
-- TOC entry 235 (class 1259 OID 23975)
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
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 235
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 3242 (class 2604 OID 23976)
-- Name: billetes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billetes ALTER COLUMN id SET DEFAULT nextval('public.billetes_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 23977)
-- Name: carreras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ALTER COLUMN id SET DEFAULT nextval('public.carreras_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 23978)
-- Name: configuracion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion ALTER COLUMN id SET DEFAULT nextval('public.configuracion_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 23979)
-- Name: materias_estudiantes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_estudiantes ALTER COLUMN id SET DEFAULT nextval('public.materias_estudiantes_id_seq'::regclass);


--
-- TOC entry 3249 (class 2604 OID 23980)
-- Name: metodo_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodo_pago ALTER COLUMN id SET DEFAULT nextval('public.metodo_pago_id_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 23981)
-- Name: montos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.montos ALTER COLUMN id SET DEFAULT nextval('public.monto_id_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 23982)
-- Name: pagos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos ALTER COLUMN id SET DEFAULT nextval('public.pagos_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 23983)
-- Name: peticiones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones ALTER COLUMN id SET DEFAULT nextval('public.peticiones_id_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 23984)
-- Name: transferencias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias ALTER COLUMN id SET DEFAULT nextval('public.transferencias_id_seq'::regclass);


--
-- TOC entry 3255 (class 2604 OID 40564)
-- Name: trazabilidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trazabilidad ALTER COLUMN id SET DEFAULT nextval('public.trazabilidad_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 23985)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3443 (class 0 OID 23900)
-- Dependencies: 209
-- Data for Name: billetes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billetes (id, serial, monto, pago_id) FROM stdin;
\.


--
-- TOC entry 3445 (class 0 OID 23906)
-- Dependencies: 211
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (id, nombre) FROM stdin;
1	Informática
2	Tecnología de alimentos
3	Comunicación y electrónica
4	Diseño gráfico
5	Contabilidad y costos
6	Administración bancaria y financiera
7	Administración de empresas
5839	programacion
\.


--
-- TOC entry 3447 (class 0 OID 23912)
-- Dependencies: 213
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuracion (ciclo, id, porc1, porc2, porc3, horario_inicio, horario_fin, cuota1, cuota2, cuota3, cuota4, cuota5) FROM stdin;
2024-1	1	25	50	25	2024-06-10 00:00:00	2024-07-08 00:00:00	2024-07-01 00:00:00	2024-07-15 00:00:00	2024-07-29 00:00:00	2024-08-12 00:00:00	2024-08-26 00:00:00
\.


--
-- TOC entry 3449 (class 0 OID 23919)
-- Dependencies: 215
-- Data for Name: control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.control (cedula, fullname, correo, telefono, password) FROM stdin;
V-9435339	Hilda Silvaa	hilda@gmail.com	0414-4571302	sha256$wKp3VpaivmopiGLY$ab1126c1256381620abc0db9d2b860197064cf401a874e7f0240e71da835f27c
\.


--
-- TOC entry 3450 (class 0 OID 23922)
-- Dependencies: 216
-- Data for Name: coordinacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coordinacion (cedula, fullname, correo, telefono, password) FROM stdin;
V-3230111	Julieta Silva	julieta@gmail.com	0424-3826983	sha256$dkPxwAZbs5GAOyBe$9abac64c3fd9d0dbadf31d27859560f95bf2575ebd071c320e998f63324aef49
\.


--
-- TOC entry 3451 (class 0 OID 23925)
-- Dependencies: 217
-- Data for Name: docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docentes (cedula, fullname, correo, telefono, password) FROM stdin;
V-30211773	Maria Perez	maria@gmail.com	0414-1234567	sha256$GvrVzWz0A71Pw6dn$f17589ffdeaa5ca9f4af7e1f245ac86d6a3da0db4011d76515016c01c3c7f298
\.


--
-- TOC entry 3452 (class 0 OID 23928)
-- Dependencies: 218
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) FROM stdin;
V-30555724	Henrry francisco bourgeot silva	henrrybrgt@gmail.com	0414-4571302	1	nuevo ingreso	sha256$UlRUL7aj4g5R8MH5$0d6e1eb8907f668b70c30a691dc5d279560c6596358a918a52cb1f5c732816b0	1	20	M	0	la morita	2003-01-16 00:00:00
V-30406663	sharon andreina gamboa tanco	sharongamboa01@hotmail.com	0414-436311	1	regular	sha256$HADyuYkM1jgjSCfT$e20537aa8ada4bddead8ce5cb237a27dfafe3207cddfe12b43cabdc9d1b090a3	2	22	F	0	turmero	2022-05-08 00:00:00
V-30452818	Francisco gabriel silva persaq	franciscosilva01@gmail.com	0414--1	2	regular	sha256$4k0SY19o0WVrBe7l$593e08fbf08b02e0c4aef84ad804a9da7ce117ae679fa1bdcbbcb8b42130339d	3	21	M	0	san carlos	2002-09-07 00:00:00
V-29890437	elibeth leonela curalli jaimes	elibethleonela@gmail.com	0424-3501574	1	nuevo ingreso	sha256$0oU4lMVccheQgsnF$708b82265752f519d482c08f6ed1eb8ec8acae91a09b52d5de64c4bcbe889003	3	21	F	0	santa cruz	2002-06-18 00:00:00
\.


--
-- TOC entry 3453 (class 0 OID 23933)
-- Dependencies: 219
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factura (id) FROM stdin;
1
\.


--
-- TOC entry 3454 (class 0 OID 23936)
-- Dependencies: 220
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) FROM stdin;
9474084	MATEMÁTICA		1	2	3	1	4	martes	07:00 AM	08:20 AM	jueves	07:00 AM	10:00 AM	2024-1	Virtual	24	V-30211773
\.


--
-- TOC entry 3455 (class 0 OID 23939)
-- Dependencies: 221
-- Data for Name: materias_estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materias_estudiantes (id, cod_materia, cedula_estudiante, nota1, nota2, nota3, promedio, uc, ciclo) FROM stdin;
\.


--
-- TOC entry 3457 (class 0 OID 23945)
-- Dependencies: 223
-- Data for Name: metodo_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.metodo_pago (id, nombre, descripcion) FROM stdin;
1	Transferencia	pre_inscripcion
2	Transferencia	pre_inscripcion
3	Efectivo	pre_inscripcion
4	Efectivo	pre_inscripcion
5	Punto	pre_inscripcion
6	Punto	pre_inscripcion
7	Transferencia	pre_inscripcion
8	Transferencia	pre_inscripcion
9	Transferencia	pre_inscripcion
10	Transferencia	pre_inscripcion
11	Transferencia	pre_inscripcion
12	Transferencia	pre_inscripcion
13	Transferencia	pre_inscripcion
14	Transferencia	pre_inscripcion
15	Transferencia	pre_inscripcion
16	Transferencia	pre_inscripcion
17	Transferencia	pre_inscripcion
18	Transferencia	pre_inscripcion
\.


--
-- TOC entry 3459 (class 0 OID 23949)
-- Dependencies: 225
-- Data for Name: montos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.montos (id, concepto, monto) FROM stdin;
1	pre_inscripcion	1265
2	pre_inscripcion	1265
3	pre_inscripcion	1265
4	pre_inscripcion	1265
5	pre_inscripcion	1265
6	pre_inscripcion	1265
7	pre_inscripcion	3482
8	pre_inscripcion	3482
9	pre_inscripcion	3482
10	pre_inscripcion	3482
11	pre_inscripcion	3482
12	pre_inscripcion	3482
13	pre_inscripcion	3482
14	pre_inscripcion	3482
15	pre_inscripcion	3482
16	pre_inscripcion	3482
17	pre_inscripcion	3482
18	pre_inscripcion	3482
\.


--
-- TOC entry 3461 (class 0 OID 23955)
-- Dependencies: 227
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos (id, cedula_estudiante, metodo_pago_id, monto_id, fecha_pago, referencia_transferencias, ciclo) FROM stdin;
1	V-29890437	18	18	2024-06-13 00:00:00	10	2024-1
\.


--
-- TOC entry 3463 (class 0 OID 23959)
-- Dependencies: 229
-- Data for Name: peticiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peticiones (id, id_docente, descripcion, estado, id_estudiante, id_materia, campo) FROM stdin;
\.


--
-- TOC entry 3465 (class 0 OID 23965)
-- Dependencies: 231
-- Data for Name: superusuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.superusuario (cedula, fullname, correo, password) FROM stdin;
V-8599738	Henrry Francisco	hfbourgeotjr@gmail.com	sha256$fyqyxG8kOtRAQxRp$55e88b893316aec7b568e2732e4aaac8398e763b90612a0c38a99279eb60d0ae
\.


--
-- TOC entry 3466 (class 0 OID 23968)
-- Dependencies: 232
-- Data for Name: transferencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transferencias (id, codigo_referencia) FROM stdin;
1	58392
2	58392
3	58392
4	58392
5	58392
6	58392
7	58392
8	58392
9	58392
10	58392
\.


--
-- TOC entry 3471 (class 0 OID 40561)
-- Dependencies: 237
-- Data for Name: trazabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) FROM stdin;
\.


--
-- TOC entry 3468 (class 0 OID 23972)
-- Dependencies: 234
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, usuario, nombre, clave) FROM stdin;
1	caja_pascal	Caja	sha256$m2ba9umlkOm921VQ$c1e2b387efebdd71927e768131f7b07f8bad0243e4c63a688ee4a3412d8e1412
\.


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 210
-- Name: billetes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billetes_id_seq', 1, false);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 212
-- Name: carreras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_id_seq', 1, false);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 214
-- Name: configuracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuracion_id_seq', 1, false);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 222
-- Name: materias_estudiantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materias_estudiantes_id_seq', 1, false);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 224
-- Name: metodo_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodo_pago_id_seq', 18, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 226
-- Name: monto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monto_id_seq', 18, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 228
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_id_seq', 1, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 230
-- Name: peticiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peticiones_id_seq', 1, false);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 233
-- Name: transferencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transferencias_id_seq', 10, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 236
-- Name: trazabilidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trazabilidad_id_seq', 1, false);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 235
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);


--
-- TOC entry 3257 (class 2606 OID 23987)
-- Name: billetes billetes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billetes
    ADD CONSTRAINT billetes_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 23989)
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 23991)
-- Name: configuracion configuracion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuracion
    ADD CONSTRAINT configuracion_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 23993)
-- Name: control control_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.control
    ADD CONSTRAINT control_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3265 (class 2606 OID 23995)
-- Name: coordinacion coordinacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coordinacion
    ADD CONSTRAINT coordinacion_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3267 (class 2606 OID 23997)
-- Name: docentes docente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docentes
    ADD CONSTRAINT docente_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3269 (class 2606 OID 23999)
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3271 (class 2606 OID 24001)
-- Name: factura facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factura
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 24003)
-- Name: materias_estudiantes materias_estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_estudiantes
    ADD CONSTRAINT materias_estudiantes_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 24005)
-- Name: materias materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 24007)
-- Name: metodo_pago metodo_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metodo_pago
    ADD CONSTRAINT metodo_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 24009)
-- Name: montos monto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.montos
    ADD CONSTRAINT monto_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 24011)
-- Name: pagos pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 24013)
-- Name: peticiones peticiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones
    ADD CONSTRAINT peticiones_pkey PRIMARY KEY (id);


--
-- TOC entry 3285 (class 2606 OID 24015)
-- Name: superusuario superusuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.superusuario
    ADD CONSTRAINT superusuario_pkey PRIMARY KEY (cedula);


--
-- TOC entry 3287 (class 2606 OID 24017)
-- Name: transferencias transferencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transferencias
    ADD CONSTRAINT transferencias_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 2606 OID 40568)
-- Name: trazabilidad trazabilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trazabilidad
    ADD CONSTRAINT trazabilidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 24019)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 24020)
-- Name: materias materias_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_carrera_id_fkey FOREIGN KEY (id_carrera) REFERENCES public.carreras(id) NOT VALID;


--
-- TOC entry 3293 (class 2606 OID 24025)
-- Name: materias materias_docente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_docente_id_fkey FOREIGN KEY (id_docente) REFERENCES public.docentes(cedula) NOT VALID;


--
-- TOC entry 3294 (class 2606 OID 24030)
-- Name: materias_estudiantes materias_estudiantes_cedula_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_estudiantes
    ADD CONSTRAINT materias_estudiantes_cedula_estudiante_fkey FOREIGN KEY (cedula_estudiante) REFERENCES public.estudiantes(cedula);


--
-- TOC entry 3295 (class 2606 OID 24035)
-- Name: materias_estudiantes materias_estudiantes_cod_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_estudiantes
    ADD CONSTRAINT materias_estudiantes_cod_materia_fkey FOREIGN KEY (cod_materia) REFERENCES public.materias(id);


--
-- TOC entry 3296 (class 2606 OID 24040)
-- Name: pagos pagos_cedula_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_cedula_estudiante_fkey FOREIGN KEY (cedula_estudiante) REFERENCES public.estudiantes(cedula);


--
-- TOC entry 3297 (class 2606 OID 24045)
-- Name: pagos pagos_metodo_pago_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_metodo_pago_id_fkey FOREIGN KEY (metodo_pago_id) REFERENCES public.metodo_pago(id);


--
-- TOC entry 3298 (class 2606 OID 24050)
-- Name: pagos pagos_monto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_monto_id_fkey FOREIGN KEY (monto_id) REFERENCES public.montos(id);


--
-- TOC entry 3299 (class 2606 OID 24055)
-- Name: pagos pagos_referencia_transferencias_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_referencia_transferencias_fkey FOREIGN KEY (referencia_transferencias) REFERENCES public.transferencias(id) NOT VALID;


--
-- TOC entry 3300 (class 2606 OID 24060)
-- Name: pagos pagos_transf_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_transf_id_fkey FOREIGN KEY (referencia_transferencias) REFERENCES public.transferencias(id) NOT VALID;


--
-- TOC entry 3301 (class 2606 OID 24065)
-- Name: peticiones peticiones_id_docente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones
    ADD CONSTRAINT peticiones_id_docente_fkey FOREIGN KEY (id_docente) REFERENCES public.docentes(cedula);


--
-- TOC entry 3302 (class 2606 OID 24070)
-- Name: peticiones peticiones_id_estudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones
    ADD CONSTRAINT peticiones_id_estudiante_fkey FOREIGN KEY (id_estudiante) REFERENCES public.estudiantes(cedula);


--
-- TOC entry 3303 (class 2606 OID 24075)
-- Name: peticiones peticiones_id_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peticiones
    ADD CONSTRAINT peticiones_id_materia_fkey FOREIGN KEY (id_materia) REFERENCES public.materias(id);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-06-28 21:18:46

--
-- PostgreSQL database dump complete
--

