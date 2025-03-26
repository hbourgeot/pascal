--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-11-25 23:10:09

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

INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (44, '45LKJ78', 20, 64);
INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (45, '45OKL', 10, 64);
INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (46, '45QWKL', 5, 64);
INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (47, 'LKJ789', 50, 68);
INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (48, 'ASF67G', 20, 71);
INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (49, '3EDF56', 10, 71);
INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (50, 'RGD678', 5, 71);
INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (51, '12LKJ', 20, 76);
INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (52, '1LSSJ2', 10, 76);
INSERT INTO public.billetes (id, serial, monto, pago_id) VALUES (53, 'AAAA145', 5, 76);


--
-- TOC entry 4981 (class 0 OID 16619)
-- Dependencies: 217
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carreras (id, nombre) VALUES (1, 'Informática');
INSERT INTO public.carreras (id, nombre) VALUES (2, 'Tecnología de alimentos');
INSERT INTO public.carreras (id, nombre) VALUES (3, 'Comunicación y electrónica');
INSERT INTO public.carreras (id, nombre) VALUES (4, 'Diseño gráfico');
INSERT INTO public.carreras (id, nombre) VALUES (5, 'Contabilidad y costos');
INSERT INTO public.carreras (id, nombre) VALUES (6, 'Administración bancaria y financiera');
INSERT INTO public.carreras (id, nombre) VALUES (7, 'Administración de empresas');


--
-- TOC entry 4983 (class 0 OID 16625)
-- Dependencies: 219
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.configuracion (ciclo, id, porc1, porc2, porc3, horario_inicio, horario_fin, cuota1, cuota2, cuota3, cuota4, cuota5) VALUES ('2024-1', 1, 30, 30, 40, '2024-10-31 00:00:00', '2024-11-29 00:00:00', '2024-11-29 00:00:00', '2024-12-29 00:00:00', '2025-01-29 00:00:00', '2025-02-27 00:00:00', '2025-03-29 00:00:00');


--
-- TOC entry 4985 (class 0 OID 16632)
-- Dependencies: 221
-- Data for Name: control; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.control (cedula, fullname, correo, telefono, password) VALUES ('V-45678910', 'Usuario control de estudio', 'control1@gmail.com', '04243501573', 'sha256$alXbXTDldyHObaCH$58e5a661783597197daffd68947b54dce06e9e3ca8018cb4fabe2002c8ee0189');


--
-- TOC entry 4986 (class 0 OID 16635)
-- Dependencies: 222
-- Data for Name: coordinacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.coordinacion (cedula, fullname, correo, telefono, password) VALUES ('V-12345678', 'Usuario coordinador', 'coordinador1@gmail.com', '04243501575', 'sha256$6Xsx7CeP8uyqBCYm$7e8a9a3b8993d209f28d3fa217f8dfed7ee412f81e44bc4ff0a705dd73a3915a');


--
-- TOC entry 4987 (class 0 OID 16638)
-- Dependencies: 223
-- Data for Name: docentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.docentes (cedula, fullname, correo, telefono, password) VALUES ('V-29890437', 'elibeth curalli', 'elibeth@gmail.com', '04243501574', 'sha256$emTBLmp7af3wMmWk$f87d59999a8acd935139dd180b3e1b09099966df6aa10920b0045830a4452f4f');
INSERT INTO public.docentes (cedula, fullname, correo, telefono, password) VALUES ('V-30555724', 'Henrry bourgeot', 'henrry@gmail.com', '04243501574', 'sha256$TNLkLBgMqxbE8Cns$a34856e78b3b13fc70548a1e74862087120fb398a1b851e8bf317b4f3e3aa201');


--
-- TOC entry 4988 (class 0 OID 16641)
-- Dependencies: 224
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-32073287', 'CARLOS EDUARDO JASPE NOGUERA', 'JASPEC28@GMAIL.COM', '0412-362963', 1, 'nuevo ingreso', 'sha256$Zsic2wcxaMULv1Kg$6f5f3a58138977dc1fc09bae486510ab991353ada2ec12b9f7022dc9e5a7f830', 6, 18, 'M', 0, 'GIRARDOT', '2005-04-14 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-29728463', 'GLAYSMARI KAIRUBI CISNEROS PEÑA', 'GLAYSMARICISNERO@GMAIL.COM', '0424-3358813', 1, 'nuevo ingreso', 'sha256$10dwNma36QV2HPP0$f11cc792819acee77acbbfe4dc2748d437ed03ff9663bce93a800bbdb16478e5', 7, 22, 'F', 0, 'TURMERO', '2002-06-01 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-27400076', 'JOSWYL ARON MENDEZ BOMPART', 'JOSWYLMENDEZ2000@GMAIL.COM', '0424-3499441', 1, 'nuevo ingreso', 'sha256$9vPOs3MGLmxMdOoS$f96a9b76185711389a831aad12a545a860657526ebb5890eb819133d36d9e593', 7, 24, 'M', 0, 'TURMERO', '2000-05-27 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-28097785', 'SANTIAGO MARTINEZ', 'SANTIAGOGROSS1710@GMAIL.COM', '0424-3485813', 1, 'nuevo ingreso', 'sha256$ayDn0auBjvTlLO2r$d67bc3a5c70539aa9fdfe5ccdf88bad946c3b0dbdcbfc24a038583f2c1b75ab2', 7, 24, 'M', 0, 'TURMERO', '2000-10-17 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30499635', 'GABRIEL DE JESÚS RIVAS ADRIAN', 'GABRIELDEJESUSRIVASADRIAN@GMAIL.COM', '0424-3523646', 1, 'nuevo ingreso', 'sha256$G4Ph3Vp9AkUSS4YC$b1abb8f677737fe2f3db463fab8baf9e7dfa156eac7dd592e6547fc5a4bf9bb9', 7, 20, 'M', 0, 'SUCRE, CAGUA', '2004-03-19 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31030746', 'MARIA JOSE GONZALEZ', 'MARIAJOSEGONZALEZDEABREU@GMAIL.COM', '0424-3364172', 1, 'nuevo ingreso', 'sha256$kEkHEDZTHJAqgouU$ed9a30ef70f732782f32ef2afb2ac92f36f3a6d608c9b3ecb3366086c0ea8107', 7, 19, 'F', 0, 'TURMERO', '2005-11-04 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', 'THAMARALOREN24@GMAIL.COM', '0424-5973400', 1, 'nuevo ingreso', 'sha256$d0o3cogJR4zN2sfF$b8b73046194a2b6e4de82c7d942bdb3ed0de05dbd2bc08b8697db01d51ac2354', 7, 56, 'M', 0, ' SUCRE, CAGUA', '1968-04-24 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-28023802', 'IVANNA ALEJANDRA RODRÍGUEZ MARTÍNEZ', 'RODRIGUEZIVANNA04@GMAIL.COM', '0424-3081647', 1, 'nuevo ingreso', 'sha256$9OBPMZqOYNM08SBy$a371cf138d0f56c747c4720d9e0d3a79e79aa4666d300e94661112853703de47', 7, 23, 'F', 0, 'SUCRE, CAGUA', '2001-12-09 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31302786', 'YONAIKER ALEJANDRO HENRÍQUEZ LÓPEZ', 'YONAIKERL442@GMAIL.COM', '0424-3677968', 1, 'nuevo ingreso', 'sha256$cR70EW005e88zVdw$e96eaa1838af0dda28e88cbb33d1f66fed0c20242eec90134386740953812986', 7, 21, 'M', 0, 'SUCRE, CAGUA', '2003-12-02 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31536828', 'YORKELYS DEL CARMEN VENTURA MENDOZA', 'YORKELISVENTURA@GAMIL.COM', '0424-2109403', 1, 'nuevo ingreso', 'sha256$dCifMwTCn5vkTSBg$f00c2c551a86570200126448f692595b9ed63d04f0e784ec1ec06088f899e33e', 7, 19, 'F', 0, 'SUCRE. CAGUA', '2004-03-24 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31715004', 'MARÍA ALEJANDRA RUIZ DELGADO', 'MARIA.ALERUAZ@GMAIL.COM', '0424-6846558', 1, 'nuevo ingreso', 'sha256$1JzNQkQiIZxY4Ej8$6dfea912cabf2c9f6693db4f00d5aa44a855614631f8f09eb8523b44c11ed27d', 7, 18, 'F', 0, 'SUCRE, CAGUA', '2006-08-16 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-27865941', 'GREISMAR FRANYELI  TRAVIEZO FLORES', 'GREISMARTRAVIEZO@GMAIL.COM', '0424-4084720', 1, 'nuevo ingreso', 'sha256$S4Jz5LZlfZghMAnX$c94333addb5cbbefb249287d249aa11d90bfb864eb205300a7ac8be5c1d4d6b4', 7, 24, 'F', 0, 'TURMERO', '2000-12-10 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30659332', 'MARIAFERNANDA CUELLO DA SILVA', 'MARIAFERNANDACD10@GMAIL.COM', '0424-3492170', 1, 'nuevo ingreso', 'sha256$uEnIqxnu24fkyVnR$2eaf15fb459889ed0d56db2f850e30f7fe401d3aaaff8f2bfa890207f09b0fa7', 7, 19, 'M', 0, 'SUCRE. CAGUA', '2005-01-10 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30477677', 'BRYAN RAFAEL ARIAS GIMÉNEZ', 'BRYANARIAS379@GMAIL.COM', '0424-1483672', 1, 'nuevo ingreso', 'sha256$CzqB541syFQJMwms$4917734fc1e24df41c9f9923a1777c62680a555cc31c847acce777970e5bfa83', 7, 20, 'M', 0, 'TURMERO', '2004-07-29 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-13862485', 'KONIETZY	AVILA', 'KONIYOAN123@GMAIL.COM', '0424-1788920', 1, 'nuevo ingreso', 'sha256$OVkPkcEg1610JPfG$277c522114ac97edd380490395197121404a4319b5694e96715a753e9c0be972', 7, 44, 'F', 0, 'SAN MATEO', '1980-10-11 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31081111', 'WILLIAM JAVIER	TALERO JIMÉNEZ', 'WILLIAMTALERO2424@GMAIL.COM', '0424-7530567', 1, 'nuevo ingreso', 'sha256$Dw6pG33rNOJNwKZZ$c6c82f671fbdac0f43311842752348afbeb279eda260f886be4cb1bee1acbeb5', 7, 19, 'M', 0, 'SUCRE, CAGUA', '2005-11-22 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-29502239', 'DANIELA   	SALCEDO', 'CARLOSARANGUREN35@GMAIL.COM', '0424-4160244', 1, 'nuevo ingreso', 'sha256$6ZD2v3nzQ6blYu56$421da39edc889a2d35bcb5dc525468af09051f19e80eb573730f188eaeec7ed0', 7, 25, 'F', 0, 'SUCRE, CAGUA', '1999-06-05 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31055907', 'JHANNELYS NUÑEZ	NUÑEZ FUENTES', 'NJHANNELYS02@GMAIL.COM', '0412-1486675', 1, 'nuevo ingreso', 'sha256$06cmp9lJGlMOlV3B$1783e34f33d729ac93dec73e07ce21c482e9fce3befa5d70a4c1ea0e649128ec', 7, 19, 'F', 0, 'TURMERO', '2005-07-02 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31128439', 'GREISMARY JOSÉ	BOLIVAR ALECIO', 'GREISMA2206@GMAIL.COM', '0412-8990464', 1, 'nuevo ingreso', 'sha256$WuJ3P3BWLdAhxeiz$8dd43ce1d14d09f1229131e1a3443fa1fa933762288a9f38dadc9f43978aea22', 7, 19, 'F', 0, 'MADRE MARIA DE SAN JOSE', '2005-05-28 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-28316669', 'YORGELIS PATRICIA	VELASQUEZ RONDÓN', 'YORGELISPATRICIA15@GMAIL.COM', '0412-8958490', 1, 'nuevo ingreso', 'sha256$OW2ktn2rxQYVLljZ$d4f8a60214d13743058605e48ed1df91ad3216491da2deed9bb99bc414fe14e7', 7, 23, 'F', 0, 'SANTA CRUZ', '2001-04-27 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-28387523', 'ANNGI NAKARID	MADRID QUINTANA', 'NAKARIDQUINTANA1@GMAIL.COM', '0424-3035989', 1, 'nuevo ingreso', 'sha256$FndkdKuLrafNbqiZ$558ff2fef4acf408bfcabfc75b91a7abf844e5aa310722068d35438bab9aa64a', 7, 23, 'F', 0, 'SUCRE, CAGUA', '2001-11-14 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30499959', 'JOSE GREGORIO	ALFONZO ARAQUE', 'JOSEALFONZO176@GMAIL.COM', '0412-4322033', 1, 'nuevo ingreso', 'sha256$n1BkA9Yd2gKPW74g$75dc35efb427bba52323e1649f52bda30fc7209bceef5b9f048fff9f373d0a6d', 7, 21, 'M', 0, 'TURMERO', '2003-12-09 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31652040', 'JHONATAN JOSÉ	GUACARE UGAS', 'GUACARE1234@GMAIL.COM', '0412-1634957', 1, 'nuevo ingreso', 'sha256$LrbPQlAWW9udJR6A$6597ab2c094b4eef56aa752f6f9eb38b66c9f004c90f6a289b72cd2a81c8640e', 7, 20, 'M', 0, 'SUCRE, CAGUA', '2004-02-15 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31182704', 'PAOLA ALEJANDRA	MENDOZA CARRILLO', 'PM64879@GMAIL.COM', '0412-1590327', 1, 'nuevo ingreso', 'sha256$1l5Pwof56gCr2Axw$79a1778f78a41039bb04ffaf4b7aa3ee32408f0c5d3d8bb89c29e50d14bdc444', 7, 19, 'F', 0, 'SUCRE, CAGUA', '2005-11-13 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-26680848', 'GLADIOLA CORINA	MATOS RODRÍGUEZ', 'GLADIOLA_99@HOTMAIL.COM', '0412-4006021', 1, 'nuevo ingreso', 'sha256$5235RfmW7GUhbG0o$3ddec08055d4875cde8a745c4546cd323b9bbc9e1672227ea3dfe27f272f621b', 7, 25, 'F', 0, 'VILLA DE CURA', '1999-06-22 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30643997', 'CÉSAR DANIEL	MÉNDEZ HERNÁNDEZ', 'CESARMENDEZ30643997@GMAIL.COM', '0424-3463481', 1, 'nuevo ingreso', 'sha256$01Ad430xMcgzlaw5$5e45cbe216ccd6b0a4eaa4dcbf8747ecd525f1b79d6c16f5c339c1bb6453383e', 7, 21, 'M', 0, 'SAN MATEO', '2003-06-12 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31469401', 'MARÍA JOSÉ	VIVAS RODRÍGUEZ', 'MARIAJOSEVIVASR@GMAIL.COM', '0424-3610453', 1, 'nuevo ingreso', 'sha256$vdnxEFx5mFky6mbw$77f1425322002173eed8b1d612a43517810f364bdcf7c35275b33d54eebcd150', 7, 20, 'F', 0, 'SUCRE, CAGUA', '2004-11-02 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30291842', 'DANIELA DEL VALLE	MARTINEZ HERNANDEZ', 'DANIELA.MARTINEZ1632004@GMAIL.COM', '0424-3311907', 1, 'nuevo ingreso', 'sha256$UmPhMLVm4Sf4EVbl$68a61b990a52266f13ba72f47afb19d97f7db6d8fefbb9c3faba744194e69c34', 7, 20, 'F', 0, 'SAN MATEO', '2004-03-16 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-31407711', 'ARIAMNY LUISANA	AGUILERA RODRIGUEZ', 'ARIANNYLAGUILERAR15@GMAIL.COM', '0424-3511147', 1, 'nuevo ingreso', 'sha256$XgLUTwNbfeyDNOx4$5d4e871c5c2508b843e60ec2dd4bdace81b472faae4aa79fa7f0b1c5f4441140', 7, 19, 'F', 0, 'SUCRE, CAGUA', '2005-02-09 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-14319901', 'EDGAR JOSE	REINA PARISCA', 'EDGARREINA33@GMAIL.COM', '0426-6337753', 1, 'nuevo ingreso', 'sha256$JNpvCU9yaMFmzM1L$9a8eba6ce424d627ea611dd1dc3bb4db794217af6af6f525f82d0f40574b6c9c', 3, 45, 'M', 0, 'GIRARDOT	JOAQUIN CRESPO', '1979-08-24 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-26484537', 'DIEGO LUIS	MARIN FUENTES', 'DIEGOSUP1011@GMAIL.COM', '0426-1997275', 1, 'nuevo ingreso', 'sha256$soPAM6Lx4iXKRCOu$f0ee33e2f9f352be4795d3683860077508d41bf3908be875e302757a96b33f0d', 3, 26, 'M', 0, 'SUCRE, CAGUA', '1998-11-10 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30090674', 'MICHAEL ELEAZAR	HERNANDEZ TERAN', 'MICHAELHDEZ23@GMAIL.COM', '0426-8954437', 1, 'nuevo ingreso', 'sha256$6k6178TUIk0n2zVu$5e4a146ed3c8c2e97aeba21bfb474bfd4f8d1ee7db45096e387319c211bdd3c8', 3, 21, 'M', 0, 'JOSE FELIX RIBAS	CASTOR NIEVES RIOS', '2003-07-03 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30147650', 'IVENS ANTONIO	LANDAEZ LANDAEZ', 'ANTONIOLANDAEZ27@GMAIL.COM', '0426-3424669', 1, 'nuevo ingreso', 'sha256$gx7DW7tFxioD8WDU$6f3abb39579331d083e1a67c352d528708a765e01d7b19a1c0739d1ec05ff051', 3, 21, 'M', 0, 'TURMERO', '2003-02-18 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30924161', 'GABRIEL ENRIQUE	YANEZ ZAMORA', 'YANEZGABRIELZAM5@GMAIL.COM', '0412-8853512', 1, 'nuevo ingreso', 'sha256$MniwNDRqpr9yIUGD$5ff568d587c04f5cf306be114a4d3df2df0688c32a79f1b1a7ebcf923369be2b', 3, 19, 'M', 0, 'TURMERO', '2004-12-16 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-23786262', 'JOSE JESUS	MIRELIS PEREZ', 'JESUS95MIRELISPEREZ@GMAIL.COM', '0412-7845101', 1, 'nuevo ingreso', 'sha256$RDAWdqC1xXPd1oZP$d17c12f219293fb92156ef90b472efc1e3512c72e38433c109d4ca68af0d53e3', 3, 32, 'M', 0, 'GIRARDOT	JOSE CASANOVA GODOY', '1995-11-11 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30596054', 'JOSE MIGUEL	MEDINA RODRIGUEZ', 'MEDINAJOSEMIGUELROD35@GMAIL.COM', '0412-2055642', 1, 'nuevo ingreso', 'sha256$VRPp59tOlKyR9y2Y$e35ae25c5b24e0a456d382dcf5a2bbd2c815dc80e6a2a96b7c7771081e593922', 3, 24, 'M', 0, 'SUCRE, CAGUA', '2000-01-26 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-30406816', 'KEYBEL STYVEN	CEDEÑO PEREZ', 'KEYBELCEDENOP78@GMAIL.COM', '0424-3462426', 1, 'nuevo ingreso', 'sha256$4cd0sm1p4EmRpUuO$55175c2f9a91b5196701824b76f6613a8f6930bb1f1f875da5736489087ff718', 3, 19, 'M', 0, 'SUCRE, CAGUA', '2004-07-15 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-27712263', 'JOSE MANUEL	LLOVERA URERA', 'JOSEM.LLOVERA04@GMAIL.COM', '0424-4173363', 1, 'nuevo ingreso', 'sha256$k0LaX9lyWQqPBtuL$b5349438a38baf7dbc9ace77fed5912f68534e3810859340513b4ae4b306ac23', 3, 24, 'M', 0, 'SANTA CRUZ', '2000-12-04 00:00:00');
INSERT INTO public.estudiantes (cedula, fullname, correo, telefono, semestre, estado, password, carrera, edad, sexo, promedio, direccion, fecha_nac) VALUES ('V-23423801', 'JOSE RAFAEL	ULLOA MACHADO', 'ULLOA.MACHADOJOSER56@GMAIL.COM', '0424-3080607', 1, 'nuevo ingreso', 'sha256$c03lkZ9hM5jGPsFi$cf2127c86196f061dd533e4db0b62de853a36b2e7a11a9b37903eec4104e4b2f', 3, 30, 'M', 0, 'SUCRE, CAGUA', '1994-12-06 00:00:00');


--
-- TOC entry 4989 (class 0 OID 16646)
-- Dependencies: 225
-- Data for Name: factura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.factura (id) VALUES (3);


--
-- TOC entry 4990 (class 0 OID 16649)
-- Dependencies: 226
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04AMA144', 'MATEMATICA', '', 4, 1, 4, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04EDF121', 'EDUCACION FISICA', '', 1, 2, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04ING132', 'INGLES I', '', 2, 2, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04INA143', 'INFORMATICA APLICADA', '', 3, 2, 2, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04HDD233', 'HISTORIA DEL DISEÑO', '', 3, 1, 3, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04IAD233', 'INTRODUCCIÓN AL DERECHO', '', 3, 1, 3, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04DIB243', 'DIBUJO I', '04DBI143', 3, 2, 2, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04ING222', 'INGLES II', '04ING132', 2, 1, 2, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04ELE222', 'ELECTIVA I-COREL DRAW/ ILLUSTRATOR', '04INA143', 2, 1, 1, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04EST322', 'ESTÉTICA', '04PSD233', 2, 1, 2, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04DSG343', 'DISEÑO GRÁFICO I', '04FDD244', 3, 2, 2, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04DIB343', 'DIBUJO II', '04DIB243', 3, 2, 2, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03LYC122', 'LENGUAJE Y COMUNICACIÓN', '', 2, 0, 2, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04DSG443', 'DISEÑO GRÁFICO II', '04DSG343', 3, 2, 2, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04PYM443', 'PUBLICIDAD Y MERCADEO', '04DIB343', 3, 2, 2, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04ELE422', 'ELECTIVA III-INDESIGN', '04ELE332', 2, 1, 1, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04AER433', 'AEROGRAFÍA II', '04AER333', 3, 2, 1, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04SER522', 'SERVICIO COMUNITARIO', '', 2, 1, 2, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04ELE522', 'ELECTIVA IV', '04ELE422', 2, 2, 1, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04FDI532', 'FOTOGRAFÍA DIGITAL', '', 2, 1, 2, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04SEM622', 'SEMINARIO', '', 2, 1, 2, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04DBI143', 'DIBUJO INSTRUMENTAL', '', 3, 2, 2, 1, 4, 'lunes', '02:00 AM', '01:00 AM', NULL, NULL, NULL, '2024-1', 'Presencial', 30, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04PAS600', 'PASANTÍAS', '', 0, 0, 0, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03TEI122', 'TÉCNICAS DE INVESTIGACIÓN', '', 2, 0, 2, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03EDF121', 'EDUCACIÓN FÍSICA', '', 1, 2, 0, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03EPA122', 'EDUC.Y PRESERVACIÓN DEL AMBIENTE', '', 2, 0, 2, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03IAD233', 'INTRODUCCIÓN AL DERECHO', '', 3, 0, 3, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ADM133', 'ADMINISTRACIÓN I', '', 3, 0, 3, 1, 7, 'martes', '03:00 PM', '04:00 PM', NULL, NULL, NULL, '2024-1', 'Presencial', 30, 'V-30555724');
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ING222', 'INGLES II', '031NG132', 2, 0, 2, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03CON344', 'CONTABILIDAD III', '03CON254', 4, 0, 4, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04DTD543', 'DISEÑO TRIDIMENSIONAL', '04DSG443', 3, 2, 2, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03AMA144', 'ANÁLISIS MATEMÁTICO I', '', 4, 0, 4, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04LYC122', 'LENGUAJE Y COMUNICACION', '', 2, 1, 2, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03COC443', 'CONTABILIDAD DE COSTOS I', '03CON344', 3, 2, 2, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ADP433', 'ADMINISTRACIÓN DE PERSONAL', '03ORM333', 3, 0, 3, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ESA433', 'ESTADÍSTICA APLICADA', '03ESG333', 3, 0, 3, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ADF433', 'ADMINISTRACIÓN FINANCIERA', '03MAF342', 3, 0, 3, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03APU533', 'ADMINISTRACIÓN PÚBLICA', '', 3, 0, 3, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03DEA533', 'DERECHO ADMINISTRATIVO', '03LEG332', 3, 0, 3, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07TEI122', 'TÉCNICAS DE INVESTIGACIÓN', '', 2, 0, 2, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07EDF121', 'EDUCACIÓN FÍSICA', '', 1, 2, 0, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('071NG132', 'INGLES I', '', 2, 2, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07AMA244', 'ANÁLISIS MATEMÁTICO II', '07AMA144', 4, 0, 4, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07CON254', 'CONTABILIDAD II', '07CON144', 4, 2, 3, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ADM233', 'ADMINISTRACIÓN II', '07ADM133', 3, 0, 3, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ADP433', 'ADMINISTRACIÓN DE PERSONAL', '07ORM333', 3, 0, 3, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07PAS600', 'PASANTÍAS PROFESIONALES', '', 0, 0, 0, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ADM233', 'ADMINISTRACIÓN II', '02ADM133', 3, 0, 3, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ING222', 'INGLES II', '021NG132', 2, 0, 2, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ECO332', 'ECONOMÍA II', '02ECO232', 2, 1, 2, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ORM333', 'ORGANIZACIÓN Y MÉTODOS', '02ADM233', 3, 0, 3, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02CCO622', 'CONTABILIDAD COMPUTARIZADA', '', 2, 0, 2, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ELE622', 'ELECTIVA', '', 2, 0, 2, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ING222', 'INGLES II', '01NG132', 2, 0, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ELE222', 'ELECTIVA I', '', 2, 0, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01PRD344', 'PROGRAMACIÓN II', '01PRU243', 4, 0, 4, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ELE322', 'ELECTIVA II', '01ELE222', 2, 0, 2, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ING132', 'INGLES I', '', 2, 2, 1, 1, 1, 'jueves', '12:15 PM', '01:45 PM', NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01INF132', 'INTRODUCCIÓN A LA INFORMÁTICA', '', 2, 2, 1, 1, 1, 'martes', '09:00 AM', '11:00 AM', NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01EDF121', 'EDUCACIÓN FÍSICA', '', 1, 2, 0, 1, 1, 'sabado', '08:00 AM', '10:00 AM', NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03INA243', 'INFORMÁTICA APLICADA', '', 3, 2, 2, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01SIN433', 'SISTEMAS DE INFORMACIÓN I', '01FSI354', 3, 0, 3, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01SOP454', 'SISTEMAS OPERATIVOS', '01OCO364', 3, 2, 2, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ELE422', 'ELECTIVA III', '01ELE322', 2, 0, 2, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01SIN543', 'SISTEMAS DE INFORMACIÓN II', '01SIN433', 3, 2, 2, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01REC564', 'REDES DE COMPUTADORAS', '01FRD422', 2, 4, 0, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01AUS533', 'AUDITORÍA DE SISTEMAS', '01SIN433', 3, 0, 3, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ELE522', 'ELECTIVA IV', '01ELE422', 2, 0, 2, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05AMA244', 'ANÁLISIS MATEMÁTICO II', '05AMA144', 4, 0, 4, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05ING222', 'INGLÉS II', '05ING132', 2, 0, 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05ITA233', 'INTRODUCCIÓN A LA TECNOLOGÍA DE ALIMENTOS', '', 3, 0, 3, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05MBG253', 'MICROBIOLOGÍA GENERAL', '', 3, 3, 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05INA243', 'INFORMÁTICA APLICADA', '', 3, 2, 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05QUI253', 'QUÍMICA II', '', 3, 3, 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05HSI343', 'HIGIENE Y SEGURIDAD INDUSTRIAL', '', 3, 2, 2, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05OPU343', 'OPERACIONES UNITARIAS', '05QUI253', 3, 2, 2, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05EMP433', 'EMPAQUE', '05ITA233', 3, 0, 3, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05MAI433', 'MANTENIMIENTO INDUSTRIAL', '05OPU343', 3, 0, 3, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05NUT533', 'NUTRICIÓN', '05QDA433', 3, 0, 3, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05PAS600', 'PASANTÍAS PROFESIONALES', '', 0, 0, 0, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02SEM622', 'SEMINARIO', '', 2, 0, 2, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06INF153', 'INTRODUCCIÓN  A LA INFORMÁTICA', '', 3, 3, 2, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06ING132', 'INGLES I', '', 2, 2, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06EPA122', 'EDUC.Y PRESERVACIÓN DEL AMBIENTE', '', 2, 0, 2, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06FIS143', 'FÍSICA', '', 3, 2, 2, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06ALG233', 'ALGEBRA', '', 3, 0, 3, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06AMA244', 'ANÁLISIS MATEMÁTICO II', '06AMA144', 4, 0, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06ING222', 'INGLES II', '06ING132', 2, 0, 2, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06CIE344', 'CIRCUITOS ELECTRÓNICOS I', '06RYC244', 4, 0, 4, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06CID344', 'CIRCUITOS DIGITALES', '06ALG233', 4, 0, 4, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06TCO344', 'TEORÍA DE COMUNICACIONES I', '06AMA244', 4, 0, 4, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06LCD352', 'LABORATORIO CIRCUITOS DIGITALES', '06ALG233', 2, 4, 1, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06SCO443', 'SISTEMA DE CONTROL', '06SYS333', 3, 2, 2, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06SER522', 'SERVICIO COMUNITARIO', '', 2, 0, 2, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06CMO622', 'COMUNICACIONES MÓVILES', '', 2, 2, 0, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06PASS600', 'PASANTÍAS PROFESIONALES', '', 0, 0, 0, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04TCO143', 'TEORIA DEL COLOR', '', 3, 2, 2, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04EPA122', 'EDUCACIÓN Y PRESERVACIÓN DEL AMBIENTE', '', 2, 1, 2, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04TEI122', 'TÉCNICAS DE INVESTIGACIÓN', '', 2, 1, 2, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04PSD233', 'PSICOLOGÍA DEL DISEÑO', '', 3, 1, 3, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04FDD244', 'FUNDAMENTOS DEL DISEÑO', '', 3, 1, 3, 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04SMT333', 'SEMIÓTICA', '04TEI122', 3, 1, 3, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04ELE332', 'ELECTIVA II - PHOTOSHOP', '04ELE222', 2, 2, 1, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04TIP333', 'TIPOGRAFÍA', '04HDD233', 3, 1, 3, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04AER333', 'AEROGRAFÍA I', '04DIB243', 3, 2, 1, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04IDG444', 'ILUSTRACIÓN DEL DISEÑO GRÁFICO', '', 4, 2, 2, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04DIP443', 'DIBUJO PUBLICITARIO', '04DIB343', 3, 2, 2, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04ILD543', 'ILUSTRACIÓN DIGITAL', '04DIP443', 3, 2, 2, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04DSG543', 'DISEÑO GRÁFICO III', '04DSG443', 3, 2, 2, 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04POR522', 'PORTAFOLIO', '', 2, 1, 2, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04ELE622', 'ELECTIVA V', '', 2, 1, 2, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04MAU622', 'MEDIOS AUDIOVISUALES', '', 2, 1, 2, 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('04PDI444', 'PROCESOS DE IMPRESIÓN', '04TIP333', 4, 1, 4, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ADM133', 'ADMINISTRACIÓN I', '', 3, 0, 3, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03CON144', 'CONTABILIDAD I', '', 4, 0, 4, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('031NG132', 'INGLES 1', '', 2, 2, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ADM233', 'ADMINISTRACIÓN II', '03ADM133', 3, 0, 3, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03AMA244', 'ANÁLISIS MATEMÁTICO II', '03AMA144', 3, 0, 3, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03CON254', 'CONTABILIDAD II', '03CON144', 4, 2, 3, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ECO232', 'ECONOMÍA I', '', 2, 1, 2, 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06ETI122', 'TÉCNICAS DE INVESTIGACIÓN', '', 2, 0, 2, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06RYC244', 'REDES Y CIRCUITOS ELÉCTRICOS', '06FIS143', 4, 0, 4, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06INS233', 'INSTRUMENTACIÓN', '', 3, 0, 3, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06SYS333', 'SEÑALES Y SISTEMAS', '06AMA244', 3, 0, 3, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ORM333', 'ORGANIZACIÓN Y MÉTODOS', '03ADM233', 3, 0, 3, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ESG333', 'ESTADÍSTICA GENERAL', '03AMA244', 3, 0, 3, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03LEG332', 'LEGISLACIÓN LABORAL', '03IAD233', 2, 0, 3, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03MAF342', 'MATEMÁTICA FINANCIERA', '', 2, 4, 0, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03IFI322', 'INSTITUCIONES FINANCIERAS', '', 2, 0, 2, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ECO332', 'ECONOMÍA II', '03ECO232', 3, 0, 3, 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03DTR432', 'DERECHO TRIBUTARIO', '03CON344', 2, 1, 2, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03AEF433', 'ANÁLISIS DE ESTADOS FINANCIEROS', '03MAF342', 3, 0, 3, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03COR433', 'COMPORTAMIENTO ORGANIZACIONAL', '03ORM333', 3, 0, 3, 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03MER533', 'MERCADOTECNIA', '03ECO332', 3, 0, 3, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03COC544', 'CONTABILIDAD DE COSTOS II', '03COC443', 4, 0, 4, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03AUC533', 'AUDITORÍA CONTABLE', '03COC443', 3, 0, 3, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03DME533', 'DERECHO MERCANTIL', '03LEG332', 3, 0, 3, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03SER522', 'SERVICIO COMUNITARIO', '', 2, 0, 2, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03PAS600', 'PASANTÍAS PROFESIONALES', '', 0, 0, 0, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03CCO622', 'CONTABILIDAD COMPUTARIZADA', '', 2, 0, 2, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03ELE622', 'ELECTIVA', '', 2, 0, 2, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('03SEM622', 'SEMINARIO', '', 2, 0, 2, 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ADM133', 'ADMINISTRACIÓN I', '', 3, 0, 3, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07AMA144', 'ANÁLISIS MATEMÁTICO I', '', 4, 0, 4, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07LYC122', 'LENGUAJE Y COMUNICACION', '', 2, 0, 2, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07CON144', 'CONTABILIDAD I', '', 4, 0, 4, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07EPA122', 'EDUC.Y PRESERVACIÓN DEL AMBIENTE', '', 2, 0, 2, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07IAD233', 'INTRODUCCIÓN AL DERECHO', '', 3, 0, 3, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07INA243', 'INFORMÁTICA APLICADA', '', 3, 2, 2, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ING222', 'INGLES II', '071NG132', 2, 0, 2, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ESG333', 'ESTADÍSTICA GENERAL', '07AMA244', 3, 0, 3, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07IFI322', 'INSTITUCIONES FINANCIERAS', '', 2, 0, 2, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ECO232', 'ECONOMÍA I', '', 2, 1, 2, 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ECO332', 'ECONOMÍA II', '07ECO232', 2, 1, 2, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07LEG332', 'LEGISLACIÓN LABORAL', '07IAD233', 2, 2, 1, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07CON344', 'CONTABILIDAD III', '07CON254', 4, 0, 4, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ORM333', 'ORGANIZACIÓN Y MÉTODOS', '07ADM233', 3, 0, 3, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07CBH443', 'CONTABILIDAD DE BANCA HIPOTECARIA', '07CON344', 3, 2, 2, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ESA433', 'ESTADÍSTICA APLICADA', '07ESG333', 3, 0, 3, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07DTR432', 'DERECHO TRIBUTARIO', '07CON344', 2, 1, 2, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ADF433', 'ADMINISTRACIÓN FINANCIERA', '07MAF342', 3, 0, 3, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07AEF433', 'ANÁLISIS DE ESTADOS FINANCIEROS', '07MAF342', 3, 0, 3, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07MAF342', 'MATEMÁTICA FINANCIERA', '', 2, 4, 0, 3, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07FEP422', 'FORMULACIÓN Y EVALUACIÓN DE PROYECTOS', '07ECO332', 2, 0, 2, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07PRE544', 'PRESUPUESTO', '07CON344', 4, 0, 4, 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07FNI522', 'FINANZAS INTERNACIONALES', '', 2, 0, 2, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ICF543', 'INSTRUMENTOS DE CAPTACIÓN FINANCIERA', '07ADF433', 3, 2, 2, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07AOR533', 'ANÁLISIS ORGANIZATIVO', '07ORM333', 3, 0, 3, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07AUB543', 'AUDITORÍA BANCARÍA', '07CBH443', 3, 0, 3, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07SER522', 'SERVICIO COMUNITARIO', '', 2, 0, 2, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07CDE543', 'CONTABILIDAD DEPARTAMENTAL', '07CBH443', 3, 2, 2, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07MDC522', 'MERCADO DE CAPITALES', '07ECO332', 0, 2, 2, 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07SEM622', 'SEMINARIO', '', 2, 0, 2, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07CCO622', 'CONTABILIDAD COMPUTARIZADA', '', 2, 0, 2, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('07ELE622', 'ELECTIVA', '', 2, 0, 2, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02LYC122', 'LENGUAJE Y COMUNICACION', '', 2, 0, 2, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02CON144', 'CONTABILIDAD I', '', 4, 0, 4, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02TEI122', 'TÉCNICAS DE INVESTIGACIÓN', '', 2, 0, 2, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02EDF121', 'EDUCACIÓN FÍSICA', '', 1, 2, 0, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('021NG132', 'INGLES I', '', 2, 2, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02AMA144', 'ANÁLISIS MATEMÁTICO I', '', 4, 0, 4, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02EPA122', 'EDUC.Y PRESERVACIÓN DEL AMBIENTE', '', 2, 0, 2, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02AMA244', 'ANÁLISIS MATEMÁTICO II', '02AMA144', 4, 0, 4, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02CON254', 'CONTABILIDAD II', '02CON144', 4, 2, 3, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02IAD233', 'INTRODUCCIÓN AL DERECHO', '', 3, 0, 3, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ECO232', 'ECONOMÍA I', '', 2, 1, 2, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02INA243', 'INFORMÁTICA APLICADA', '', 3, 2, 2, 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ESG333', 'ESTADÍSTICA GENERAL', '02AMA244', 3, 0, 3, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02MAF342', 'MATEMÁTICA FINANCIERA', '', 2, 4, 0, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02CON344', 'CONTABILIDAD III', '02CON254', 4, 0, 4, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02LEG332', 'LEGISLACIÓN LABORAL', '02IAD233', 2, 0, 3, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02IFI322', 'INSTITUCIONES FINANCIERAS', '', 2, 0, 2, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02COC443', 'CONTABILIDAD DE COSTOS I', '02CON344', 3, 2, 2, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02COR433', 'COMPORTAMIENTO ORGANIZACIONAL', '02ORM333', 3, 0, 3, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ESA433', 'ESTADÍSTICA APLICADA', '02ESG333', 3, 0, 3, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ADP433', 'ADMINISTRACIÓN DE PERSONAL', '02ORM333', 3, 0, 3, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02DTR432', 'DERECHO TRIBUTARIO', '02CON344', 2, 1, 2, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02AEF433', 'ANÁLISIS DE ESTADOS FINANCIEROS', '02MAF342', 3, 0, 3, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02ADF433', 'ADMINISTRACIÓN FINANCIERA', '02MAF342', 3, 0, 3, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02MER533', 'MERCADOTECNIA', '02ECO332', 3, 0, 3, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02PLA533', 'PLANIFICACIÓN DE EMPRESAS', '02ESA433', 3, 0, 3, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02AUC533', 'AUDITORÍA CONTABLE', '02COC443', 3, 0, 3, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02PRE544', 'PRESUPUESTO', '', 4, 0, 4, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02DME533', 'DERECHO MERCANTIL', '02LEG332', 3, 0, 3, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02SER522', 'SERVICIO COMUNITARIO', '', 2, 0, 2, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('02PAS600', 'PASANTÍAS PROFESIONALES', '', 0, 0, 0, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01IED232', 'INTRODUCCIÓN A LA ESTRUCTURA DE DATOS', '01AGM122 - 01INF132', 2, 2, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01AMA244', 'ANÁLISIS MATEMÁTICO II', '01AMA144', 4, 0, 4, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ORM233', 'ORGANIZACIÓN Y MÉTODOS', '', 3, 0, 3, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ADM133', 'ADMINISTRACIÓN I', '', 3, 0, 3, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01PRU243', 'PROGRAMACIÓN I', '01AGM122 - 01INF132', 3, 2, 2, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ESG333', 'ESTADÍSTICA GENERAL', '01AMA244', 3, 0, 3, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01PDD343', 'PROCESAMIENTO DE DATOS', '01IED232', 3, 2, 2, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01OCO364', 'ORGANIZACIÓN DEL COMPUTADOR', '01ALG122', 3, 2, 2, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ALG233', 'ÁLGEBRA', '', 3, 0, 3, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01FSI354', 'FUNDAMENTOS DE SISTEMAS', '', 3, 0, 3, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ETI122', 'TÉCNICAS DE INVESTIGACIÓN', '', 2, 0, 2, 1, 1, 'jueves', '02:00 PM', '04:00 PM', NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01AMA144', 'ANÁLISIS MATEMÁTICO I', '', 4, 0, 4, 1, 1, 'miercoles', '09:00 AM', '11:00 AM', NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01EPA122', 'EDUC.Y PRESERVACIÓN DEL AMBIENTE', '', 2, 0, 2, 1, 1, 'viernes', '09:00 AM', '11:00 AM', NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01AGM122', 'ALGORÍTMICA', '', 2, 0, 2, 1, 1, 'lunes', '03:15 PM', '05:15 PM', 'miercoles', '03:15 PM', '05:15 PM', '2024-1', 'Presencial', 5, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01FBD322', 'FUNDAMENTOS DE BASE DE DATOS', '01IED232', 2, 0, 2, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01BDD454', 'BASE DE DATOS', '01FBD322 - 01PDD343', 3, 2, 2, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ESA433', 'ESTADÍSTICA APLICADA', '01ESG333', 3, 0, 3, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01PRT443', 'PROGRAMACIÓN III', '01PRD344', 3, 2, 2, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01IDO543', 'INVESTIGACIÓN DE OPERACIONES', '01AMA244', 3, 2, 2, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01NDG544', 'NOCIONES DE DISEÑO GRÁFICO', '', 4, 0, 4, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01FDR422', 'FUNDAMENTOS DE REDES', '', 2, 0, 2, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01PRC544', 'PROGRAMACIÓN IV', '01PRT443', 4, 0, 4, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01SER522', 'SERVICIO COMUNITARIO', '', 0, 0, 2, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01PAS600', 'PASANTÍAS PROFESIONALES', '', 0, 0, 0, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01SEM622', 'SEMINARIO', '', 2, 0, 2, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01ELE622', 'ELECTIVA V', '', 2, 0, 2, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01OPT622', 'TELEINFORMÁTICA', '', 2, 0, 2, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05EPA122', 'EDUC.Y PRESERVACIÓN DEL AMBIENTE', '', 2, 0, 2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05AMA144', 'ANÁLISIS MATEMÁTICO I', '', 4, 0, 4, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05ING132', 'INGLES I', '', 2, 2, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05BIO143', 'BIOLOGÍA', '', 3, 2, 2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05LYC122', 'LENGUAJE Y COMUNICACION', '', 2, 0, 2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05FIS143', 'FÍSICA', '', 3, 2, 2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05TEI122', 'TÉCNICAS DE INVESTIGACIÓN', '', 2, 0, 2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05QUI153', 'QUÍMICA I', '', 3, 3, 2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05QOR253', 'QUÍMICA ORGÁNICA', '05QUI153', 3, 3, 2, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05ESG333', 'ESTADÍSTICA GENERAL', '05AMA244', 3, 0, 3, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05ANI353', 'ANÁLISIS INSTRUMENTAL', '05QUI253', 3, 3, 2, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05MBA353', 'MICROBIOLOGÍA DE ALIMENTOS', '05MBG253', 3, 3, 2, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05BQD333', 'BIOQUÍMICA GENERAL', '05QOR253', 3, 0, 3, 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05ESA433', 'ESTADÍSTICA APLICADA', '05ESG333', 3, 0, 3, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05ASC433', 'ASEGURAMIENTO DE CALIDAD', '05ESG333', 3, 0, 3, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05ANA453', 'ANÁLISIS DE ALIMENTOS', '05ANI353', 3, 3, 2, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05QDA433', 'QUÍMICA DE ALIMENTOS', '', 3, 0, 3, 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05TER564', 'TECNOLOGÍA DE CARNES', '05ANA453 - 05MBA353', 4, 4, 2, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05TVF564', 'TECNOLOGÍA DE FRUTAS Y VEGETALES', '05MBA353 - 05ANA453', 4, 4, 2, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05TEL564', 'TECNOLOGÍA DE LÁCTEOS', '05ANA453 - 05MBA353', 4, 4, 2, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05TEC564', 'TECNOLOGÍA DE CEREALES', '05ANA453 - 05MBA353', 4, 4, 2, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05SER522', 'SERVICIO COMUNITARIO', '', 2, 2, 2, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05VNA622', 'VALOR NUTRITIVO DE LOS ALIMENTOS', '', 2, 0, 2, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05ELE622', 'ELECTIVA', '', 2, 0, 2, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('05SEM622', 'SEMINARIO', '', 2, 0, 2, 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06AMA144', 'ANÁLISIS MATEMÁTICO I', '', 4, 0, 4, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06LYC122', 'LENGUAJE Y COMUNICACION', '', 2, 0, 2, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06EDF121', 'EDUCACIÓN FÍSICA', '', 1, 2, 0, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06LCE352', 'LABORATORIO CIRCUITOS ELÉCTRICOS I', '06RYC244 - 06LCE232', 2, 4, 1, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06LCE232', 'LABORATORIO CIRCUITOS ELÉCTRICOS', '06FIS143', 2, 2, 1, 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06CIE444', 'CIRCUITOS ELECTRÓNICOS II', '06CIE344', 4, 0, 4, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06LCE452', 'LABORATORIO CIRCUITOS ELECTRÓNICOS II', '06LCE352', 2, 4, 1, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06TCO444', 'TEORÍA DE COMUNICACIÓN II', '06TCO344', 4, 0, 4, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06MIC444', 'MICROPROCESADORES', '06CID344', 4, 0, 4, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06LMC452', 'LAB.MICROPROCESADORES', '06CID344', 2, 4, 1, 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06SDC544', 'SISTEMA DE COMUNICACIÓN', '06TCO444', 4, 0, 4, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06LSC532', 'LABORATORIO SISTEMAS DE COMUNICACIONES', '06TCO444', 2, 2, 1, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06CIE563', 'CIRCUITOS ELECTRÓNICOS III', '06CIE444', 3, 4, 2, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06RDA563', 'REDES DE DATOS', '06MIC444', 3, 4, 2, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06TLV543', 'TELEVISIÓN', '06LMC452', 3, 2, 2, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06RTF543', 'REDES TELEFÓNICAS', '06TCO444', 3, 2, 2, 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06SEM622', 'SEMINARIO', '', 2, 0, 2, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('06ELE622', 'ELECTIVA', '', 2, 0, 2, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01LYC122', 'LENGUAJE Y COMUNICACION', '', 2, 0, 2, 1, 1, 'miercoles', '03:15 PM', '05:15 PM', NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);
INSERT INTO public.materias (id, nombre, prelacion, unidad_credito, hp, ht, semestre, id_carrera, dia, hora_inicio, hora_fin, dia2, hora_inicio2, hora_fin2, ciclo, modalidad, maximo, id_docente) VALUES ('01COG164', 'CONTABILIDAD GENERAL', '', 4, 4, 2, 1, 1, 'jueves', '09:00 AM', '12:00 PM', NULL, NULL, NULL, '2024-1', 'Presencial', 25, NULL);


--
-- TOC entry 4991 (class 0 OID 16654)
-- Dependencies: 227
-- Data for Name: materias_estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.materias_estudiantes (id, cod_materia, cedula_estudiante, nota1, nota2, nota3, promedio, uc, ciclo) VALUES (98, '02ADM133', 'V-10459189', 0, 0, 0, 0, 0, '2024-1');


--
-- TOC entry 4993 (class 0 OID 16660)
-- Dependencies: 229
-- Data for Name: metodo_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.metodo_pago (id, nombre, descripcion) VALUES (92, 'Transferencia', 'pre_inscripcion');
INSERT INTO public.metodo_pago (id, nombre, descripcion) VALUES (93, 'Efectivo', 'inscripcion');


--
-- TOC entry 4995 (class 0 OID 16664)
-- Dependencies: 231
-- Data for Name: montos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.montos (id, concepto, monto) VALUES (92, 'pre_inscripcion', 1250);
INSERT INTO public.montos (id, concepto, monto) VALUES (93, 'inscripcion', 35);


--
-- TOC entry 4997 (class 0 OID 16670)
-- Dependencies: 233
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pagos (id, cedula_estudiante, metodo_pago_id, monto_id, fecha_pago, referencia_transferencias, ciclo) VALUES (75, 'V-10459189', 92, 92, '2024-11-25 00:00:00', 29, '2024-1');
INSERT INTO public.pagos (id, cedula_estudiante, metodo_pago_id, monto_id, fecha_pago, referencia_transferencias, ciclo) VALUES (76, 'V-10459189', 93, 93, '2024-11-25 00:00:00', NULL, '2024-1');


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

INSERT INTO public.seguridad (id, administracion, control_estudio) VALUES (1, 'Pascal12345*', 'Pascal12345*');


--
-- TOC entry 5001 (class 0 OID 16680)
-- Dependencies: 237
-- Data for Name: superusuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.superusuario (cedula, fullname, correo, password) VALUES ('V-12345', 'admin', 'admin@pascal.com', 'sha256$yfIZAnwaRcy1E9bs$407d8434ea7fb64df4e15509835d120b7b8a1e8de9615c9a4b61416b3851daef');


--
-- TOC entry 5002 (class 0 OID 16683)
-- Dependencies: 238
-- Data for Name: transferencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transferencias (id, codigo_referencia) VALUES (29, '78945');


--
-- TOC entry 5004 (class 0 OID 16687)
-- Dependencies: 240
-- Data for Name: trazabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2291, 'Registrar usuario: caja_pascal, nombre: Caja', 'caja_pascal', '2024-08-21 21:29:39.805306', 'Usuarios', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2292, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-08-21 21:39:56.992677', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2293, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-08-22 21:06:09.653778', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2294, 'Obtener Carreras', 'Caja', '2024-08-22 21:06:12.463373', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2295, 'Obtener todos los estudiantes', 'Caja', '2024-08-22 21:06:12.474797', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2296, 'Obtener todos los estudiantes', 'Caja', '2024-08-22 21:06:14.047954', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2297, 'Obtener Carreras', 'Caja', '2024-08-22 21:06:14.144496', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2298, 'Obtener todos los estudiantes', 'Caja', '2024-08-22 21:06:14.348352', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2299, 'Obtener Carreras', 'Caja', '2024-08-22 21:06:14.348352', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2300, 'Obtener Carreras', 'Caja', '2024-08-22 21:06:29.384657', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2301, 'Obtener todos los estudiantes', 'Caja', '2024-08-22 21:06:29.384657', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2302, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-08-22 21:41:07.397693', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2303, 'Actualizar contraseña del super usuario: admin', 'admin', '2024-08-22 21:41:40.491405', 'Supervisión', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2304, 'Obtener todo el Control', 'admin', '2024-08-22 21:41:57.083759', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2305, 'Obtener Coordinadores', 'admin', '2024-08-22 21:41:59.9672', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2306, 'Obtener Coordinadores', 'admin', '2024-08-22 21:42:19.639355', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2307, 'Obtener Coordinadores', 'admin', '2024-08-22 21:42:22.690865', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2308, 'Añadir Coordinador con cédula: V-12345678, nombre: Usuario coordinador', 'admin', '2024-08-22 21:43:08.903862', 'Coordinacion', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2309, 'Obtener Coordinadores', 'admin', '2024-08-22 21:43:09.130647', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2310, 'Obtener todo el Control', 'admin', '2024-08-22 21:43:18.238235', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2311, 'Añadir Control con cédula: V-45678910, nombre: Usuario control de estudio', 'admin', '2024-08-22 21:43:59.133277', 'Control de estudios', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2312, 'Obtener todo el Control', 'admin', '2024-08-22 21:43:59.348223', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2313, 'Obtener Carreras', 'admin', '2024-08-22 21:44:28.870674', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2314, 'Obtener Coordinadores', 'admin', '2024-08-22 21:44:38.592767', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2315, 'Actualizar Coordinador con cédula: V-12345678, nombre: Usuario coordinador', 'admin', '2024-08-22 21:44:45.9769', 'Coordinacion', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2316, 'Obtener Coordinadores', 'admin', '2024-08-22 21:44:46.191234', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2317, 'Obtener Coordinadores', 'admin', '2024-08-22 21:44:49.636165', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2318, 'Obtener todo el Control', 'admin', '2024-08-22 21:44:52.033947', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2319, 'Actualizar Control con cédula: V-45678910, nombre: Usuario control de estudio', 'admin', '2024-08-22 21:44:57.464476', 'Control de estudios', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2320, 'Obtener todo el Control', 'admin', '2024-08-22 21:44:57.677851', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2321, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-22 21:45:32.635007', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2322, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:46:07.063075', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2323, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:46:08.73767', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2324, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:46:09.242766', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2325, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:46:20.520547', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2326, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:46:22.988917', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2327, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:46:23.091661', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2328, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:46:23.192915', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2329, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:51:34.587119', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2330, 'Añadir Docente con cédula: V-29890437, nombre: elibeth curalli', 'Usuario coordinador', '2024-08-22 21:52:05.543166', 'Docentes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2331, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:52:05.765846', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2332, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:52:10.023977', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2333, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:52:10.133725', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2334, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:52:10.227456', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2335, 'Añadir Materia con id: 04DBI143, nombre: DIBUJO INSTRUMENTAL', 'Usuario coordinador', '2024-08-22 21:52:48.052004', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2336, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:52:48.292286', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2337, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:52:48.403911', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2338, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:52:48.509096', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2339, 'Añadir Materia con id: 04AMA144, nombre: MATEMATICA', 'Usuario coordinador', '2024-08-22 21:54:08.150083', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2340, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:54:08.352453', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2341, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:54:08.467828', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2342, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:54:08.556211', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2343, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:54:33.213936', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2344, 'Añadir Docente con cédula: V-30555724, nombre: Henrry bourgeot', 'Usuario coordinador', '2024-08-22 21:54:53.190148', 'Docentes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2345, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:54:53.404482', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2346, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:55:02.383335', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2347, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:55:02.472631', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2348, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:55:02.58198', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2349, 'Añadir Materia con id: 04LYC122, nombre: LENGUAJE Y COMUNICACION', 'Usuario coordinador', '2024-08-22 21:56:48.28321', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2350, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:56:48.513874', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2351, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:56:48.617281', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2352, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:56:48.834088', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2353, 'Añadir Materia con id: 04TCO143, nombre: TEORIA DEL COLOR', 'Usuario coordinador', '2024-08-22 21:57:49.016371', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2354, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:57:49.229642', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2355, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:57:49.343302', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2356, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:57:49.449181', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2357, 'Añadir Materia con id: 04EDF121, nombre: EDUCACION FISICA', 'Usuario coordinador', '2024-08-22 21:58:40.165773', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2358, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:58:40.389472', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2359, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:58:40.497984', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2360, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:58:40.60317', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2361, 'Añadir Materia con id: 04ING132, nombre: INGLES I', 'Usuario coordinador', '2024-08-22 21:59:25.557843', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2362, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 21:59:25.771565', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2363, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 21:59:25.865265', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2364, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 21:59:25.982079', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2365, 'Añadir Materia con id: 04INA143, nombre: INFORMATICA APLICADA', 'Usuario coordinador', '2024-08-22 22:00:05.891798', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2366, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:00:06.266365', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2367, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:00:06.373653', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2368, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:00:06.483511', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2369, 'Añadir Materia con id: 04EPA122, nombre: EDUCACIÓN Y PRESERVACIÓN DEL AMBIENTE', 'Usuario coordinador', '2024-08-22 22:01:02.389665', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2370, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:01:02.624748', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2371, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:01:02.731106', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2372, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:01:02.839773', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2373, 'Añadir Materia con id: 04TEI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-08-22 22:02:00.477614', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2374, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:02:00.692565', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2375, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:02:00.80271', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2376, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:02:00.906693', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2377, 'Añadir Materia con id: 04PSD233, nombre: PSICOLOGÍA DEL DISEÑO', 'Usuario coordinador', '2024-08-22 22:03:08.356584', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2378, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:03:08.555659', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2379, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:03:08.665431', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2380, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:03:08.774791', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2381, 'Añadir Materia con id: 04HDD233, nombre: HISTORIA DEL DISEÑO', 'Usuario coordinador', '2024-08-22 22:04:02.503055', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2382, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:04:02.714484', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2383, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:04:02.838425', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2384, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:04:02.940662', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2385, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:04:11.562818', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2386, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:04:15.331105', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2387, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:04:15.440216', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2388, 'Obtener Materia con id: 04PSD233', 'Usuario coordinador', '2024-08-22 22:04:20.630138', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2389, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:04:24.219582', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2390, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:05:22.302274', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2391, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:05:26.105095', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2392, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:05:26.215677', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2393, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:05:33.613096', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2394, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:05:33.720544', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2395, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:05:33.835152', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2396, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:05:38.969653', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2397, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:05:42.147448', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2398, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:05:42.266908', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2399, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:05:45.488167', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2400, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:05:45.594805', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2401, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:05:45.707859', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2402, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:06:06.738326', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2403, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:06:16.500009', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2404, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:06:16.614423', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2405, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:06:16.726453', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2406, 'Añadir Materia con id: 04FDD244, nombre: FUNDAMENTOS DEL DISEÑO', 'Usuario coordinador', '2024-08-22 22:07:18.510121', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2407, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:07:18.743044', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2408, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:07:18.853649', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2409, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:07:18.965999', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2410, 'Añadir Materia con id: 04IAD233, nombre: INTRODUCCIÓN AL DERECHO', 'Usuario coordinador', '2024-08-22 22:08:30.239869', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2411, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:08:30.449921', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2412, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:08:30.543642', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2413, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:08:30.653018', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2414, 'Añadir Materia con id: 04DIB243, nombre: DIBUJO I', 'Usuario coordinador', '2024-08-22 22:09:42.29329', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2415, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:09:42.502762', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2416, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:09:42.612088', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2417, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:09:42.706199', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2418, 'Añadir Materia con id: 04ING222, nombre: INGLES II', 'Usuario coordinador', '2024-08-22 22:10:39.624785', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2419, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:10:39.833404', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2420, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:10:39.940003', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2421, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:10:40.033762', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2422, 'Añadir Materia con id: 04ELE222, nombre: ELECTIVA I-COREL DRAW/ ILLUSTRATOR', 'Usuario coordinador', '2024-08-22 22:12:01.657271', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2423, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:12:01.867679', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2424, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:12:01.961408', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2425, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:12:02.055151', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2426, 'Añadir Materia con id: 04EST322, nombre: ESTÉTICA', 'Usuario coordinador', '2024-08-22 22:14:03.91795', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2427, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:14:04.146195', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2428, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:14:04.255538', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2429, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:14:04.349266', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2430, 'Añadir Materia con id: 04SMT333, nombre: SEMIÓTICA', 'Usuario coordinador', '2024-08-22 22:15:38.005917', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2431, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:15:38.236438', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2432, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:15:38.330637', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2433, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:15:38.439959', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2434, 'Añadir Materia con id: 04DSG343, nombre: DISEÑO GRÁFICO I', 'Usuario coordinador', '2024-08-22 22:17:04.573496', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2435, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:17:04.810533', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2436, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:17:04.919883', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2437, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:17:05.023258', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2438, 'Añadir Materia con id: 04DIB343, nombre: DIBUJO II', 'Usuario coordinador', '2024-08-22 22:17:57.192368', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2439, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:17:57.560995', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2440, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:17:57.665942', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2441, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:17:57.779467', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2442, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:18:02.026209', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2443, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:18:04.552845', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2444, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:18:04.677859', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2445, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:18:21.194987', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2446, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:18:21.293225', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2447, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:18:21.413639', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2448, 'Añadir Materia con id: 04ELE332, nombre: ELECTIVA II - PHOTOSHOP', 'Usuario coordinador', '2024-08-22 22:19:35.797206', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2449, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:19:36.037954', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2450, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:19:36.152849', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2451, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:19:36.265939', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2452, 'Añadir Materia con id: 04TIP333, nombre: TIPOGRAFÍA', 'Usuario coordinador', '2024-08-22 22:21:00.593088', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2453, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:21:00.800744', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2454, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:21:00.910089', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2455, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:21:01.019415', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2456, 'Añadir Materia con id: 04AER333, nombre: AEROGRAFÍA I', 'Usuario coordinador', '2024-08-22 22:22:30.993558', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2457, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:22:31.216304', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2458, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:22:31.335337', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2459, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:22:31.447475', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2460, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:24:59.55055', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2461, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:25:02.438376', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2462, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:25:02.561872', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2463, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:28:33.159502', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2464, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:28:35.862809', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2465, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:28:35.984125', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2466, 'Añadir Materia con id: 04PDI444, nombre: PROCESOS DE IMPRESIÓN', 'Usuario coordinador', '2024-08-22 22:29:01.418759', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2467, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:29:01.624502', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2468, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:29:01.718208', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2469, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:29:01.827662', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2470, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:29:07.167098', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2471, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:29:10.779686', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2472, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:29:10.902433', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2473, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:29:15.655994', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2474, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:29:15.770384', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2475, 'Obtener Materia con id: 04PDI444', 'Usuario coordinador', '2024-08-22 22:29:20.162098', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2476, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:29:23.266492', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2477, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:29:23.389006', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2478, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:29:23.497206', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2479, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:29:59.761164', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2480, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:29:59.880166', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2481, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:29:59.976135', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2482, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:30:31.624393', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2483, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:30:34.968096', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2484, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:30:35.086546', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2485, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:30:38.841199', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2486, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:30:38.966424', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2487, 'Obtener Materia con id: 04PDI444', 'Usuario coordinador', '2024-08-22 22:30:42.013094', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2488, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:30:44.600119', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2489, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:30:44.711812', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2490, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:30:44.823925', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2491, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:31:04.366514', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2492, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:31:04.484534', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2493, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:31:04.584877', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2494, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:31:21.644874', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2495, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:31:30.776149', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2496, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:31:30.895857', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2497, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:31:30.9893', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2498, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:31:36.684181', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2499, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:31:39.607833', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2500, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:31:39.707861', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2501, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:31:44.127735', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2502, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:31:44.238885', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2503, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:31:44.352489', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2504, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:31:49.475981', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2505, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:31:49.586127', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2506, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:31:49.683545', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2507, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:31:58.53929', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2508, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:31:58.674122', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2509, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:31:58.780312', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2510, 'Obtener Docentes', 'Usuario coordinador', '2024-08-22 22:32:11.427904', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2511, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-22 22:32:11.525741', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2512, 'Obtener Carreras', 'Usuario coordinador', '2024-08-22 22:32:11.639143', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2513, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-23 19:30:20.231954', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2514, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:30:43.545071', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2515, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:30:43.654926', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2516, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:30:43.752414', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2517, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:34:19.392285', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2518, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:34:21.449095', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2519, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:34:21.548067', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2520, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:34:21.790646', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2521, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:34:41.71643', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2522, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:34:43.638441', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2523, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:34:43.748008', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2524, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:34:43.84514', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2525, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:37:30.909754', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2526, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:37:31.021255', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2527, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:37:31.126485', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2528, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:37:46.885694', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2529, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:37:46.998906', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2530, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:37:47.107191', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2531, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:41:09.204153', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2532, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:41:12.330675', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2533, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:41:12.437857', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2534, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:41:15.402612', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2535, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:41:16.986353', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2536, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:41:17.105081', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2537, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:41:17.214405', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2538, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:41:23.423961', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2539, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:41:23.54502', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2540, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:41:23.646344', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2541, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:41:31.940792', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2542, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:42:10.377503', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2543, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:42:10.488232', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2544, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:42:34.957337', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2545, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:42:38.029974', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2546, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:42:38.147442', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2547, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:42:43.467602', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2548, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:42:43.613733', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2549, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:42:49.948943', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2550, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:42:50.047717', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2551, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:42:50.13903', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2552, 'Añadir Materia con id: 04IDG444, nombre: ILUSTRACIÓN DEL DISEÑO GRÁFICO', 'Usuario coordinador', '2024-08-23 19:44:02.023475', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2553, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:44:02.232027', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2554, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:44:02.328995', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2555, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:44:02.424314', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2556, 'Añadir Materia con id: 04DSG443, nombre: DISEÑO GRÁFICO II', 'Usuario coordinador', '2024-08-23 19:45:35.452967', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2557, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:45:35.662268', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2558, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:45:35.763638', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2559, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:45:35.859989', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2560, 'Añadir Materia con id: 04PYM443, nombre: PUBLICIDAD Y MERCADEO', 'Usuario coordinador', '2024-08-23 19:47:19.301836', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2561, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:47:19.510114', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2562, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:47:19.610351', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2563, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:47:19.710533', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2564, 'Añadir Materia con id: 04ELE422, nombre: ELECTIVA III-INDESIGN', 'Usuario coordinador', '2024-08-23 19:49:41.359705', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2565, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:49:41.566982', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2566, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:49:41.665517', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2567, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:49:41.762021', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2568, 'Añadir Materia con id: 04AER433, nombre: AEROGRAFÍA II', 'Usuario coordinador', '2024-08-23 19:51:04.384002', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2569, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:51:04.603101', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2570, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:51:04.705345', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2571, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:51:04.914936', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2572, 'Añadir Materia con id: 04DIP443, nombre: DIBUJO PUBLICITARIO', 'Usuario coordinador', '2024-08-23 19:52:18.457233', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2573, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:52:18.665508', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2574, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:52:18.765271', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2575, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:52:18.86418', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2576, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:54:24.723846', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2577, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:54:26.778868', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2578, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:54:26.89401', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2579, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:54:55.471188', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2580, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:54:55.584497', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2581, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:54:55.679611', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2582, 'Añadir Materia con id: 04SER522, nombre: SERVICIO COMUNITARIO', 'Usuario coordinador', '2024-08-23 19:56:08.279724', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2583, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:56:08.486655', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2584, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:56:08.588033', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2585, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:56:08.690921', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2586, 'Añadir Materia con id: 04ILD543, nombre: ILUSTRACIÓN DIGITAL', 'Usuario coordinador', '2024-08-23 19:58:21.590429', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2587, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:58:21.794003', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2588, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:58:21.891997', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2589, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:58:21.990173', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2590, 'Añadir Materia con id: 04DSG543, nombre: DISEÑO GRÁFICO III', 'Usuario coordinador', '2024-08-23 19:59:28.301865', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2591, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 19:59:28.631039', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2592, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 19:59:28.739236', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2593, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 19:59:28.843642', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2594, 'Añadir Materia con id: 04ELE522, nombre: ELECTIVA IV', 'Usuario coordinador', '2024-08-23 20:01:33.704404', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2595, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:01:33.911802', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2596, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:01:34.012301', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2597, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:01:34.115082', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2598, 'Añadir Materia con id: 04FDI532, nombre: FOTOGRAFÍA DIGITAL', 'Usuario coordinador', '2024-08-23 20:02:25.805424', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2599, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:02:26.064116', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2600, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:02:26.164114', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2601, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:02:26.26513', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2602, 'Añadir Materia con id: 04DTD543, nombre: DISEÑO TRIDIMENSIONAL', 'Usuario coordinador', '2024-08-23 20:03:26.967618', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2603, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:03:27.177459', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2604, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:03:27.408766', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2605, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:03:27.51043', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2606, 'Añadir Materia con id: 04POR522, nombre: PORTAFOLIO', 'Usuario coordinador', '2024-08-23 20:04:08.766075', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2607, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:04:08.971642', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2608, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:04:09.071904', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2609, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:04:09.171118', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2610, 'Añadir Materia con id: 04PAS600, nombre: PASANTÍAS', 'Usuario coordinador', '2024-08-23 20:05:21.49082', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2611, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:05:21.702783', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2612, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:05:21.801993', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2613, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:05:21.90029', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2614, 'Añadir Materia con id: 04ELE622, nombre: ELECTIVA V', 'Usuario coordinador', '2024-08-23 20:05:57.767872', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2615, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:05:57.971332', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2616, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:05:58.071432', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2617, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:05:58.315585', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2618, 'Añadir Materia con id: 04MAU622, nombre: MEDIOS AUDIOVISUALES', 'Usuario coordinador', '2024-08-23 20:07:14.418916', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2619, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:07:14.624944', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2620, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:07:14.72745', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2621, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:07:14.827859', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2622, 'Añadir Materia con id: 04SEM622, nombre: SEMINARIO', 'Usuario coordinador', '2024-08-23 20:07:41.201465', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2623, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:07:41.405974', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2624, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:07:41.505492', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2625, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:07:41.604455', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2626, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:30:58.090216', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2627, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:31:00.473345', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2628, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:31:00.588536', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2629, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:31:05.096005', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2630, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:31:05.211151', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2631, 'Obtener Materia con id: 04TEI122', 'Usuario coordinador', '2024-08-23 20:31:07.652011', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2632, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:31:11.582311', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2633, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:31:11.680511', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2634, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:31:11.782799', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2635, 'Actualizar Materia con id: 04DBI143, nombre: DIBUJO INSTRUMENTAL', 'Usuario coordinador', '2024-08-23 20:32:53.74918', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2636, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:32:54.073957', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2637, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:32:54.074954', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2638, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:32:54.186175', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2639, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:32:54.196152', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2640, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:32:54.302385', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2641, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:32:54.311882', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2642, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:37:05.734456', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2643, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:37:05.860291', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2644, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:37:05.969527', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2645, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:39:53.915122', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2646, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:39:54.075275', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2647, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:39:54.284691', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2648, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:44:22.257313', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2649, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:44:22.405442', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2650, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:44:22.64055', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2651, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:44:44.895203', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2652, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:44:45.011881', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2653, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:44:45.124129', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2654, 'Actualizar Materia con id: 04PAS600, nombre: PASANTÍAS', 'Usuario coordinador', '2024-08-23 20:46:26.62295', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2655, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:46:26.935887', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2656, 'Obtener Docentes', 'Usuario coordinador', '2024-08-23 20:46:26.938879', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2657, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:46:27.121549', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2658, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-23 20:46:27.133489', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2659, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:46:27.261071', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2660, 'Obtener Carreras', 'Usuario coordinador', '2024-08-23 20:46:27.273041', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2661, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-24 21:50:04.105096', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2662, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 21:50:28.077744', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2663, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 21:50:30.061879', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2664, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:50:30.725517', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2665, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 21:50:41.113504', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2666, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 21:50:41.230752', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2667, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:50:41.329102', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2668, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:50:44.583184', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2669, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 21:50:46.807529', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2670, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 21:50:46.912256', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2671, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:50:47.018405', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2672, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 21:52:28.064405', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2673, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 21:52:29.138803', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2674, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:52:30.707435', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2675, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 21:52:50.36851', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2676, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 21:52:50.639364', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2677, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:52:51.046293', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2678, 'Actualizar Materia con id: 04PDI444, nombre: PROCESOS DE IMPRESIÓN', 'Usuario coordinador', '2024-08-24 21:53:22.149264', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2679, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 21:53:22.512095', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2680, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 21:53:22.526057', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2681, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 21:53:22.785409', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2682, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 21:53:22.786406', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2683, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:53:22.973974', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2684, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:53:22.980956', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2685, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 21:57:21.983974', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2686, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 21:57:22.081417', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2687, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:57:22.184101', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2688, 'Añadir Materia con id: 03ADM133, nombre: ADMINISTRACIÓN I', 'Usuario coordinador', '2024-08-24 21:59:27.111609', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2689, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 21:59:27.331433', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2690, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 21:59:27.6064', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2691, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 21:59:27.713756', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2692, 'Añadir Materia con id: 03AMA144, nombre: ANÁLISIS MATEMÁTICO I', 'Usuario coordinador', '2024-08-24 22:00:28.103233', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2693, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:00:28.310821', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2694, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:00:28.411775', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2695, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:00:28.510617', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2696, 'Añadir Materia con id: 03LYC122, nombre: LENGUAJE Y COMUNICACIÓN', 'Usuario coordinador', '2024-08-24 22:01:29.061745', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2697, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:01:29.279086', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2698, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:01:29.388776', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2699, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:01:29.503407', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2700, 'Añadir Materia con id: 03CON144, nombre: CONTABILIDAD I', 'Usuario coordinador', '2024-08-24 22:02:04.703062', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2701, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:02:04.932097', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2702, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:02:05.054747', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2703, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:02:05.166967', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2704, 'Añadir Materia con id: 03TEI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-08-24 22:03:27.80319', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2705, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:03:28.169652', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2706, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:03:28.26896', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2707, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:03:28.365544', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2708, 'Añadir Materia con id: 03EDF121, nombre: EDUCACIÓN FÍSICA', 'Usuario coordinador', '2024-08-24 22:04:21.553135', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2709, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:04:21.770984', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2710, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:04:21.983339', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2711, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:04:22.090942', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2712, 'Añadir Materia con id: 031NG132, nombre: INGLES 1', 'Usuario coordinador', '2024-08-24 22:05:43.890766', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2713, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:05:44.116375', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2714, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:05:44.22977', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2715, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:05:44.342607', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2716, 'Añadir Materia con id: 03EPA122, nombre: EDUC.Y PRESERVACIÓN DEL AMBIENTE', 'Usuario coordinador', '2024-08-24 22:06:33.896187', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2717, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:06:34.112799', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2718, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:06:34.22288', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2719, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:06:34.325687', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2720, 'Añadir Materia con id: 03ADM233, nombre: ADMINISTRACIÓN II', 'Usuario coordinador', '2024-08-24 22:07:28.568511', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2721, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:07:28.782929', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2722, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:07:28.890119', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2723, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:07:29.00406', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2724, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:09:22.108182', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2725, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:09:26.325832', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2726, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:09:26.440787', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2727, 'Obtener Materia con id: 03ADM233', 'Usuario coordinador', '2024-08-24 22:09:28.839463', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2728, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:09:31.858166', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2729, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:09:31.970325', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2730, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:09:32.081501', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2731, 'Actualizar Materia con id: 03ADM233, nombre: ADMINISTRACIÓN II', 'Usuario coordinador', '2024-08-24 22:09:51.314359', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2732, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:09:51.63404', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2733, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:09:51.639031', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2734, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:09:51.751247', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2735, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:09:51.762218', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2736, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:09:51.871153', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2737, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:09:51.884118', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2738, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:09:53.682152', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2739, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:09:57.806709', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2740, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:09:58.026871', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2741, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:09:58.135523', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2816, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:55:22.44813', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2742, 'Añadir Materia con id: 03AMA244, nombre: ANÁLISIS MATEMÁTICO II', 'Usuario coordinador', '2024-08-24 22:11:18.894612', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2743, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:11:19.104024', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2744, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:11:19.205266', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2745, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:11:19.302597', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2746, 'Añadir Materia con id: 03CON254, nombre: CONTABILIDAD II', 'Usuario coordinador', '2024-08-24 22:12:22.047566', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2747, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:12:22.258062', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2748, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:12:22.359373', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2749, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:12:22.458816', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2750, 'Añadir Materia con id: 03IAD233, nombre: INTRODUCCIÓN AL DERECHO', 'Usuario coordinador', '2024-08-24 22:13:30.811061', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2751, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:13:31.026824', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2752, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:13:31.134664', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2753, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:13:31.246542', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2754, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:14:24.142955', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2755, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:14:24.252192', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2756, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:14:24.356289', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2757, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:14:31.824937', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2758, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:14:31.969084', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2759, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:14:32.108612', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2760, 'Añadir Materia con id: 03ING222, nombre: INGLES II', 'Usuario coordinador', '2024-08-24 22:15:39.967156', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2761, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:15:40.191959', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2762, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:15:40.314696', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2763, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:15:40.441636', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2764, 'Añadir Materia con id: 03ECO232, nombre: ECONOMÍA I', 'Usuario coordinador', '2024-08-24 22:16:58.5432', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2765, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:16:58.75785', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2766, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:16:58.863268', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2767, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:16:58.963615', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2768, 'Añadir Materia con id: 03INA243, nombre: INFORMÁTICA APLICADA', 'Usuario coordinador', '2024-08-24 22:17:48.790843', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2769, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:17:49.173183', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2770, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:17:49.279901', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2771, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:17:49.393184', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2772, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:20:16.275386', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2773, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:20:16.386655', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2774, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:20:16.492237', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2775, 'Añadir Materia con id: 03ORM333, nombre: ORGANIZACIÓN Y MÉTODOS', 'Usuario coordinador', '2024-08-24 22:28:18.594502', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2776, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:28:18.829889', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2777, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:28:18.962556', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2778, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:28:19.185978', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2779, 'Añadir Materia con id: 03ESG333, nombre: ESTADÍSTICA GENERAL', 'Usuario coordinador', '2024-08-24 22:29:21.792462', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2780, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:29:22.022325', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2781, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:29:22.131907', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2782, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:29:22.241136', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2783, 'Añadir Materia con id: 03ECO332, nombre: ECONOMÍA GENERAL', 'Usuario coordinador', '2024-08-24 22:30:17.890502', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2784, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:30:18.103566', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2785, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:30:18.204643', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2786, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:30:18.302063', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2787, 'Añadir Materia con id: 03CON344, nombre: CONTABILIDAD III', 'Usuario coordinador', '2024-08-24 22:31:56.04613', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2788, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:31:56.265549', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2789, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:31:56.36521', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2790, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:31:56.46589', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2791, 'Añadir Materia con id: 03LEG332, nombre: LEGISLACIÓN LABORAL', 'Usuario coordinador', '2024-08-24 22:42:54.431282', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2792, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:42:54.640766', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2793, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:42:54.740048', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2794, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:42:54.839803', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2795, 'Añadir Materia con id: 03MAF342, nombre: MATEMÁTICA FINANCIERA', 'Usuario coordinador', '2024-08-24 22:43:51.30526', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2796, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:43:51.51347', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2797, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:43:51.613717', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2798, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:43:51.711666', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2799, 'Añadir Materia con id: 03IFI322, nombre: INSTITUCIONES FINANCIERAS', 'Usuario coordinador', '2024-08-24 22:44:50.942703', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2800, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:44:51.161915', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2801, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:44:51.264178', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2802, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:44:51.367076', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2803, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:53:54.577693', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2804, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:53:57.073628', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2805, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:53:57.188606', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2806, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:54:32.492083', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2807, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:54:32.609949', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2808, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:55:05.124478', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2809, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:55:05.230732', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2810, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:55:05.434445', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2811, 'Actualizar Materia con id: 03ECO332, nombre: ECONOMÍA II', 'Usuario coordinador', '2024-08-24 22:55:21.922932', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2812, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:55:22.220211', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2813, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 22:55:22.229192', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2814, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:55:22.336411', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2815, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 22:55:22.346891', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2817, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:55:22.457106', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2818, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:55:24.342592', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2819, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-24 22:58:34.894062', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2820, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 22:58:34.991896', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2821, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:02:03.679801', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2822, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:02:03.791236', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2823, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:02:03.892213', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2824, 'Añadir Materia con id: 03COC443, nombre: CONTABILIDAD DE COSTOS I', 'Usuario coordinador', '2024-08-24 23:03:15.582698', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2825, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:03:15.807207', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2826, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:03:15.956403', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2827, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:03:16.056651', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2828, 'Añadir Materia con id: 03ADP433, nombre: ADMINISTRACIÓN DE PERSONAL', 'Usuario coordinador', '2024-08-24 23:05:02.14989', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2829, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:05:02.394173', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2830, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:05:02.504285', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2831, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:05:02.625058', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2832, 'Añadir Materia con id: 03ESA433, nombre: ESTADÍSTICA APLICADA', 'Usuario coordinador', '2024-08-24 23:06:27.703922', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2833, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:06:27.963644', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2834, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:06:28.07879', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2835, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:06:28.196578', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2836, 'Añadir Materia con id: 03DTR432, nombre: DERECHO TRIBUTARIO', 'Usuario coordinador', '2024-08-24 23:07:37.10464', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2837, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:07:37.343779', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2838, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:07:37.469848', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2839, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:07:37.590538', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2840, 'Añadir Materia con id: 03AEF433, nombre: ANÁLISIS DE ESTADOS FINANCIEROS', 'Usuario coordinador', '2024-08-24 23:10:16.191123', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2841, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:10:16.406372', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2842, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:10:16.515622', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2843, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:10:16.646772', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2844, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:12:37.036849', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2845, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:12:37.152309', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2846, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:12:37.258551', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2847, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:12:54.730968', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2848, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:12:54.845786', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2849, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:12:54.951028', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2850, 'Añadir Materia con id: 03ADF433, nombre: ADMINISTRACIÓN FINANCIERA', 'Usuario coordinador', '2024-08-24 23:13:34.410479', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2851, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:13:34.626548', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2852, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:13:34.730879', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2853, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:13:34.830407', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2854, 'Añadir Materia con id: 03COR433, nombre: COMPORTAMIENTO ORGANIZACIONAL', 'Usuario coordinador', '2024-08-24 23:14:36.711941', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2855, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:14:36.923288', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2856, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:14:37.022952', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2857, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:14:37.123049', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2858, 'Añadir Materia con id: 03APU533, nombre: ADMINISTRACIÓN PÚBLICA', 'Usuario coordinador', '2024-08-24 23:16:16.819031', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2859, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:16:17.169726', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2860, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:16:17.269649', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2861, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:16:17.375111', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2862, 'Añadir Materia con id: 03MER533, nombre: MERCADOTECNIA', 'Usuario coordinador', '2024-08-24 23:17:10.403615', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2863, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:17:10.617102', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2864, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:17:10.723369', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2865, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:17:10.832694', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2866, 'Añadir Materia con id: 03COC544, nombre: CONTABILIDAD DE COSTOS II', 'Usuario coordinador', '2024-08-24 23:18:04.210757', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2867, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:18:04.425108', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2868, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:18:04.526752', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2869, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:18:04.626629', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2870, 'Añadir Materia con id: 03AUC533, nombre: AUDITORÍA CONTABLE', 'Usuario coordinador', '2024-08-24 23:19:02.220653', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2871, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:19:02.430257', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2872, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:19:02.532428', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2873, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:19:02.631042', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2874, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:19:05.594778', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2875, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:19:09.206198', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2876, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:19:09.322111', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2877, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:19:13.774064', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2878, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:19:13.898601', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2879, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:19:17.134269', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2880, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:19:17.238686', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2881, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:19:17.34334', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2882, 'Actualizar Materia con id: 03AUC533, nombre: AUDITORÍA CONTABLE', 'Usuario coordinador', '2024-08-24 23:19:34.393108', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2883, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:19:34.702564', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2884, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:19:34.702564', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2885, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:19:34.830737', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2886, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:19:34.834728', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2887, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:19:34.945949', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2888, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:19:34.957433', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2889, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:19:36.83405', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2890, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:19:39.749419', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2891, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:19:39.856674', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2892, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:19:39.971272', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2893, 'Añadir Materia con id: 03DEA533, nombre: DERECHO ADMINISTRATIVO', 'Usuario coordinador', '2024-08-24 23:20:35.868952', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2894, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:20:36.080791', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2895, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:20:36.183277', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2896, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:20:36.286305', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2897, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:23:58.811257', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2898, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:23:58.922887', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2899, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:23:59.029765', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2900, 'Añadir Materia con id: 03DME533, nombre: DERECHO MERCANTIL', 'Usuario coordinador', '2024-08-24 23:24:39.693725', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2901, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:24:39.904982', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2902, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:24:40.007214', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2903, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:24:40.108302', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2904, 'Añadir Materia con id: 03SER522, nombre: SERVICIO COMUNITARIO', 'Usuario coordinador', '2024-08-24 23:25:19.090552', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2905, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:25:19.300095', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2906, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:25:19.400808', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2907, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:25:19.502803', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2908, 'Añadir Materia con id: 03PAS600, nombre: PASANTÍAS PROFESIONALES', 'Usuario coordinador', '2024-08-24 23:25:54.808171', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2909, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:25:55.023463', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2910, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:25:55.122729', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2911, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:25:55.223707', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2912, 'Añadir Materia con id: 03CCO622, nombre: CONTABILIDAD COMPUTARIZADA', 'Usuario coordinador', '2024-08-24 23:26:37.872916', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2913, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:26:38.087604', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2914, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:26:38.187388', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2915, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:26:38.285843', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2916, 'Añadir Materia con id: 03ELE622, nombre: ELECTIVA', 'Usuario coordinador', '2024-08-24 23:27:33.27396', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2917, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:27:33.481505', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2918, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:27:33.582238', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2919, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:27:33.682209', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2920, 'Añadir Materia con id: 03SEM622, nombre: SEMINARIO', 'Usuario coordinador', '2024-08-24 23:27:56.99298', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2921, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:27:57.206084', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2922, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:27:57.308412', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2923, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:27:57.413162', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2924, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:28:02.596658', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2925, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:28:06.114901', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2926, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:28:06.236757', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2927, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:28:13.623821', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2928, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:28:13.744138', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2929, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:28:17.420117', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2930, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:28:20.88506', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2931, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:28:21.006427', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2932, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:28:25.655542', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2933, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:28:25.768411', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2934, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:41:39.21817', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2935, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:41:39.322016', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2936, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:41:39.423145', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2937, 'Añadir Materia con id: 07ADM133, nombre: ADMINISTRACIÓN I', 'Usuario coordinador', '2024-08-24 23:42:33.307816', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2938, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:42:33.548705', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2939, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:42:33.699817', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2940, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:42:33.89635', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2941, 'Añadir Materia con id: 07AMA144, nombre: ANÁLISIS MATEMÁTICO I', 'Usuario coordinador', '2024-08-24 23:43:33.841722', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2942, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:43:34.052163', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2943, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:43:34.158387', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2944, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:43:34.261772', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2945, 'Añadir Materia con id: 07LYC122, nombre: LENGUAJE Y COMUNICACION', 'Usuario coordinador', '2024-08-24 23:43:58.078527', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2946, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:43:58.305669', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2947, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:43:58.427211', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2948, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:43:58.549508', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2949, 'Añadir Materia con id: 07CON144, nombre: CONTABILIDAD I', 'Usuario coordinador', '2024-08-24 23:44:24.503621', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2950, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:44:24.860915', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2951, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:44:24.977335', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2952, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:44:25.100739', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2953, 'Añadir Materia con id: 07TEI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-08-24 23:44:55.629678', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2954, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:44:55.984248', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2955, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:44:56.101871', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2956, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:44:56.221073', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2957, 'Añadir Materia con id: 07EDF121, nombre: EDUCACIÓN FÍSICA', 'Usuario coordinador', '2024-08-24 23:47:57.598714', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2958, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:47:57.805526', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2959, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:47:57.907515', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2960, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:47:58.006447', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2961, 'Añadir Materia con id: 071NG132, nombre: INGLES I', 'Usuario coordinador', '2024-08-24 23:48:50.891198', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2962, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:48:51.099897', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2963, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:48:51.201925', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2964, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:48:51.300188', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2965, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-24 23:54:17.188329', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2966, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:54:22.062099', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2967, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:54:22.167718', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2968, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:54:22.270668', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2969, 'Añadir Materia con id: 07EPA122, nombre: EDUC.Y PRESERVACIÓN DEL AMBIENTE', 'Usuario coordinador', '2024-08-24 23:55:52.078142', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2970, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:55:52.285444', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2971, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:55:52.385709', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2972, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:55:52.484', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2973, 'Añadir Materia con id: 07AMA244, nombre: ANÁLISIS MATEMÁTICO II', 'Usuario coordinador', '2024-08-24 23:56:49.615625', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2974, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:56:49.962751', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2975, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:56:50.070991', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2976, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:56:50.17018', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2977, 'Añadir Materia con id: 07ADM233, nombre: ECONOMÍA I', 'Usuario coordinador', '2024-08-24 23:57:25.448279', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2978, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:57:25.671143', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2979, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:57:25.77635', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2980, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:57:26.019641', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2981, 'Añadir Materia con id: 07IAD233, nombre: INTRODUCCIÓN AL DERECHO', 'Usuario coordinador', '2024-08-24 23:58:52.570649', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2982, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:58:52.783669', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2983, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:58:52.888525', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2984, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:58:52.991024', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2985, 'Añadir Materia con id: 07CON254, nombre: CONTABILIDAD II', 'Usuario coordinador', '2024-08-24 23:59:53.526959', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2986, 'Obtener Docentes', 'Usuario coordinador', '2024-08-24 23:59:53.738118', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2987, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-24 23:59:53.840505', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2988, 'Obtener Carreras', 'Usuario coordinador', '2024-08-24 23:59:54.099171', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2989, 'Añadir Materia con id: 07INA243, nombre: INFORMÁTICA APLICADA', 'Usuario coordinador', '2024-08-25 00:00:56.643192', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2990, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:00:56.854082', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2991, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:00:56.95441', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2992, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:00:57.054559', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2993, 'Añadir Materia con id: 07ING222, nombre: INGLES II', 'Usuario coordinador', '2024-08-25 00:01:47.468271', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2994, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:01:47.823119', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2995, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:01:47.927198', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2996, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:01:48.028058', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2997, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:03:38.499377', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2998, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:03:38.616799', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (2999, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:03:38.725848', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3000, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:03:40.347509', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3001, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:03:43.681369', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3002, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:03:43.801043', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3003, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:03:53.494543', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3004, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:03:53.618056', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3005, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:04:06.716017', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3006, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:04:06.829501', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3007, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:04:06.930819', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3008, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:04:31.694271', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3009, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:04:33.787864', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3010, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:04:33.894121', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3011, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:04:33.992433', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3012, 'Añadir Materia con id: 07IFI322, nombre: INSTITUCIONES FINANCIERAS', 'Usuario coordinador', '2024-08-25 00:05:10.479346', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3013, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:05:10.690437', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3014, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:05:10.793171', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3015, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:05:10.892789', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3016, 'Añadir Materia con id: 07ESG333, nombre: ESTADÍSTICA GENERAL', 'Usuario coordinador', '2024-08-25 00:07:38.287275', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3017, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:07:38.496513', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3018, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:07:38.598961', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3019, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:07:38.698989', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3020, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:07:47.334057', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3021, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:07:49.368271', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3022, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:07:49.492029', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3023, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:07:54.336566', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3024, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:07:54.450791', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3025, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:07:58.758693', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3026, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:07:58.870972', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3027, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:07:58.988317', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3028, 'Actualizar Materia con id: 07IFI322, nombre: INSTITUCIONES FINANCIERAS', 'Usuario coordinador', '2024-08-25 00:08:15.584013', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3029, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:08:15.893623', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3030, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:08:15.901605', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3031, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:08:16.019832', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3032, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:08:16.029806', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3033, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:08:16.13604', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3034, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:08:16.152995', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3035, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:08:17.50416', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3036, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:08:20.126001', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3037, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:08:20.239825', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3038, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:08:20.463592', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3039, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:10:34.213559', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3040, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:10:37.552497', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3041, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:10:37.673032', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3042, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:10:43.938933', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3043, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:10:44.06328', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3044, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:10:57.301491', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3045, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:10:57.430894', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3046, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:11:22.96402', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3047, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:11:23.07511', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3048, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:11:23.19331', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3049, 'Actualizar Materia con id: 07ADM233, nombre: ADMINISTRACIÓN II', 'Usuario coordinador', '2024-08-25 00:13:08.501224', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3050, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:13:08.807284', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3051, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:13:08.817257', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3052, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:13:08.932468', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3053, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:13:08.942441', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3054, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:13:09.047943', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3055, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:13:09.059322', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3056, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:13:11.708633', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3057, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:13:17.879582', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3058, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:13:17.979851', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3059, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:13:18.0792', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3060, 'Añadir Materia con id: 07ECO232, nombre: ECONOMÍA I', 'Usuario coordinador', '2024-08-25 00:13:51.60598', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3061, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:13:51.820842', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3062, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:13:51.921941', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3063, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:13:52.021193', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3064, 'Añadir Materia con id: 07ECO332, nombre: ECONOMÍA II', 'Usuario coordinador', '2024-08-25 00:14:31.842622', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3065, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:14:32.072179', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3066, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:14:32.180391', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3067, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:14:32.285144', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3068, 'Añadir Materia con id: 07MAF342, nombre: MATEMÁTICA FINANCIERA25', 'Usuario coordinador', '2024-08-25 00:15:13.478925', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3069, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:15:13.689494', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3070, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:15:13.791215', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3071, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:15:13.890735', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3072, 'Añadir Materia con id: 07LEG332, nombre: LEGISLACIÓN LABORAL', 'Usuario coordinador', '2024-08-25 00:16:04.459631', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3073, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:16:04.669753', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3074, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:16:04.772886', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3075, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:16:04.879268', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3076, 'Añadir Materia con id: 07CON344, nombre: CONTABILIDAD III', 'Usuario coordinador', '2024-08-25 00:16:56.530386', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3077, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:16:56.740348', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3078, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:16:56.842796', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3079, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:16:56.940156', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3080, 'Añadir Materia con id: 07ORM333, nombre: ORGANIZACIÓN Y MÉTODOS', 'Usuario coordinador', '2024-08-25 00:17:37.590465', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3081, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 00:17:37.803689', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3082, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 00:17:37.908242', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3083, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 00:17:38.01346', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3084, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-25 22:45:53.745686', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3085, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:45:58.639056', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3086, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:46:02.649582', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3087, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:46:02.75921', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3088, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:46:30.510449', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3089, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:46:30.61806', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3090, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:46:36.619242', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3091, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:46:36.879701', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3092, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:46:36.973797', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3093, 'Añadir Materia con id: 07CBH443, nombre: CONTABILIDAD DE BANCA HIPOTECARIA', 'Usuario coordinador', '2024-08-25 22:49:26.534639', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3094, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:49:26.743334', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3095, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:49:26.83724', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3096, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:49:26.946593', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3097, 'Añadir Materia con id: 07ADP443, nombre: ADMINISTRACIÓN DE PERSONAL', 'Usuario coordinador', '2024-08-25 22:51:02.093347', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3098, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:51:02.301587', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3099, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:51:02.410375', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3100, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:51:02.504097', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3101, 'Añadir Materia con id: 07ESA433, nombre: ESTADÍSTICA APLICADA', 'Usuario coordinador', '2024-08-25 22:52:21.373183', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3102, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:52:21.58002', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3103, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:52:21.673747', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3104, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:52:21.783069', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3105, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:52:23.911132', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3106, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:52:25.430048', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3107, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:52:25.530808', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3108, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:52:25.636876', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3109, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:55:22.177711', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3110, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:55:25.288785', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3111, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:55:25.400302', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3112, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:55:25.505819', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3113, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:55:35.116129', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3114, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:55:37.50978', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3115, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:55:37.604734', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3116, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:55:37.698465', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3117, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:55:44.239235', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3118, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:55:47.124742', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3119, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:55:47.224874', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3120, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:56:09.811915', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3121, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:56:09.936051', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3122, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:56:10.022493', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3123, 'Añadir Materia con id: 07DTR432, nombre: DERECHO TRIBUTARIO', 'Usuario coordinador', '2024-08-25 22:57:59.011728', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3124, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:57:59.21592', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3125, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:57:59.309627', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3126, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:57:59.418977', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3127, 'Añadir Materia con id: 07ADF433, nombre: ADMINISTRACIÓN FINANCIERA', 'Usuario coordinador', '2024-08-25 22:58:44.537334', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3128, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 22:58:44.767165', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3129, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 22:58:44.866204', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3130, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 22:58:44.975758', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3131, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:00:29.090661', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3132, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:00:29.187089', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3133, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:00:29.296362', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3134, 'Añadir Materia con id: 07AEF433, nombre: ANÁLISIS DE ESTADOS FINANCIEROS', 'Usuario coordinador', '2024-08-25 23:01:11.90295', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3135, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:01:12.117542', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3136, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:01:12.258646', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3137, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:01:12.461929', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3138, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:01:15.112832', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3139, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:01:16.348639', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3140, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:01:16.462654', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3141, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:01:16.570921', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3142, 'Actualizar Materia con id: 07MAF342, nombre: MATEMÁTICA FINANCIERA', 'Usuario coordinador', '2024-08-25 23:01:29.784672', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3143, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:01:30.055258', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3144, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:01:30.074622', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3145, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:01:30.170772', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3146, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:01:30.18628', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3147, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:01:30.284566', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3148, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:01:30.292724', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3149, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:01:31.318238', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3150, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:01:33.727848', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3151, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:01:33.8386', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3152, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:01:33.932322', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3153, 'Añadir Materia con id: 07FEP422, nombre: FORMULACIÓN Y EVALUACIÓN DE PROYECTOS', 'Usuario coordinador', '2024-08-25 23:05:41.287777', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3154, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:05:41.508459', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3155, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:05:41.63343', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3156, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:05:41.836967', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3157, 'Añadir Materia con id: 07PRE544, nombre: PRESUPUESTO', 'Usuario coordinador', '2024-08-25 23:07:53.154808', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3158, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:07:53.361683', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3159, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:07:53.471008', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3160, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:07:53.564765', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3161, 'Añadir Materia con id: 07FNI522, nombre: FINANZAS INTERNACIONALES', 'Usuario coordinador', '2024-08-25 23:08:51.051356', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3162, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:08:51.256615', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3163, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:08:51.366414', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3164, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:08:51.460167', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3165, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:08:55.570606', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3166, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:08:55.686287', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3167, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:08:55.786553', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3168, 'Añadir Materia con id: 07ICF543, nombre: INSTRUMENTOS DE CAPTACIÓN FINANCIERA', 'Usuario coordinador', '2024-08-25 23:11:11.505347', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3169, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:11:11.736952', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3170, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:11:11.846295', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3171, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:11:11.952804', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3172, 'Añadir Materia con id: 07AOR533, nombre: ANÁLISIS ORGANIZATIVO', 'Usuario coordinador', '2024-08-25 23:12:23.717637', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3173, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:12:23.924487', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3174, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:12:24.033223', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3175, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:12:24.126951', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3176, 'Añadir Materia con id: 07AUB543, nombre: AUDITORÍA BANCARÍA', 'Usuario coordinador', '2024-08-25 23:13:21.979284', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3177, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:13:22.199902', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3178, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:13:22.29433', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3179, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:13:22.403091', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3180, 'Añadir Materia con id: 07SER522, nombre: SERVICIO COMUNITARIO', 'Usuario coordinador', '2024-08-25 23:14:13.480214', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3181, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:14:13.685644', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3182, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:14:13.779765', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3183, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:14:13.889114', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3184, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:15:35.362988', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3185, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:15:35.468099', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3186, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:15:35.560151', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3187, 'Añadir Materia con id: 07CDE543, nombre: CONTABILIDAD DEPARTAMENTAL', 'Usuario coordinador', '2024-08-25 23:16:12.676229', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3188, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:16:12.880329', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3189, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:16:12.989841', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3190, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:16:13.083569', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3191, 'Añadir Materia con id: 07MDC522, nombre: MERCADO DE CAPITALES', 'Usuario coordinador', '2024-08-25 23:17:23.319372', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3192, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:17:23.528102', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3193, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:17:23.626338', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3194, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:17:23.720066', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3195, 'Añadir Materia con id: 07SEM622, nombre: SEMINARIO', 'Usuario coordinador', '2024-08-25 23:17:57.899614', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3196, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:17:58.129738', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3197, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:17:58.247922', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3198, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:17:58.366885', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3199, 'Añadir Materia con id: 07PAS600, nombre: PASANTÍAS PROFESIONALES', 'Usuario coordinador', '2024-08-25 23:19:46.004119', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3200, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:19:46.201644', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3201, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:19:46.295373', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3202, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:19:46.404934', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3203, 'Añadir Materia con id: 07CCO622, nombre: CONTABILIDAD COMPUTARIZADA', 'Usuario coordinador', '2024-08-25 23:20:23.280006', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3204, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:20:23.478209', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3205, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:20:23.587581', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3206, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:20:23.694485', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3207, 'Añadir Materia con id: 07ELE622, nombre: ELECTIVA', 'Usuario coordinador', '2024-08-25 23:20:47.906964', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3208, 'Obtener Docentes', 'Usuario coordinador', '2024-08-25 23:20:48.118196', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3209, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-25 23:20:48.212025', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3210, 'Obtener Carreras', 'Usuario coordinador', '2024-08-25 23:20:48.305757', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3211, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-26 16:19:09.181959', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3212, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:19:12.17261', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3213, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:19:12.28196', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3214, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:19:12.391322', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3215, 'Añadir Materia con id: 02ADM133, nombre: ADMINISTRACIÓN I', 'Usuario coordinador', '2024-08-26 16:23:18.842573', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3216, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:23:19.082747', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3217, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:23:19.195682', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3218, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:23:19.305921', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3219, 'Añadir Materia con id: 02LYC122, nombre: LENGUAJE Y COMUNICACION', 'Usuario coordinador', '2024-08-26 16:23:43.889885', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3220, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:23:44.12599', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3221, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:23:44.237946', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3222, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:23:44.34994', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3223, 'Añadir Materia con id: 02CON144, nombre: CONTABILIDAD I', 'Usuario coordinador', '2024-08-26 16:24:07.420654', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3224, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:24:07.657896', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3225, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:24:07.770885', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3226, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:24:07.874975', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3227, 'Añadir Materia con id: 02TEI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-08-26 16:24:39.5481', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3228, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:24:39.770683', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3229, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:24:39.881388', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3230, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:24:40.002018', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3231, 'Añadir Materia con id: 02EDF121, nombre: EDUCACIÓN FÍSICA', 'Usuario coordinador', '2024-08-26 16:25:12.525165', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3232, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:25:12.74138', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3233, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:25:12.838079', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3234, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:25:12.94699', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3235, 'Añadir Materia con id: 021NG132, nombre: INGLES I', 'Usuario coordinador', '2024-08-26 16:25:54.551399', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3236, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:25:54.787119', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3237, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:25:54.902188', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3238, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:25:55.01683', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3239, 'Añadir Materia con id: 02AMA144, nombre: ANÁLISIS MATEMÁTICO I', 'Usuario coordinador', '2024-08-26 16:26:27.397717', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3240, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:26:27.771856', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3241, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:26:27.881234', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3242, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:26:28.000312', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3243, 'Añadir Materia con id: 02EPA122, nombre: EDUC.Y PRESERVACIÓN DEL AMBIENTE', 'Usuario coordinador', '2024-08-26 16:26:52.740393', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3244, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:26:52.955727', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3245, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:26:53.065076', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3246, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:26:53.158804', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3247, 'Añadir Materia con id: 02ADM233, nombre: ADMINISTRACIÓN II', 'Usuario coordinador', '2024-08-26 16:27:42.94983', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3248, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:27:43.178293', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3249, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:27:43.294302', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3250, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:27:43.513003', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3251, 'Añadir Materia con id: 02AMA244, nombre: ANÁLISIS MATEMÁTICO II', 'Usuario coordinador', '2024-08-26 16:28:32.211683', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3252, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:28:32.426988', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3253, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:28:32.542351', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3254, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:28:32.650587', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3255, 'Añadir Materia con id: 02CON254, nombre: CONTABILIDAD II', 'Usuario coordinador', '2024-08-26 16:29:19.257231', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3256, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:29:19.4802', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3257, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:29:19.573898', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3258, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:29:19.668121', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3259, 'Añadir Materia con id: 02IAD233, nombre: INTRODUCCIÓN AL DERECHO', 'Usuario coordinador', '2024-08-26 16:29:50.058572', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3260, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:29:50.278457', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3261, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:29:50.39261', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3262, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:29:50.507229', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3263, 'Añadir Materia con id: 02ING222, nombre: INGLES II', 'Usuario coordinador', '2024-08-26 16:30:24.429322', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3264, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:30:24.660029', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3265, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:30:24.775164', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3266, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:30:24.879988', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3267, 'Añadir Materia con id: 02ECO232, nombre: ECONOMÍA I', 'Usuario coordinador', '2024-08-26 16:31:09.663021', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3268, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:31:09.912624', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3269, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:31:10.030358', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3270, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:31:10.142369', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3271, 'Añadir Materia con id: 02INA243, nombre: INFORMÁTICA APLICADA', 'Usuario coordinador', '2024-08-26 16:31:42.982247', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3272, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:31:43.183916', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3273, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:31:43.293678', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3274, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:31:43.408291', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3275, 'Añadir Materia con id: 02ECO332, nombre: ECONOMÍA II', 'Usuario coordinador', '2024-08-26 16:32:23.692212', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3276, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:32:23.906731', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3277, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:32:24.021842', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3278, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:32:24.115542', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3279, 'Añadir Materia con id: 02ORM333, nombre: ORGANIZACIÓN Y MÉTODOS', 'Usuario coordinador', '2024-08-26 16:33:20.519335', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3280, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:33:20.74689', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3281, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:33:20.845627', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3282, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:33:20.939362', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3283, 'Añadir Materia con id: 02ESG333, nombre: ESTADÍSTICA GENERAL', 'Usuario coordinador', '2024-08-26 16:34:10.952395', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3284, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:34:11.174988', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3285, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:34:11.284655', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3286, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:34:11.378376', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3287, 'Añadir Materia con id: 02MAF342, nombre: MATEMÁTICA FINANCIERA', 'Usuario coordinador', '2024-08-26 16:34:47.75006', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3288, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:34:47.976419', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3289, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:34:48.092551', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3290, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:34:48.19937', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3291, 'Añadir Materia con id: 02CON344, nombre: CONTABILIDAD III', 'Usuario coordinador', '2024-08-26 16:35:33.203136', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3292, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:35:33.424276', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3293, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:35:33.518409', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3294, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:35:33.659', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3295, 'Añadir Materia con id: 02LEG332, nombre: LEGISLACIÓN LABORAL', 'Usuario coordinador', '2024-08-26 16:36:26.67484', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3296, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:36:26.898783', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3297, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:36:27.008133', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3298, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:36:27.101881', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3299, 'Añadir Materia con id: 02IFI322, nombre: INSTITUCIONES FINANCIERAS', 'Usuario coordinador', '2024-08-26 16:36:59.521201', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3300, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:36:59.734396', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3301, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:36:59.843953', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3302, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:36:59.937681', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3303, 'Añadir Materia con id: 02COC443, nombre: CONTABILIDAD DE COSTOS I', 'Usuario coordinador', '2024-08-26 16:37:58.524952', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3304, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:37:58.739602', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3305, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:37:58.864932', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3306, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:37:58.972568', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3307, 'Añadir Materia con id: 02COR433, nombre: COMPORTAMIENTO ORGANIZACIONAL', 'Usuario coordinador', '2024-08-26 16:38:48.573354', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3308, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:38:48.780451', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3309, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:38:48.889777', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3310, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:38:48.983506', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3311, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:38:51.37456', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3312, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:38:55.142718', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3313, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:38:55.260742', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3314, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:38:59.084089', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3315, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:38:59.187368', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3316, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:39:17.001899', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3317, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:39:17.097888', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3318, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:39:17.207265', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3319, 'Añadir Materia con id: 02ESA433, nombre: ESTADÍSTICA APLICADA', 'Usuario coordinador', '2024-08-26 16:40:37.535932', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3320, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:40:37.743055', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3321, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:40:37.863523', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3322, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:40:37.974557', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3323, 'Añadir Materia con id: 02ADP433, nombre: ADMINISTRACIÓN DE PERSONAL', 'Usuario coordinador', '2024-08-26 16:42:51.939435', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3324, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:42:52.163256', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3325, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:42:52.275299', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3326, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:42:52.369178', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3327, 'Añadir Materia con id: 02DTR432, nombre: DERECHO TRIBUTARIO', 'Usuario coordinador', '2024-08-26 16:43:42.841133', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3328, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:43:43.071579', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3329, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:43:43.18619', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3330, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:43:43.28037', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3331, 'Añadir Materia con id: 02AEF433, nombre: ANÁLISIS DE ESTADOS FINANCIEROS', 'Usuario coordinador', '2024-08-26 16:44:27.813464', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3332, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:44:28.045307', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3333, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:44:28.306723', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3334, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:44:28.420361', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3335, 'Añadir Materia con id: 02ADF433, nombre: ADMINISTRACIÓN FINANCIERA', 'Usuario coordinador', '2024-08-26 16:45:20.184355', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3336, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:45:20.414418', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3337, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:45:20.529473', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3338, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:45:20.638789', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3339, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:45:22.876114', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3340, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:45:24.438049', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3341, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:45:24.550008', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3342, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:45:24.663888', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3343, 'Actualizar Materia con id: 02ADF433, nombre: ADMINISTRACIÓN FINANCIERA', 'Usuario coordinador', '2024-08-26 16:46:03.327784', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3344, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:46:03.585632', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3345, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:46:03.705811', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3346, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:46:03.602204', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3347, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:46:03.818472', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3348, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:46:03.818472', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3349, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:46:03.944663', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3350, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:46:11.39832', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3351, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:46:11.509419', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3352, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:46:11.618911', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3353, 'Añadir Materia con id: 02MER533, nombre: MERCADOTECNIA', 'Usuario coordinador', '2024-08-26 16:48:54.15135', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3354, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:48:54.391079', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3355, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:48:54.546927', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3356, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:48:54.678151', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3357, 'Añadir Materia con id: 02PLA533, nombre: PLANIFICACIÓN DE EMPRESAS', 'Usuario coordinador', '2024-08-26 16:49:52.546438', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3358, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:49:52.753285', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3359, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:49:52.872943', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3360, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:49:52.98513', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3361, 'Añadir Materia con id: 02AUC533, nombre: AUDITORÍA CONTABLE', 'Usuario coordinador', '2024-08-26 16:50:47.587816', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3362, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:50:47.810902', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3363, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:50:47.920647', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3364, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:50:48.027876', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3365, 'Añadir Materia con id: 02PRE544, nombre: PRESUPUESTO', 'Usuario coordinador', '2024-08-26 16:51:12.200909', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3366, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:51:12.438187', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3367, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:51:12.553875', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3368, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:51:12.668908', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3369, 'Añadir Materia con id: 02DME533, nombre: DERECHO MERCANTIL', 'Usuario coordinador', '2024-08-26 16:51:50.20768', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3370, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:51:50.437849', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3371, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:51:50.552538', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3372, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:51:50.646406', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3373, 'Añadir Materia con id: 02SER522, nombre: SERVICIO COMUNITARIO', 'Usuario coordinador', '2024-08-26 16:52:29.416648', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3374, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:52:29.649061', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3375, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:52:29.769423', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3376, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:52:29.885584', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3377, 'Añadir Materia con id: 02PAS600, nombre: PASANTÍAS PROFESIONALES', 'Usuario coordinador', '2024-08-26 16:52:57.275352', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3378, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:52:57.489094', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3379, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:52:57.598887', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3380, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:52:57.692614', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3381, 'Añadir Materia con id: 05SEM622, nombre: SEMINARIO', 'Usuario coordinador', '2024-08-26 16:53:33.751191', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3382, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:53:33.951508', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3383, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:53:34.060879', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3384, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:53:34.171526', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3385, 'Añadir Materia con id: 02CCO622, nombre: CONTABILIDAD COMPUTARIZADA', 'Usuario coordinador', '2024-08-26 16:54:02.679477', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3386, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:54:03.045557', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3387, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:54:03.159287', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3388, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:54:03.276647', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3389, 'Añadir Materia con id: 02ELE622, nombre: ELECTIVA', 'Usuario coordinador', '2024-08-26 16:54:24.352208', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3390, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 16:54:24.566591', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3391, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 16:54:24.675985', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3392, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 16:54:24.769712', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3393, 'Añadir Materia con id: 01LYC122, nombre: LENGUAJE Y COMUNICACION', 'Usuario coordinador', '2024-08-26 17:00:26.01182', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3394, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:00:26.241094', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3395, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:00:26.350501', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3396, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:00:26.444233', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3397, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:00:29.105598', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3398, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:00:29.218246', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3399, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:00:29.327897', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3400, 'Añadir Materia con id: 01ETI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-08-26 17:01:04.320591', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3401, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:01:04.541127', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3402, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:01:04.697826', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3403, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:01:04.919538', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3404, 'Añadir Materia con id: 01AMA144, nombre: ANÁLISIS MATEMÁTICO I', 'Usuario coordinador', '2024-08-26 17:01:31.401941', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3405, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:01:31.618722', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3406, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:01:31.728077', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3407, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:01:31.821775', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3408, 'Añadir Materia con id: 01NG132, nombre: INGLES I', 'Usuario coordinador', '2024-08-26 17:01:58.09838', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3409, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:01:58.326212', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3410, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:01:58.436411', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3411, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:01:58.547616', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3412, 'Añadir Materia con id: 01INF132, nombre: INTRODUCCIÓN A LA INFORMÁTICA', 'Usuario coordinador', '2024-08-26 17:02:32.703564', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3413, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:02:32.917895', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3414, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:02:33.027815', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3415, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:02:33.138232', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3416, 'Añadir Materia con id: 01EDF121, nombre: EDUCACIÓN FÍSICA', 'Usuario coordinador', '2024-08-26 17:03:03.203166', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3417, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:03:03.417861', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3418, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:03:03.68809', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3419, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:03:03.800493', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3420, 'Añadir Materia con id: 01EPA122, nombre: EDUC.Y PRESERVACIÓN DEL AMBIENTE', 'Usuario coordinador', '2024-08-26 17:03:23.673177', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3421, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:03:23.884829', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3422, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:03:23.999157', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3423, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:03:24.087896', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3424, 'Añadir Materia con id: 01COG164, nombre: CONTABILIDAD GENERAL', 'Usuario coordinador', '2024-08-26 17:03:55.749119', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3425, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:03:55.983447', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3426, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:03:56.104517', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3427, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:03:56.228026', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3428, 'Añadir Materia con id: 01AGM122, nombre: ALGORÍTMICA', 'Usuario coordinador', '2024-08-26 17:04:26.53249', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3429, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:04:26.752577', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3430, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:04:26.861928', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3431, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:04:26.986897', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3432, 'Añadir Materia con id: 01ALG122, nombre: ÁLGEBRA', 'Usuario coordinador', '2024-08-26 17:05:24.394326', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3433, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:05:24.617324', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3434, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:05:24.735544', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3435, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:05:24.847082', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3436, 'Añadir Materia con id: 01IED232, nombre: INTRODUCCIÓN A LA ESTRUCTURA DE DATOS', 'Usuario coordinador', '2024-08-26 17:06:30.202088', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3437, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:06:30.42434', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3438, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:06:30.533717', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3439, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:06:30.627429', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3440, 'Añadir Materia con id: 01AMA244, nombre: ANÁLISIS MATEMÁTICO II', 'Usuario coordinador', '2024-08-26 17:07:15.100981', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3441, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:07:15.321546', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3442, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:07:15.448914', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3443, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:07:15.563411', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3444, 'Añadir Materia con id: 01ING222, nombre: INGLES II', 'Usuario coordinador', '2024-08-26 17:08:08.179006', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3445, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:08:08.408657', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3446, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:08:08.649139', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3447, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:08:08.773147', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3448, 'Añadir Materia con id: 01ORM233, nombre: ORGANIZACIÓN Y MÉTODOS', 'Usuario coordinador', '2024-08-26 17:09:15.912706', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3449, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:09:16.130535', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3450, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:09:16.239912', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3451, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:09:16.346688', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3452, 'Añadir Materia con id: 01ADM133, nombre: ADMINISTRACIÓN I', 'Usuario coordinador', '2024-08-26 17:10:18.210255', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3453, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:10:18.43876', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3454, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:10:18.553667', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3455, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:10:18.647668', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3456, 'Añadir Materia con id: 01PRU243, nombre: PROGRAMACIÓN I', 'Usuario coordinador', '2024-08-26 17:11:14.150643', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3457, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:11:14.37332', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3458, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:11:14.467043', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3459, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:11:14.560768', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3460, 'Añadir Materia con id: 01ELE222, nombre: ELECTIVA I', 'Usuario coordinador', '2024-08-26 17:12:11.736804', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3461, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:12:11.952458', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3462, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:12:12.046184', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3463, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:12:12.155956', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3464, 'Añadir Materia con id: 01ESG333, nombre: ESTADÍSTICA GENERAL', 'Usuario coordinador', '2024-08-26 17:15:49.470189', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3465, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:15:49.69182', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3466, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:15:49.801172', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3467, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:15:49.910523', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3468, 'Añadir Materia con id: 01PDD343, nombre: PROCESAMIENTO DE DATOS', 'Usuario coordinador', '2024-08-26 17:16:38.130051', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3469, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:16:38.353334', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3470, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:16:38.447079', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3471, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:16:38.556868', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3472, 'Añadir Materia con id: 01OCO364, nombre: ORGANIZACIÓN DEL COMPUTADOR', 'Usuario coordinador', '2024-08-26 17:18:56.443396', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3473, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:18:56.665708', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3474, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:18:56.775092', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3475, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:18:56.879953', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3476, 'Añadir Materia con id: 01FSI354, nombre: FUNDAMENTOS DE SISTEMAS', 'Usuario coordinador', '2024-08-26 17:20:00.682863', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3477, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:20:00.902635', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3478, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:20:01.013228', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3479, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:20:01.125062', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3480, 'Añadir Materia con id: 01PRD344, nombre: PROGRAMACIÓN II', 'Usuario coordinador', '2024-08-26 17:20:38.92798', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3481, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:20:39.148562', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3482, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:20:39.257911', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3483, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:20:39.351639', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3484, 'Añadir Materia con id: 01ELE322, nombre: ELECTIVA II', 'Usuario coordinador', '2024-08-26 17:22:28.759628', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3485, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:22:28.981798', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3486, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:22:29.091616', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3487, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:22:29.200306', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3488, 'Añadir Materia con id: 01FBD322, nombre: FUNDAMENTOS DE BASE DE DATOS', 'Usuario coordinador', '2024-08-26 17:23:08.318204', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3489, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:23:08.530435', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3490, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:23:08.639812', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3491, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:23:08.733512', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3492, 'Añadir Materia con id: 01SIN433, nombre: SISTEMAS DE INFORMACIÓN I', 'Usuario coordinador', '2024-08-26 17:26:18.835784', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3493, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:26:19.059814', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3494, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:26:19.154013', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3495, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:26:19.406302', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3496, 'Añadir Materia con id: 01BDD454, nombre: BASE DE DATOS', 'Usuario coordinador', '2024-08-26 17:27:29.272213', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3497, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:27:29.49122', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3498, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:27:29.600569', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3499, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:27:29.710455', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3500, 'Añadir Materia con id: 01ESA433, nombre: ESTADÍSTICA APLICADA', 'Usuario coordinador', '2024-08-26 17:28:14.275816', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3501, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:28:14.482953', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3502, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:28:14.592323', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3503, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:28:14.701652', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3504, 'Añadir Materia con id: 01SOP454, nombre: SISTEMAS OPERATIVOS', 'Usuario coordinador', '2024-08-26 17:28:55.309684', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3505, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:28:55.532076', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3506, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:28:55.641839', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3507, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:28:55.735571', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3508, 'Añadir Materia con id: 01PRT443, nombre: PROGRAMACIÓN III', 'Usuario coordinador', '2024-08-26 17:29:52.9547', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3509, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:29:53.177202', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3510, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:29:53.286522', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3511, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:29:53.38028', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3512, 'Añadir Materia con id: 01FRD422, nombre: FUNDAMENTOS DE REDES', 'Usuario coordinador', '2024-08-26 17:30:28.904858', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3513, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:30:29.150929', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3514, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:30:29.27665', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3515, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:30:29.3773', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3516, 'Añadir Materia con id: 01ELE422, nombre: ELECTIVA III', 'Usuario coordinador', '2024-08-26 17:31:05.256044', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3517, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:31:05.479602', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3518, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:31:05.591618', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3519, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:31:05.683021', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3520, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:31:21.846227', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3521, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:31:25.151848', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3522, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:31:25.285937', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3523, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:31:30.610531', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3524, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:31:30.71088', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3525, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:32:35.900752', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3526, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:32:36.017058', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3527, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:32:36.138232', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3528, 'Actualizar Materia con id: 04DTD543, nombre: DISEÑO TRIDIMENSIONAL', 'Usuario coordinador', '2024-08-26 17:33:00.388249', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3529, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:33:00.642648', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3530, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:33:00.668545', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3531, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:33:00.781102', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3532, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:33:00.792073', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3533, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:33:00.921041', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3534, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:33:00.929019', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3535, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:33:02.303371', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3536, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:33:05.667236', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3537, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:33:05.790147', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3538, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:33:15.616072', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3539, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:33:15.72897', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3540, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:33:15.846422', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3541, 'Añadir Materia con id: 01IDO543, nombre: INVESTIGACIÓN DE OPERACIONES', 'Usuario coordinador', '2024-08-26 17:34:03.925889', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3542, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:34:04.152955', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3543, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:34:04.275051', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3544, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:34:04.387733', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3545, 'Añadir Materia con id: 01SIN543, nombre: SISTEMAS DE INFORMACIÓN II', 'Usuario coordinador', '2024-08-26 17:34:47.637453', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3546, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:34:47.846023', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3547, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:34:47.955372', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3548, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:34:48.06475', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3549, 'Añadir Materia con id: 01NDG544, nombre: NOCIONES DE DISEÑO GRÁFICO', 'Usuario coordinador', '2024-08-26 17:35:21.018962', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3550, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:35:21.232427', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3551, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:35:21.341777', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3552, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:35:21.452204', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3553, 'Añadir Materia con id: 01REC564, nombre: REDES DE COMPUTADORAS', 'Usuario coordinador', '2024-08-26 17:36:25.942265', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3554, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:36:26.155182', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3555, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:36:26.264542', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3556, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:36:26.373649', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3557, 'Añadir Materia con id: 01PRC544, nombre: PROGRAMACIÓN IV', 'Usuario coordinador', '2024-08-26 17:38:04.261338', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3558, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:38:04.484269', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3559, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:38:04.593657', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3560, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:38:04.68735', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3561, 'Añadir Materia con id: 01AUS533, nombre: AUDITORÍA DE SISTEMAS', 'Usuario coordinador', '2024-08-26 17:39:03.407153', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3562, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:39:03.632933', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3563, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:39:03.745951', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3564, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:39:03.857067', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3565, 'Añadir Materia con id: 01ELE522, nombre: ELECTIVA IV', 'Usuario coordinador', '2024-08-26 17:39:46.077923', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3566, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:39:46.301115', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3567, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:39:46.394876', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3568, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:39:46.515378', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3569, 'Añadir Materia con id: 01SER522, nombre: SERVICIO COMUNITARIO', 'Usuario coordinador', '2024-08-26 17:40:16.369957', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3570, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:40:16.583702', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3571, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:40:16.677452', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3572, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:40:16.797572', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3573, 'Añadir Materia con id: 01PAS600, nombre: PASANTÍAS PROFESIONALES', 'Usuario coordinador', '2024-08-26 17:40:37.674327', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3574, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:40:37.88434', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3575, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:40:38.009781', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3576, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:40:38.126735', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3577, 'Añadir Materia con id: 01SEM622, nombre: SEMINARIO', 'Usuario coordinador', '2024-08-26 17:41:00.259253', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3578, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:41:00.486417', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3579, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:41:00.605197', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3580, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:41:00.722732', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3581, 'Añadir Materia con id: 01ELE622, nombre: ELECTIVA V', 'Usuario coordinador', '2024-08-26 17:41:22.087781', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3582, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:41:22.31571', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3583, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:41:22.429475', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3584, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:41:22.541672', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3585, 'Añadir Materia con id: 01OPT622, nombre: TELEINFORMÁTICA', 'Usuario coordinador', '2024-08-26 17:41:42.336364', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3586, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 17:41:42.688198', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3587, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 17:41:42.797547', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3588, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 17:41:42.905369', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3589, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-26 19:00:38.915394', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3590, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:00:41.538416', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3591, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:00:41.653651', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3592, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:00:41.773051', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3593, 'Añadir Materia con id: 05EPA122, nombre: EDUC.Y PRESERVACIÓN DEL AMBIENTE', 'Usuario coordinador', '2024-08-26 19:08:16.770656', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3594, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:08:16.979454', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3595, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:08:17.089755', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3596, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:08:17.198097', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3597, 'Añadir Materia con id: 05AMA144, nombre: ANÁLISIS MATEMÁTICO I', 'Usuario coordinador', '2024-08-26 19:08:54.742227', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3598, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:08:54.978046', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3599, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:08:55.101924', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3600, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:08:55.21671', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3601, 'Añadir Materia con id: 05ING132, nombre: INGLES I', 'Usuario coordinador', '2024-08-26 19:09:20.501586', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3602, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:09:20.729718', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3603, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:09:20.848624', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3604, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:09:20.959543', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3605, 'Añadir Materia con id: 05BIO143, nombre: BIOLOGÍA', 'Usuario coordinador', '2024-08-26 19:09:43.858051', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3606, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:09:44.089207', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3607, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:09:44.203896', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3608, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:09:44.324616', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3609, 'Añadir Materia con id: 05LYC122, nombre: LENGUAJE Y COMUNICACION', 'Usuario coordinador', '2024-08-26 19:10:09.575494', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3610, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:10:09.798806', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3611, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:10:09.934032', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3612, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:10:10.049651', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3613, 'Añadir Materia con id: 05FIS143, nombre: FÍSICA', 'Usuario coordinador', '2024-08-26 19:10:50.916608', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3614, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:10:51.165096', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3615, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:10:51.272999', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3616, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:10:51.389218', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3617, 'Añadir Materia con id: 05TEI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-08-26 19:11:18.52265', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3618, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:11:18.757601', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3619, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:11:18.876074', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3620, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:11:18.996359', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3621, 'Añadir Materia con id: 05QUI153, nombre: QUÍMICA I', 'Usuario coordinador', '2024-08-26 19:11:44.856013', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3622, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:11:45.101441', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3623, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:11:45.22441', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3624, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:11:45.348094', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3625, 'Añadir Materia con id: 05AMA244, nombre: ANÁLISIS MATEMÁTICO II', 'Usuario coordinador', '2024-08-26 19:13:03.342176', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3626, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:13:03.577524', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3627, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:13:03.69512', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3628, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:13:03.811023', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3629, 'Añadir Materia con id: 05ING222, nombre: INGLÉS II', 'Usuario coordinador', '2024-08-26 19:13:35.228175', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3630, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:13:35.449447', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3631, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:13:35.567931', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3632, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:13:35.683768', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3633, 'Añadir Materia con id: 05ITA233, nombre: INTRODUCCIÓN A LA TECNOLOGÍA DE ALIMENTOS', 'Usuario coordinador', '2024-08-26 19:14:21.894617', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3634, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:14:22.094361', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3635, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:14:22.22081', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3636, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:14:22.342474', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3637, 'Añadir Materia con id: 05MBG253, nombre: MICROBIOLOGÍA GENERAL', 'Usuario coordinador', '2024-08-26 19:15:00.546629', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3638, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:15:00.758256', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3639, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:15:00.867609', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3640, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:15:00.976984', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3641, 'Añadir Materia con id: 05INA243, nombre: INFORMÁTICA APLICADA', 'Usuario coordinador', '2024-08-26 19:15:38.354408', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3642, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:15:38.583385', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3643, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:15:38.701578', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3644, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:15:38.822751', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3645, 'Añadir Materia con id: 05QOR253, nombre: QUÍMICA ORGÁNICA', 'Usuario coordinador', '2024-08-26 19:16:16.011377', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3646, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:16:16.240227', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3647, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:16:16.361634', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3648, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:16:16.476322', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3649, 'Añadir Materia con id: 05QUI253, nombre: QUÍMICA II', 'Usuario coordinador', '2024-08-26 19:16:52.454166', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3650, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:16:52.673622', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3651, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:16:52.782984', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3652, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:16:53.047264', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3653, 'Añadir Materia con id: 05ESG333, nombre: ESTADÍSTICA GENERAL', 'Usuario coordinador', '2024-08-26 19:17:45.072679', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3654, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:17:45.294994', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3655, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:17:45.562901', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3656, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:17:45.682755', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3657, 'Añadir Materia con id: 05ANI353, nombre: ANÁLISIS INSTRUMENTAL', 'Usuario coordinador', '2024-08-26 19:18:32.865801', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3658, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:18:33.109188', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3659, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:18:33.238797', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3660, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:18:33.355175', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3661, 'Añadir Materia con id: 05MBA353, nombre: MICROBIOLOGÍA DE ALIMENTOS', 'Usuario coordinador', '2024-08-26 19:19:22.59503', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3662, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:19:22.830583', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3663, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:19:23.057047', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3664, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:19:23.17994', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3665, 'Añadir Materia con id: 05HSI343, nombre: HIGIENE Y SEGURIDAD INDUSTRIAL', 'Usuario coordinador', '2024-08-26 19:20:08.634321', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3666, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:20:08.847324', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3667, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:20:08.966008', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3668, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:20:09.085547', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3669, 'Añadir Materia con id: 05OPU343, nombre: OPERACIONES UNITARIAS', 'Usuario coordinador', '2024-08-26 19:20:48.923223', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3670, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:20:49.13146', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3671, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:20:49.401287', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3672, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:20:49.525687', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3673, 'Añadir Materia con id: 05BQD333, nombre: BIOQUÍMICA GENERAL', 'Usuario coordinador', '2024-08-26 19:21:39.808752', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3674, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:21:40.0315', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3675, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:21:40.140849', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3676, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:21:40.256737', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3677, 'Añadir Materia con id: 05ESA433, nombre: ESTADÍSTICA APLICADA', 'Usuario coordinador', '2024-08-26 19:22:40.193707', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3678, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:22:40.417052', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3679, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:22:40.533937', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3680, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:22:40.657891', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3681, 'Añadir Materia con id: 05ASC433, nombre: ASEGURAMIENTO DE CALIDAD', 'Usuario coordinador', '2024-08-26 19:24:14.327713', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3682, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:24:14.55129', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3683, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:24:14.645458', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3684, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:24:14.754807', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3685, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:24:20.651399', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3686, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:24:21.631767', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3687, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:24:21.741627', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3688, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:24:21.852628', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3689, 'Actualizar Materia con id: 05ASC433, nombre: ASEGURAMIENTO DE CALIDAD', 'Usuario coordinador', '2024-08-26 19:24:41.213088', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3690, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:24:41.485878', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3691, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:24:41.485878', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3692, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:24:41.610532', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3693, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:24:41.614521', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3694, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:24:41.73021', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3695, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:24:41.735197', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3696, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:24:43.101008', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3697, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:24:45.355566', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3698, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:24:45.455595', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3699, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:24:45.717526', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3700, 'Añadir Materia con id: 05EMP433, nombre: EMPAQUE', 'Usuario coordinador', '2024-08-26 19:25:37.54811', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3701, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:25:37.77118', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3702, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:25:37.880851', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3703, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:25:37.985477', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3704, 'Añadir Materia con id: 05ANA453, nombre: ANÁLISIS DE ALIMENTOS', 'Usuario coordinador', '2024-08-26 19:26:38.129265', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3705, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:26:38.357732', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3706, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:26:38.471739', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3707, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:26:38.587609', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3708, 'Añadir Materia con id: 05MAI433, nombre: MANTENIMIENTO INDUSTRIAL', 'Usuario coordinador', '2024-08-26 19:27:22.637254', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3709, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:27:22.86517', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3710, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:27:22.9776', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3711, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:27:23.091493', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3712, 'Añadir Materia con id: 05QDA433, nombre: QUÍMICA DE ALIMENTOS', 'Usuario coordinador', '2024-08-26 19:28:02.096059', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3713, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:28:02.307955', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3714, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:28:02.423507', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3715, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:28:02.538022', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3716, 'Añadir Materia con id: 05NUT533, nombre: NUTRICIÓN', 'Usuario coordinador', '2024-08-26 19:28:59.187911', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3717, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:28:59.414218', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3718, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:28:59.538187', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3719, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:28:59.653109', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3720, 'Añadir Materia con id: 05TER564, nombre: TECNOLOGÍA DE CARNES', 'Usuario coordinador', '2024-08-26 19:29:51.899435', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3721, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:29:52.10447', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3722, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:29:52.221418', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3723, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:29:52.337599', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3724, 'Añadir Materia con id: 05TVF564, nombre: TECNOLOGÍA DE FRUTAS Y VEGETALES', 'Usuario coordinador', '2024-08-26 19:31:10.343729', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3725, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:31:10.56669', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3726, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:31:10.660417', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3727, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:31:10.769766', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3728, 'Añadir Materia con id: 05TEL564, nombre: TECNOLOGÍA DE LÁCTEOS', 'Usuario coordinador', '2024-08-26 19:32:03.338971', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3729, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:32:03.563609', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3730, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:32:03.677684', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3731, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:32:03.791595', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3732, 'Añadir Materia con id: 05TEC564, nombre: TECNOLOGÍA DE CEREALES', 'Usuario coordinador', '2024-08-26 19:33:11.31013', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3733, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:33:11.531686', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3734, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:33:11.640808', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3735, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:33:11.901893', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3736, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:33:15.743601', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3737, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:33:16.580239', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3738, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:33:16.695494', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3739, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:33:16.809273', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3740, 'Actualizar Materia con id: 05TEC564, nombre: TECNOLOGÍA DE CEREALES', 'Usuario coordinador', '2024-08-26 19:33:34.837763', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3741, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:33:35.113323', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3742, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:33:35.11831', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3743, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:33:35.238324', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3744, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:33:35.239323', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3745, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:33:35.355999', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3746, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:33:35.464472', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3747, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:33:36.910412', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3748, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:33:38.594932', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3749, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:33:38.839597', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3750, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:33:38.949337', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3751, 'Añadir Materia con id: 05SER522, nombre: SERVICIO COMUNITARIO', 'Usuario coordinador', '2024-08-26 19:34:21.400455', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3752, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:34:21.614211', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3753, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:34:21.723561', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3754, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:34:21.834073', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3755, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:34:23.541452', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3756, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:34:26.201228', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3757, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:34:26.320163', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3758, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:34:40.068109', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3759, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:34:40.163507', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3760, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:34:40.272318', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3761, 'Añadir Materia con id: 05PAS600, nombre: PASANTÍAS PROFESIONALES', 'Usuario coordinador', '2024-08-26 19:35:13.913601', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3762, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:35:14.135611', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3763, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:35:14.256421', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3764, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:35:14.373055', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3765, 'Añadir Materia con id: 05VNA622, nombre: VALOR NUTRITIVO DE LOS ALIMENTOS', 'Usuario coordinador', '2024-08-26 19:35:42.386462', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3766, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:35:42.607079', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3767, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:35:42.719352', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3768, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:35:42.835018', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3769, 'Añadir Materia con id: 05ELE622, nombre: ELECTIVA', 'Usuario coordinador', '2024-08-26 19:36:14.219727', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3770, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:36:14.416688', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3844, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:16.503187', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3771, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:36:14.631053', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3772, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:36:14.748774', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3773, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:36:48.563224', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3774, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:36:49.5854', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3775, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:36:49.704618', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3776, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:36:49.818428', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3777, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:38:15.184473', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3778, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:38:18.864192', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3779, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:38:18.983038', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3780, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:39:02.332543', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3781, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:39:02.460662', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3782, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:39:12.264034', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3783, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:39:12.393715', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3784, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:39:12.521364', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3785, 'Añadir Materia con id: 05SEM622, nombre: SEMINARIO', 'Usuario coordinador', '2024-08-26 19:39:35.499497', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3786, 'Obtener Docentes', 'Usuario coordinador', '2024-08-26 19:39:35.696914', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3787, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-26 19:39:35.806267', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3788, 'Obtener Carreras', 'Usuario coordinador', '2024-08-26 19:39:35.915612', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3789, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-27 16:15:16.673661', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3790, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:15:19.178053', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3791, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:15:19.28743', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3792, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:15:19.396781', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3793, 'Añadir Materia con id: 06INF153, nombre: INTRODUCCIÓN  A LA INFORMÁTICA', 'Usuario coordinador', '2024-08-27 16:16:22.797795', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3794, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:16:23.013188', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3795, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:16:23.122927', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3796, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:16:23.232471', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3797, 'Añadir Materia con id: 06AMA144, nombre: ANÁLISIS MATEMÁTICO I', 'Usuario coordinador', '2024-08-27 16:17:30.32712', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3798, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:17:30.539138', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3799, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:17:30.659886', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3800, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:17:30.770028', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3801, 'Añadir Materia con id: 06LYC122, nombre: LENGUAJE Y COMUNICACION', 'Usuario coordinador', '2024-08-27 16:17:55.90081', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3802, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:17:56.127482', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3803, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:17:56.241572', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3804, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:17:56.354198', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3805, 'Añadir Materia con id: 06EDF121, nombre: EDUCACIÓN FÍSICA', 'Usuario coordinador', '2024-08-27 16:18:26.050869', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3806, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:18:26.278205', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3807, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:18:26.398327', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3808, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:18:26.511447', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3809, 'Añadir Materia con id: 06ING132, nombre: INGLES I', 'Usuario coordinador', '2024-08-27 16:18:59.171274', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3810, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:18:59.392084', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3811, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:18:59.505122', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3812, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:18:59.622957', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3813, 'Añadir Materia con id: 06FIS143, nombre: FÍSICA', 'Usuario coordinador', '2024-08-27 16:19:31.61513', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3814, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:19:31.850485', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3815, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:19:31.964029', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3816, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:19:32.078327', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3817, 'Añadir Materia con id: 06EPA122, nombre: EDUC.Y PRESERVACIÓN DEL AMBIENTE', 'Usuario coordinador', '2024-08-27 16:19:54.929541', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3818, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:19:55.154314', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3819, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:19:55.264088', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3820, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:19:55.372721', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3821, 'Añadir Materia con id: 06ETI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-08-27 16:20:22.072637', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3822, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:20:22.271984', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3823, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:20:22.381333', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3824, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:20:22.485215', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3825, 'Añadir Materia con id: 06ALG233, nombre: ALGEBRA', 'Usuario coordinador', '2024-08-27 16:20:58.059874', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3826, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:20:58.412009', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3827, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:20:58.534373', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3828, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:20:58.649133', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3829, 'Añadir Materia con id: 06AMA244, nombre: ANÁLISIS MATEMÁTICO II', 'Usuario coordinador', '2024-08-27 16:21:33.534252', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3830, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:21:33.748387', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3831, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:21:33.862162', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3832, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:21:33.971383', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3833, 'Añadir Materia con id: 06ING222, nombre: INGLES II', 'Usuario coordinador', '2024-08-27 16:22:06.385879', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3834, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:22:06.601288', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3835, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:22:06.70267', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3836, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:22:06.812041', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3837, 'Añadir Materia con id: 06RYC244, nombre: REDES Y CIRCUITOS ELÉCTRICOS', 'Usuario coordinador', '2024-08-27 16:23:08.624402', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3838, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:23:08.853299', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3839, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:23:08.96476', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3840, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:23:09.079034', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3841, 'Añadir Materia con id: 06LCE232, nombre: LABORATORIO CIRCUITOS ELÉCTRICOS I', 'Usuario coordinador', '2024-08-27 16:24:15.958719', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3842, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:24:16.299568', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3843, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:24:16.393296', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3845, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:19.00826', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3846, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:24:20.347161', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3847, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:24:20.453895', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3848, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:20.553529', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3849, 'Actualizar Materia con id: 06LCE232, nombre: LABORATORIO CIRCUITOS ELÉCTRICOS I', 'Usuario coordinador', '2024-08-27 16:24:30.66667', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3850, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:24:30.9394', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3851, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:24:30.958768', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3852, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:24:31.071613', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3853, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:24:31.072393', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3854, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:31.188355', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3855, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:31.188355', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3856, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:36.336687', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3857, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:38.679335', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3858, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:24:40.988494', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3859, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:24:41.103325', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3860, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:41.205257', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3861, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:24:42.608327', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3862, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:24:42.733145', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3863, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:42.824207', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3864, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:24:47.282629', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3865, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:24:47.39422', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3866, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:24:47.502695', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3867, 'Añadir Materia con id: 06INS233, nombre: INSTRUMENTACIÓN', 'Usuario coordinador', '2024-08-27 16:25:22.46582', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3868, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:25:22.684271', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3869, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:25:22.820274', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3870, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:25:22.979168', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3871, 'Añadir Materia con id: 06LCE352, nombre: LABORATORIO CIRCUITOS ELÉCTRICOS I', 'Usuario coordinador', '2024-08-27 16:27:07.342915', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3872, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:27:07.556358', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3873, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:27:07.650057', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3874, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:27:07.76722', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3875, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:27:10.502571', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3876, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:27:11.573527', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3877, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:27:11.688089', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3878, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:27:11.794102', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3879, 'Actualizar Materia con id: 06LCE232, nombre: LABORATORIO CIRCUITOS ELÉCTRICOS', 'Usuario coordinador', '2024-08-27 16:27:24.018438', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3880, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:27:24.322256', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3881, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:27:24.324036', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3882, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:27:24.445938', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3883, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:27:24.451922', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3884, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:27:24.558655', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3885, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:27:24.565636', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3886, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:27:25.955324', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3887, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:27:28.513788', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3888, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:27:28.627874', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3889, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:27:28.734486', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3890, 'Añadir Materia con id: 06CIE344, nombre: CIRCUITOS ELECTRÓNICOS I', 'Usuario coordinador', '2024-08-27 16:28:42.057279', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3891, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:28:42.279464', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3892, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:28:42.545333', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3893, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:28:42.665252', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3894, 'Añadir Materia con id: 06CID344, nombre: CIRCUITOS DIGITALES', 'Usuario coordinador', '2024-08-27 16:29:36.361332', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3895, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:29:36.56704', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3896, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:29:36.660746', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3897, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:29:36.770124', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3898, 'Añadir Materia con id: 06TCO344, nombre: TEORÍA DE COMUNICACIONES I', 'Usuario coordinador', '2024-08-27 16:30:37.774255', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3899, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:30:37.969804', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3900, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:30:38.079161', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3901, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:30:38.17286', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3902, 'Añadir Materia con id: 06LCD352, nombre: LABORATORIO CIRCUITOS DIGITALES', 'Usuario coordinador', '2024-08-27 16:31:31.133878', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3903, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:31:31.343217', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3904, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:31:31.452566', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3905, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:31:31.686978', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3906, 'Añadir Materia con id: 06SYS333, nombre: SEÑALES Y SISTEMAS', 'Usuario coordinador', '2024-08-27 16:32:14.60428', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3907, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:32:14.809702', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3908, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:32:14.91905', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3909, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:32:15.028372', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3910, 'Añadir Materia con id: 06CIE444, nombre: CIRCUITOS ELECTRÓNICOS II', 'Usuario coordinador', '2024-08-27 16:33:42.586334', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3911, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:33:42.805373', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3912, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:33:42.920172', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3913, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:33:43.038006', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3914, 'Añadir Materia con id: 06LCE452, nombre: LABORATORIO CIRCUITOS ELECTRÓNICOS II', 'Usuario coordinador', '2024-08-27 16:35:15.244815', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3915, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:35:15.441522', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3916, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:35:15.535672', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3917, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:35:15.645012', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3918, 'Añadir Materia con id: 06TCO444, nombre: TEORÍA DE COMUNICACIÓN II', 'Usuario coordinador', '2024-08-27 16:36:30.759689', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3919, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:36:30.966399', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3920, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:36:31.083689', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3921, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:36:31.196456', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3922, 'Añadir Materia con id: 06MIC444, nombre: MICROPROCESADORES', 'Usuario coordinador', '2024-08-27 16:37:15.583828', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3923, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:37:15.815786', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3924, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:37:15.934081', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3925, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:37:16.046789', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3926, 'Añadir Materia con id: 06LMC452, nombre: LAB.MICROPROCESADORES', 'Usuario coordinador', '2024-08-27 16:38:10.455626', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3927, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:38:10.663246', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3928, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:38:10.772573', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3929, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:38:10.881924', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3930, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:38:13.070879', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3931, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:38:14.086722', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3932, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:38:14.20839', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3933, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:38:14.319229', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3934, 'Actualizar Materia con id: 06LMC452, nombre: LAB.MICROPROCESADORES', 'Usuario coordinador', '2024-08-27 16:38:28.176825', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3935, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:38:28.449043', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3936, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:38:28.470272', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3937, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:38:28.586692', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3938, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:38:28.593529', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3939, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:38:28.708119', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3940, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:38:28.711112', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3941, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:38:32.0316', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3942, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:38:32.130505', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3943, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:38:32.246659', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3944, 'Añadir Materia con id: 06SCO443, nombre: SISTEMA DE CONTROL', 'Usuario coordinador', '2024-08-27 16:39:26.798357', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3945, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:39:27.003485', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3946, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:39:27.112815', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3947, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:39:27.347135', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3948, 'Añadir Materia con id: 06SDC544, nombre: SISTEMA DE COMUNICACIÓN', 'Usuario coordinador', '2024-08-27 16:40:18.499394', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3949, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:40:18.966131', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3950, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:40:19.088302', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3951, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:40:19.209519', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3952, 'Añadir Materia con id: 06LSC532, nombre: LABORATORIO SISTEMAS DE COMUNICACIONES', 'Usuario coordinador', '2024-08-27 16:41:15.97833', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3953, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:41:16.185118', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3954, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:41:16.294924', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3955, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:41:16.388622', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3956, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:41:20.400202', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3957, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:41:21.405818', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3958, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:41:21.521124', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3959, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:41:21.629942', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3960, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:41:40.881446', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3961, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:41:41.000688', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3962, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:41:41.097368', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3963, 'Actualizar Materia con id: 06LSC532, nombre: LABORATORIO SISTEMAS DE COMUNICACIONES', 'Usuario coordinador', '2024-08-27 16:42:01.095652', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3964, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:42:01.365717', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3965, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:42:01.365717', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3966, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:42:01.49847', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3967, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:42:01.49847', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3968, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:42:01.614385', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3969, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:42:01.614385', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3970, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:42:02.812861', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3971, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:42:05.905332', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3972, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:42:06.021732', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3973, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:42:06.131182', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3974, 'Añadir Materia con id: 06CIE563, nombre: CIRCUITOS ELECTRÓNICOS III', 'Usuario coordinador', '2024-08-27 16:43:15.323266', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3975, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:43:15.528459', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3976, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:43:15.681026', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3977, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:43:15.77926', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3978, 'Añadir Materia con id: 06RDA563, nombre: REDES DE DATOS', 'Usuario coordinador', '2024-08-27 16:44:15.890145', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3979, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:44:16.094697', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3980, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:44:16.204187', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3981, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:44:16.313542', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3982, 'Añadir Materia con id: 06TLV543, nombre: TELEVISIÓN', 'Usuario coordinador', '2024-08-27 16:45:02.51659', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3983, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:45:02.890128', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3984, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:45:03.025901', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3985, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:45:03.143235', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3986, 'Añadir Materia con id: 06RTF543, nombre: REDES TELEFÓNICAS', 'Usuario coordinador', '2024-08-27 16:45:52.483272', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3987, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:45:52.696955', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3988, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:45:52.799749', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3989, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:45:52.909099', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3990, 'Añadir Materia con id: 06SER522, nombre: SERVICIO COMUNITARIO', 'Usuario coordinador', '2024-08-27 16:46:25.257887', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3991, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:46:25.47454', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3992, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:46:25.583967', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3993, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:46:25.677694', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3994, 'Añadir Materia con id: 06CMO622, nombre: COMUNICACIONES MÓVILES', 'Usuario coordinador', '2024-08-27 16:47:00.794705', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3995, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:47:00.998432', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3996, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:47:01.108237', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3997, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:47:01.321279', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3998, 'Añadir Materia con id: 06PASS600, nombre: PASANTÍAS PROFESIONALES', 'Usuario coordinador', '2024-08-27 16:47:36.794153', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (3999, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:47:37.004416', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4000, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:47:37.119528', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4001, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:47:37.228513', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4002, 'Añadir Materia con id: 06SEM622, nombre: SEMINARIO', 'Usuario coordinador', '2024-08-27 16:47:59.915584', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4003, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:48:00.134773', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4004, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:48:00.248317', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4005, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:48:00.357103', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4006, 'Añadir Materia con id: 06ELE622, nombre: ELECTIVA', 'Usuario coordinador', '2024-08-27 16:48:17.877497', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4007, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 16:48:18.215578', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4008, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 16:48:18.314767', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4009, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 16:48:18.438528', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4010, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 17:03:23.962964', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4011, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 17:03:24.083117', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4012, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 17:03:24.176817', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4013, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-08-27 17:03:50.02499', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4014, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-08-27 17:04:06.559903', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4015, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-27 17:04:08.302945', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4016, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-27 17:04:08.396673', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4017, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-27 17:04:10.588387', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4018, 'Obtener todas las Materias', 'Usuario control de estudio', '2024-08-27 17:04:12.948368', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4019, 'Obtener Docentes', 'Usuario control de estudio', '2024-08-27 17:04:13.048295', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4020, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-27 17:04:16.145881', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4021, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-08-27 17:07:09.135638', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4022, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 17:07:12.023713', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4023, 'Obtener Carreras', 'Caja', '2024-08-27 17:07:12.039333', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4024, 'Obtener Carreras', 'Caja', '2024-08-27 17:41:24.314925', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4025, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-08-27 17:49:07.642371', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4026, 'Obtener Coordinadores', 'admin', '2024-08-27 17:49:15.533275', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4027, 'Obtener Coordinadores', 'Caja', '2024-08-27 17:49:26.017214', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4028, 'Obtener Coordinadores', 'Caja', '2024-08-27 17:49:27.799271', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4029, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-08-27 22:46:46.141808', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4030, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-08-27 22:47:13.73634', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4031, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-08-27 22:51:40.227167', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4032, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-08-27 22:52:12.414549', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4033, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-08-27 22:56:37.184181', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4034, 'Obtener Carreras', 'Caja', '2024-08-27 22:58:25.872776', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4035, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 22:58:25.873773', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4036, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:00:28.214002', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4037, 'Obtener Carreras', 'Caja', '2024-08-27 23:00:28.220555', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4038, 'Añadir estudiante con cédula: V-601, nombre: Rhona Clemons', 'Caja', '2024-08-27 23:01:18.06662', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4039, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:01:18.388268', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4040, 'Obtener Carreras', 'Caja', '2024-08-27 23:01:18.388268', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4041, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:01:35.645026', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4042, 'Obtener Carreras', 'Caja', '2024-08-27 23:01:35.766162', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4043, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:01:35.951623', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4044, 'Obtener Carreras', 'Caja', '2024-08-27 23:01:35.955612', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4045, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:01:38.747584', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4046, 'Obtener Carreras', 'Caja', '2024-08-27 23:01:38.862567', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4047, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:01:42.521655', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4048, 'Obtener Carreras', 'Caja', '2024-08-27 23:01:42.52501', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4049, 'Añadir estudiante con cédula: E-159, nombre: Quail Rodriguez', 'Caja', '2024-08-27 23:02:14.034792', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4050, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:02:14.221327', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4051, 'Obtener Carreras', 'Caja', '2024-08-27 23:02:14.221327', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4052, 'Añadir estudiante con cédula: V-462, nombre: Benjamin Mack', 'Caja', '2024-08-27 23:02:31.244492', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4053, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:02:31.408134', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4054, 'Obtener Carreras', 'Caja', '2024-08-27 23:02:31.415115', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4055, 'Añadir estudiante con cédula: V-264, nombre: Raphael Mays', 'Caja', '2024-08-27 23:02:46.875339', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4056, 'Obtener Carreras', 'Caja', '2024-08-27 23:02:47.052759', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4057, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:02:47.053741', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4058, 'Añadir estudiante con cédula: V-66, nombre: Herrod Mckee', 'Caja', '2024-08-27 23:03:12.464354', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4059, 'Obtener Carreras', 'Caja', '2024-08-27 23:03:12.65196', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4060, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:03:12.652958', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4061, 'Añadir estudiante con cédula: E-67, nombre: Denton Forbes', 'Caja', '2024-08-27 23:03:31.65336', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4062, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:03:31.819936', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4063, 'Obtener Carreras', 'Caja', '2024-08-27 23:03:31.824923', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4064, 'Añadir estudiante con cédula: E-27, nombre: Madeline Pierce', 'Caja', '2024-08-27 23:03:58.530507', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4065, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:03:58.863043', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4066, 'Obtener Carreras', 'Caja', '2024-08-27 23:03:58.86803', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4067, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:01.775785', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4068, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:01.881432', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4069, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:02.981808', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4070, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:02.986773', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4071, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:06.071468', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4072, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:06.184504', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4073, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:13.178752', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4074, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:13.178752', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4075, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:14.046828', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4076, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:14.160279', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4077, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:24.931719', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4078, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:24.936955', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4079, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:29.587163', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4080, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:29.836675', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4081, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:31.001217', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4082, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:31.003213', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4083, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:34.001395', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4084, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:34.114304', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4085, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:35.266418', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4086, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:35.269403', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4087, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:38.856308', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4088, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:38.96402', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4089, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:41.000174', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4090, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:41.004357', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4091, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:43.603066', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4092, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:43.712767', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4093, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:45.202895', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4094, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:45.206885', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4095, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:45.933174', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4096, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:46.038915', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4097, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:47.099017', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4098, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:47.103976', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4099, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:47.518218', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4100, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:47.613958', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4101, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:52.073695', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4102, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:52.185892', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4103, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:53.070654', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4104, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:53.074615', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4105, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:57.134852', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4106, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:57.243272', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4107, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:04:58.464995', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4108, 'Obtener Carreras', 'Caja', '2024-08-27 23:04:58.471977', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4109, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:05:00.908914', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4110, 'Obtener Carreras', 'Caja', '2024-08-27 23:05:01.150189', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4111, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:05:01.341642', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4112, 'Obtener Carreras', 'Caja', '2024-08-27 23:05:01.351611', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4113, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:05:04.38154', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4114, 'Obtener Carreras', 'Caja', '2024-08-27 23:05:04.506206', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4115, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:05:06.365678', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4116, 'Obtener Carreras', 'Caja', '2024-08-27 23:05:06.369667', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4117, 'Añadir estudiante con cédula: E-16, nombre: Nero Sanford', 'Caja', '2024-08-27 23:07:45.840202', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4118, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:07:46.029436', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4119, 'Obtener Carreras', 'Caja', '2024-08-27 23:07:46.035387', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4120, 'Añadir estudiante con cédula: E-558, nombre: Isaiah Dalton', 'Caja', '2024-08-27 23:07:56.092932', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4121, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:07:56.263583', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4122, 'Obtener Carreras', 'Caja', '2024-08-27 23:07:56.268539', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4123, 'Añadir estudiante con cédula: E-17, nombre: Tad Wheeler', 'Caja', '2024-08-27 23:08:11.307057', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4124, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:08:11.473314', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4125, 'Obtener Carreras', 'Caja', '2024-08-27 23:08:11.479265', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4126, 'Añadir estudiante con cédula: E-932, nombre: Orla Morrow', 'Caja', '2024-08-27 23:08:23.094633', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4127, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:08:23.274372', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4128, 'Obtener Carreras', 'Caja', '2024-08-27 23:08:23.27637', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4129, 'Añadir estudiante con cédula: V-692, nombre: Evelyn Suarez', 'Caja', '2024-08-27 23:08:32.348055', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4130, 'Obtener Carreras', 'Caja', '2024-08-27 23:08:32.528778', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4131, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:08:32.529775', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4132, 'Añadir estudiante con cédula: V-321, nombre: Nichole Gilliam', 'Caja', '2024-08-27 23:08:44.131758', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4133, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:08:44.301482', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4134, 'Obtener Carreras', 'Caja', '2024-08-27 23:08:44.307466', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4135, 'Añadir estudiante con cédula: V-533, nombre: Flynn Velez', 'Caja', '2024-08-27 23:08:54.184354', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4136, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:08:54.363065', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4137, 'Obtener Carreras', 'Caja', '2024-08-27 23:08:54.373915', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4138, 'Añadir estudiante con cédula: V-854, nombre: Holly Sanford', 'Caja', '2024-08-27 23:09:02.491148', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4139, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:09:02.672663', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4140, 'Obtener Carreras', 'Caja', '2024-08-27 23:09:02.676652', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4141, 'Añadir estudiante con cédula: V-781, nombre: Asher Cain', 'Caja', '2024-08-27 23:09:15.718615', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4142, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:09:15.885875', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4143, 'Obtener Carreras', 'Caja', '2024-08-27 23:09:15.89186', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4144, 'Añadir estudiante con cédula: E-504, nombre: Pandora Schneider', 'Caja', '2024-08-27 23:10:00.039968', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4145, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:10:00.205099', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4146, 'Obtener Carreras', 'Caja', '2024-08-27 23:10:00.210086', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4147, 'Añadir estudiante con cédula: V-210, nombre: Ocean Fletcher', 'Caja', '2024-08-27 23:10:22.774669', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4148, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:10:22.960571', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4149, 'Obtener Carreras', 'Caja', '2024-08-27 23:10:22.971543', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4150, 'Añadir estudiante con cédula: V-27, nombre: Imani Gross', 'Caja', '2024-08-27 23:10:30.99944', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4151, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:10:31.169656', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4152, 'Obtener Carreras', 'Caja', '2024-08-27 23:10:31.173644', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4153, 'Añadir estudiante con cédula: V-981, nombre: Maxine Vance', 'Caja', '2024-08-27 23:10:41.773022', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4154, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:10:41.942639', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4155, 'Obtener Carreras', 'Caja', '2024-08-27 23:10:41.950617', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4235, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:19:22.38611', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4156, 'Añadir estudiante con cédula: V-725, nombre: Amela Haynes', 'Caja', '2024-08-27 23:10:52.223608', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4157, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:10:52.417653', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4158, 'Obtener Carreras', 'Caja', '2024-08-27 23:10:52.423638', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4159, 'Añadir estudiante con cédula: V-621, nombre: Irma May', 'Caja', '2024-08-27 23:11:02.462655', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4160, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:11:02.654146', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4161, 'Obtener Carreras', 'Caja', '2024-08-27 23:11:02.659133', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4162, 'Añadir estudiante con cédula: E-928, nombre: Madaline Tran', 'Caja', '2024-08-27 23:11:11.200675', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4163, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:11:11.402223', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4164, 'Obtener Carreras', 'Caja', '2024-08-27 23:11:11.40422', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4165, 'Añadir estudiante con cédula: V-113, nombre: Wilma Lancaster', 'Caja', '2024-08-27 23:11:18.537707', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4166, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:11:18.712042', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4167, 'Obtener Carreras', 'Caja', '2024-08-27 23:11:18.718026', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4168, 'Añadir estudiante con cédula: E-616, nombre: Shelby Workman', 'Caja', '2024-08-27 23:11:27.355739', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4169, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:11:27.547336', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4170, 'Obtener Carreras', 'Caja', '2024-08-27 23:11:27.5613', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4171, 'Añadir estudiante con cédula: V-650, nombre: Tucker Lindsey', 'Caja', '2024-08-27 23:11:36.572047', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4172, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:11:36.733844', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4173, 'Obtener Carreras', 'Caja', '2024-08-27 23:11:36.735837', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4174, 'Añadir estudiante con cédula: V-279, nombre: Oliver Carlson', 'Caja', '2024-08-27 23:11:47.429298', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4175, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:11:47.599995', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4176, 'Obtener Carreras', 'Caja', '2024-08-27 23:11:47.60598', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4177, 'Añadir estudiante con cédula: V-222, nombre: Aiko Gay', 'Caja', '2024-08-27 23:11:56.592984', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4178, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:11:56.757969', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4179, 'Obtener Carreras', 'Caja', '2024-08-27 23:11:56.765949', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4180, 'Añadir estudiante con cédula: E-564, nombre: Kermit Holt', 'Caja', '2024-08-27 23:12:07.819416', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4181, 'Obtener Carreras', 'Caja', '2024-08-27 23:12:08.009832', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4182, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:12:08.110562', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4183, 'Añadir estudiante con cédula: E-450, nombre: Hyatt Dodson', 'Caja', '2024-08-27 23:12:17.349568', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4184, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:12:17.557523', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4185, 'Obtener Carreras', 'Caja', '2024-08-27 23:12:17.563506', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4186, 'Añadir estudiante con cédula: V-83, nombre: Willa Willis', 'Caja', '2024-08-27 23:12:26.415611', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4187, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:12:26.609389', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4188, 'Obtener Carreras', 'Caja', '2024-08-27 23:12:26.620363', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4189, 'Añadir estudiante con cédula: V-668, nombre: Chloe Bell', 'Caja', '2024-08-27 23:12:37.387196', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4190, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:12:37.558983', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4191, 'Obtener Carreras', 'Caja', '2024-08-27 23:12:37.562972', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4192, 'Añadir estudiante con cédula: E-75, nombre: Melodie Montgomery', 'Caja', '2024-08-27 23:16:53.686995', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4193, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:16:53.856007', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4194, 'Obtener Carreras', 'Caja', '2024-08-27 23:16:53.864983', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4195, 'Añadir estudiante con cédula: E-6700, nombre: Ariana Sherman', 'Caja', '2024-08-27 23:17:12.177625', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4196, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:17:12.349035', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4197, 'Obtener Carreras', 'Caja', '2024-08-27 23:17:12.358011', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4198, 'Añadir estudiante con cédula: E-493, nombre: Rachel Chen', 'Caja', '2024-08-27 23:17:22.001943', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4199, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:17:22.169383', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4200, 'Obtener Carreras', 'Caja', '2024-08-27 23:17:22.176365', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4201, 'Añadir estudiante con cédula: E-653, nombre: Madonna Mooney', 'Caja', '2024-08-27 23:17:29.418207', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4202, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:17:29.593782', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4203, 'Obtener Carreras', 'Caja', '2024-08-27 23:17:29.597771', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4204, 'Añadir estudiante con cédula: E-392, nombre: Yeo Singleton', 'Caja', '2024-08-27 23:17:37.921135', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4205, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:17:38.101696', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4206, 'Obtener Carreras', 'Caja', '2024-08-27 23:17:38.105685', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4207, 'Añadir estudiante con cédula: E-611, nombre: Blaine Kane', 'Caja', '2024-08-27 23:17:46.685975', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4208, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:17:46.861156', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4209, 'Obtener Carreras', 'Caja', '2024-08-27 23:17:46.866143', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4210, 'Añadir estudiante con cédula: E-286, nombre: Elmo Oneill', 'Caja', '2024-08-27 23:18:03.614716', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4211, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:18:03.804636', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4212, 'Obtener Carreras', 'Caja', '2024-08-27 23:18:03.812616', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4213, 'Añadir estudiante con cédula: V-258, nombre: Guy Sanchez', 'Caja', '2024-08-27 23:18:13.916442', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4214, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:18:14.08544', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4215, 'Obtener Carreras', 'Caja', '2024-08-27 23:18:14.088432', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4216, 'Añadir estudiante con cédula: V-122, nombre: Chanda Dunn', 'Caja', '2024-08-27 23:18:23.372659', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4217, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:18:23.555869', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4218, 'Obtener Carreras', 'Caja', '2024-08-27 23:18:23.556867', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4219, 'Añadir estudiante con cédula: V-818, nombre: Chancellor Mcdonald', 'Caja', '2024-08-27 23:18:36.060419', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4220, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:18:36.261816', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4221, 'Obtener Carreras', 'Caja', '2024-08-27 23:18:36.263807', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4222, 'Añadir estudiante con cédula: V-619, nombre: Regina Wall', 'Caja', '2024-08-27 23:18:45.129461', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4223, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:18:45.302306', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4224, 'Obtener Carreras', 'Caja', '2024-08-27 23:18:45.31228', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4225, 'Añadir estudiante con cédula: V-721, nombre: Barry Wells', 'Caja', '2024-08-27 23:18:52.250955', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4226, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:18:52.429774', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4227, 'Obtener Carreras', 'Caja', '2024-08-27 23:18:52.430778', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4228, 'Añadir estudiante con cédula: E-535, nombre: Galena Dawson', 'Caja', '2024-08-27 23:19:02.445685', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4229, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:19:02.623738', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4230, 'Obtener Carreras', 'Caja', '2024-08-27 23:19:02.628725', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4231, 'Añadir estudiante con cédula: V-626, nombre: Kenyon Holt', 'Caja', '2024-08-27 23:19:13.167909', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4232, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:19:13.333466', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4233, 'Obtener Carreras', 'Caja', '2024-08-27 23:19:13.338453', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4234, 'Añadir estudiante con cédula: E-372, nombre: Hector Mcintosh', 'Caja', '2024-08-27 23:19:22.217443', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4236, 'Obtener Carreras', 'Caja', '2024-08-27 23:19:22.389132', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4237, 'Añadir estudiante con cédula: E-638, nombre: Abel Gibbs', 'Caja', '2024-08-27 23:19:41.427487', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4238, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:19:41.621772', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4239, 'Obtener Carreras', 'Caja', '2024-08-27 23:19:41.623767', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4240, 'Añadir estudiante con cédula: E-844, nombre: Mallory Kirk', 'Caja', '2024-08-27 23:19:46.846627', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4241, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:19:47.010189', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4242, 'Obtener Carreras', 'Caja', '2024-08-27 23:19:47.017168', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4243, 'Añadir estudiante con cédula: V-830, nombre: Zeus Ramos', 'Caja', '2024-08-27 23:19:53.949109', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4244, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:19:54.145215', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4245, 'Obtener Carreras', 'Caja', '2024-08-27 23:19:54.156154', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4246, 'Añadir estudiante con cédula: E-240, nombre: Zahir Hart', 'Caja', '2024-08-27 23:20:04.593422', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4247, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:20:04.793694', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4248, 'Obtener Carreras', 'Caja', '2024-08-27 23:20:04.79668', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4249, 'Añadir estudiante con cédula: E-254, nombre: Tanner Shannon', 'Caja', '2024-08-27 23:20:11.638649', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4250, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:20:11.829149', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4251, 'Obtener Carreras', 'Caja', '2024-08-27 23:20:11.837132', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4252, 'Añadir estudiante con cédula: V-707, nombre: Sydnee Benjamin', 'Caja', '2024-08-27 23:20:19.084739', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4253, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:20:19.253949', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4254, 'Obtener Carreras', 'Caja', '2024-08-27 23:20:19.2599', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4255, 'Añadir estudiante con cédula: E-32, nombre: Tanisha Snider', 'Caja', '2024-08-27 23:20:27.02018', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4256, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:20:27.211356', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4257, 'Obtener Carreras', 'Caja', '2024-08-27 23:20:27.21335', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4258, 'Añadir estudiante con cédula: E-318, nombre: Nita Guy', 'Caja', '2024-08-27 23:20:35.130988', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4259, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:20:35.307342', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4260, 'Obtener Carreras', 'Caja', '2024-08-27 23:20:35.309312', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4261, 'Añadir estudiante con cédula: V-243, nombre: Cally Day', 'Caja', '2024-08-27 23:20:44.376173', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4262, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:20:44.544527', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4263, 'Obtener Carreras', 'Caja', '2024-08-27 23:20:44.547519', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4264, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:20:56.297357', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4265, 'Obtener Carreras', 'Caja', '2024-08-27 23:20:56.399913', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4266, 'Obtener Carreras', 'Caja', '2024-08-27 23:21:09.453128', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4267, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:21:09.447144', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4268, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:21:14.14457', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4269, 'Obtener Carreras', 'Caja', '2024-08-27 23:21:14.259163', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4270, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:21:44.87945', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4271, 'Obtener Carreras', 'Caja', '2024-08-27 23:21:44.884405', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4272, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-27 23:22:06.705526', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4273, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:22:09.73199', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4274, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:22:09.835688', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4275, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:22:09.939403', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4276, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:22:11.717276', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4277, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:22:13.897258', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4278, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:22:14.006828', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4279, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:22:14.114185', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4280, 'Actualizar Materia con id: 01AGM122, nombre: ALGORÍTMICA', 'Usuario coordinador', '2024-08-27 23:23:20.896167', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4281, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:23:21.203894', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4282, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:23:21.215862', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4283, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:23:21.330078', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4284, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:23:21.340047', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4285, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:23:21.45038', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4286, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:23:21.458343', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4287, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:23:23.122499', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4288, 'Actualizar Configuración con id: 1, ciclo: 2024-1', 'Usuario coordinador', '2024-08-27 23:24:19.302703', 'General', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4289, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:24:48.076562', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4290, 'Obtener Carreras', 'Caja', '2024-08-27 23:24:48.184871', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4291, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-08-27 23:24:50.652244', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4292, 'Obtener Carreras', 'Caja', '2024-08-27 23:24:50.860614', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4293, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:25:11.386733', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4294, 'Obtener Carreras', 'Caja', '2024-08-27 23:25:11.492783', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4295, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:25:12.305947', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4296, 'Obtener Carreras', 'Caja', '2024-08-27 23:25:12.310935', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4297, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:25:16.603093', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4298, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:25:16.700564', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4299, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:25:22.954018', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4300, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:25:24.336982', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4301, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:25:24.437743', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4302, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:25:42.578033', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4303, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:25:42.674213', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4304, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:25:49.631029', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4305, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:25:52.778185', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4306, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:25:52.884993', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4307, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:26:00.209188', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4308, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:26:00.306662', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4309, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:26:02.282307', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4310, 'Añadir pago para el estudiante con cédula: E-16, monto: <models.entities.monto.Monto object at 0x000001B1CF036D80>', 'Caja', '2024-08-27 23:27:05.34691', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4311, 'Obtener pago con id: 63', 'Caja', '2024-08-27 23:27:05.97708', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4312, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-08-27 23:27:06.069278', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4313, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:27:17.032204', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4314, 'Añadir pago para el estudiante con cédula: E-16, monto: <models.entities.monto.Monto object at 0x000001B1CF5309E0>', 'Caja', '2024-08-27 23:28:02.917631', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4315, 'Obtener pago con id: 64', 'Caja', '2024-08-27 23:28:03.510486', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4316, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-08-27 23:28:03.608155', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4317, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:28:12.781714', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4318, 'Inicio de sesión del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:28:20.764437', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4319, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:28:21.585271', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4320, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:28:21.678784', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4321, 'Obtener histórico del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:28:32.911587', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4322, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:28:34.083147', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4323, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:28:34.184102', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4324, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:28:35.196623', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4325, 'Obtener Docentes', 'Nero Sanford', '2024-08-27 23:28:35.294865', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4326, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:28:58.842269', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4327, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:29:17.732802', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4328, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:29:17.82776', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4329, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:29:19.777095', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4330, 'Obtener Docentes', 'Nero Sanford', '2024-08-27 23:29:19.87785', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4331, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:31:13.566268', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4332, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:33:54.326202', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4333, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:33:54.423941', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4334, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:34:04.723305', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4335, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:34:06.149363', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4336, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:34:06.273079', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4337, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:34:06.397823', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4338, 'Actualizar Materia con id: 01LYC122, nombre: LENGUAJE Y COMUNICACION', 'Usuario coordinador', '2024-08-27 23:34:34.098519', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4339, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:34:34.446122', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4340, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:34:34.452109', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4341, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:34:34.590611', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4342, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:34:34.601582', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4343, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:34:34.823986', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4344, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:34:34.823986', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4345, 'Actualizar Materia con id: 01ETI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-08-27 23:35:03.850924', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4346, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:35:04.176699', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4347, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:35:04.191656', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4348, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:35:04.32308', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4349, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:35:04.333054', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4350, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:35:04.447263', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4351, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:35:04.456239', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4352, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:35:11.153964', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4353, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:35:12.97835', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4354, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:35:13.100054', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4355, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:35:13.222263', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4356, 'Actualizar Materia con id: 01ING132, nombre: INGLES I', 'Usuario coordinador', '2024-08-27 23:35:41.512968', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4357, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:35:41.809643', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4358, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:35:41.821611', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4359, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:35:41.969217', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4360, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:35:41.975201', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4361, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:35:42.131421', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4362, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:35:42.131421', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4363, 'Actualizar Materia con id: 01INF132, nombre: INTRODUCCIÓN A LA INFORMÁTICA', 'Usuario coordinador', '2024-08-27 23:36:06.386067', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4364, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:36:06.692397', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4365, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:36:06.702376', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4366, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:36:06.853247', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4367, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:36:06.85923', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4368, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:36:06.994867', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4369, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:36:06.994867', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4370, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:36:30.630765', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4371, 'Obtener Docentes', 'Nero Sanford', '2024-08-27 23:36:30.733677', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4372, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:36:45.30182', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4373, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:36:45.407146', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4374, 'Actualizar Materia con id: 01AMA144, nombre: ANÁLISIS MATEMÁTICO I', 'Usuario coordinador', '2024-08-27 23:37:11.355065', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4375, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:37:11.685467', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4376, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:37:11.702422', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4377, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:37:11.848284', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4378, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:37:11.851276', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4379, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:37:11.982873', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4380, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:37:11.991848', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4381, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:37:14.786242', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4382, 'Obtener Docentes', 'Nero Sanford', '2024-08-27 23:37:14.906184', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4383, 'Actualizar Materia con id: 01COG164, nombre: CONTABILIDAD GENERAL', 'Usuario coordinador', '2024-08-27 23:38:02.95425', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4384, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:38:03.470458', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4385, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:38:03.47744', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4386, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:38:03.618063', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4387, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:38:03.626042', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4388, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:38:03.761345', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4389, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:38:03.871052', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4390, 'Actualizar Materia con id: 01EPA122, nombre: EDUC.Y PRESERVACIÓN DEL AMBIENTE', 'Usuario coordinador', '2024-08-27 23:38:24.929523', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4391, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:38:25.241283', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4392, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:38:25.257241', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4393, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:38:25.378915', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4394, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:38:25.397865', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4395, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:38:25.50845', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4396, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:38:25.520418', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4397, 'Actualizar Materia con id: 01EDF121, nombre: EDUCACIÓN FÍSICA', 'Usuario coordinador', '2024-08-27 23:38:53.280253', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4398, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:38:53.606892', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4399, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:38:53.621853', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4400, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:38:53.754274', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4401, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:38:53.767239', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4402, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:38:53.91086', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4403, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:38:53.91086', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4404, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:39:08.873447', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4405, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:39:08.970117', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4406, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:39:11.609599', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4407, 'Obtener Docentes', 'Nero Sanford', '2024-08-27 23:39:11.712324', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4408, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:10.503251', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4409, 'Añadir materia 01AGM122 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:10.697922', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4410, 'Añadir materia 01ING132 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:10.888274', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4411, 'Añadir materia 01ETI122 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:11.073774', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4412, 'Añadir materia 01INF132 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:11.260289', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4413, 'Añadir materia 01AMA144 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:11.457977', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4414, 'Añadir materia 01EPA122 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:11.641304', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4415, 'Añadir materia 01EDF121 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:11.827896', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4416, 'Añadir materia 01LYC122 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:12.014226', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4417, 'Añadir materia 01COG164 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:12.200549', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4418, 'Obtener horario del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:12.637385', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4419, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:13.031869', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4420, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:40:13.129192', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4421, 'Obtener horario del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:18.046881', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4422, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:42.525466', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4423, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:40:42.620782', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4424, 'Obtener histórico del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:47.965931', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4425, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:54.224227', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4426, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:40:54.331626', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4427, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:55.818984', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4428, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-27 23:40:59.50756', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4429, 'Obtener Carreras', 'Nero Sanford', '2024-08-27 23:40:59.609621', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4430, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:47:20.596041', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4431, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:20.700754', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4432, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:22.93513', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4433, 'Obtener Carreras', 'Caja', '2024-08-27 23:47:22.937125', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4434, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:25.882755', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4435, 'Obtener Carreras', 'Caja', '2024-08-27 23:47:25.998502', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4436, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:29.570344', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4437, 'Obtener Carreras', 'Caja', '2024-08-27 23:47:29.577327', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4438, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:47:34.482842', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4439, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:34.580951', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4440, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:37.162975', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4441, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:47:40.035801', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4442, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:40.138892', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4443, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:41.972913', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4444, 'Obtener Carreras', 'Caja', '2024-08-27 23:47:41.975905', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4445, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:44.419577', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4446, 'Obtener Carreras', 'Caja', '2024-08-27 23:47:44.52824', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4447, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:48.121339', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4448, 'Obtener Carreras', 'Caja', '2024-08-27 23:47:48.127323', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4449, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:47:50.294133', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4450, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:50.39571', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4451, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:47:51.750536', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4452, 'Añadir pago para el estudiante con cédula: E-240, monto: <models.entities.monto.Monto object at 0x000001B1CF0C6D20>', 'Caja', '2024-08-27 23:48:05.931107', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4453, 'Obtener pago con id: 65', 'Caja', '2024-08-27 23:48:06.367775', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4454, 'Obtener estudiante con cédula: E-240', 'Caja', '2024-08-27 23:48:06.465004', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4455, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:48:11.336517', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4456, 'Añadir pago para el estudiante con cédula: E-240, monto: <models.entities.monto.Monto object at 0x000001B1CF0F6960>', 'Caja', '2024-08-27 23:48:25.662313', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4457, 'Obtener pago con id: 66', 'Caja', '2024-08-27 23:48:26.108181', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4458, 'Obtener estudiante con cédula: E-240', 'Caja', '2024-08-27 23:48:26.206705', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4459, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:48:28.91216', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4460, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:48:35.375889', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4461, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:48:35.479249', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4462, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:48:37.413932', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4463, 'Obtener Carreras', 'Caja', '2024-08-27 23:48:37.42093', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4464, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:48:40.302871', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4465, 'Obtener Carreras', 'Caja', '2024-08-27 23:48:40.412792', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4466, 'Obtener estudiante con cédula: E-240', 'Caja', '2024-08-27 23:48:42.105193', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4467, 'Obtener Carreras', 'Caja', '2024-08-27 23:48:42.220884', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4468, 'Inicio de sesión del estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:48:53.309968', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4469, 'Obtener notas del estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:48:53.907174', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4470, 'Obtener Carreras', 'Zahir Hart', '2024-08-27 23:48:54.006817', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4471, 'Obtener materias válidas para inscripción del estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:48:55.771767', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4472, 'Obtener Docentes', 'Zahir Hart', '2024-08-27 23:48:55.875512', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4473, 'Obtener materias válidas para inscripción del estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:05.937462', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4474, 'Añadir materia 01AGM122 al estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:06.126544', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4475, 'Añadir materia 01ETI122 al estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:06.312883', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4476, 'Añadir materia 01ING132 al estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:06.503441', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4477, 'Añadir materia 01INF132 al estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:06.690839', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4478, 'Añadir materia 01AMA144 al estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:06.880996', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4479, 'Añadir materia 01EPA122 al estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:07.067288', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4480, 'Añadir materia 01EDF121 al estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:07.253329', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4481, 'Añadir materia 01LYC122 al estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:07.438658', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4482, 'Añadir materia 01COG164 al estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:07.624296', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4483, 'Obtener horario del estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:08.010376', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4484, 'Obtener notas del estudiante con cédula: E-240', 'Zahir Hart', '2024-08-27 23:49:08.362669', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4485, 'Obtener Carreras', 'Zahir Hart', '2024-08-27 23:49:08.456981', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4486, 'Obtener todos los estudiantes', 'Zahir Hart', '2024-08-27 23:49:16.848088', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4487, 'Obtener Carreras', 'Zahir Hart', '2024-08-27 23:49:16.95397', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4488, 'Obtener Carreras', 'Zahir Hart', '2024-08-27 23:49:24.020327', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4489, 'Obtener todos los estudiantes', 'Zahir Hart', '2024-08-27 23:49:24.016337', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4490, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:49:26.39524', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4491, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:49:26.501954', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4492, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:49:27.648949', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4493, 'Añadir pago para el estudiante con cédula: E-254, monto: <models.entities.monto.Monto object at 0x000001B1CF604B60>', 'Caja', '2024-08-27 23:49:41.389064', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4494, 'Obtener pago con id: 67', 'Caja', '2024-08-27 23:49:41.815525', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4495, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-08-27 23:49:41.922461', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4496, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:49:45.643778', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4497, 'Añadir pago para el estudiante con cédula: E-254, monto: <models.entities.monto.Monto object at 0x000001B1CF036FF0>', 'Caja', '2024-08-27 23:50:13.16483', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4498, 'Obtener pago con id: 68', 'Caja', '2024-08-27 23:50:13.651569', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4499, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-08-27 23:50:13.744684', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4500, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:50:18.335083', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4501, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:50:24.935826', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4502, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:50:25.041058', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4503, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:50:26.641625', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4504, 'Obtener Carreras', 'Caja', '2024-08-27 23:50:26.645621', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4505, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:50:29.117345', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4506, 'Obtener Carreras', 'Caja', '2024-08-27 23:50:29.230334', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4507, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:50:30.786884', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4508, 'Obtener Carreras', 'Caja', '2024-08-27 23:50:30.790873', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4509, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:50:32.827521', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4510, 'Obtener Carreras', 'Caja', '2024-08-27 23:50:32.94188', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4511, 'Obtener estudiante con cédula: E-240', 'Caja', '2024-08-27 23:50:34.834701', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4512, 'Obtener Carreras', 'Caja', '2024-08-27 23:50:34.938234', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4513, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:50:38.175479', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4514, 'Obtener Carreras', 'Caja', '2024-08-27 23:50:38.28012', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4515, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-08-27 23:50:40.524365', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4516, 'Obtener Carreras', 'Caja', '2024-08-27 23:50:40.640011', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4517, 'Inicio de sesión del estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:50:49.74719', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4518, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:50:50.163579', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4519, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:50:50.260808', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4520, 'Obtener materias válidas para inscripción del estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:50:52.250586', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4521, 'Obtener Docentes', 'Tanner Shannon', '2024-08-27 23:50:52.352291', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4522, 'Obtener materias válidas para inscripción del estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:00.646972', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4523, 'Añadir materia 01AGM122 al estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:00.989221', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4524, 'Añadir materia 01ETI122 al estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:01.187902', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4525, 'Añadir materia 01ING132 al estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:01.384306', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4526, 'Añadir materia 01INF132 al estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:01.592547', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4527, 'Añadir materia 01AMA144 al estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:01.789251', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4528, 'Añadir materia 01EPA122 al estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:01.997924', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4529, 'Añadir materia 01EDF121 al estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:02.199718', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4530, 'Añadir materia 01LYC122 al estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:02.388415', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4531, 'Añadir materia 01COG164 al estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:02.577241', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4532, 'Obtener horario del estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:02.965518', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4533, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-08-27 23:51:03.3893', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4534, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:51:03.495', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4535, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:51:06.97394', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4536, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:51:07.074505', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4537, 'Obtener estudiante con cédula: E-75', 'Tanner Shannon', '2024-08-27 23:51:14.388269', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4538, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:51:14.498158', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4539, 'Actualizar estudiante con cédula: E-75, nombre: Melodie Montgomery', 'Tanner Shannon', '2024-08-27 23:52:15.388049', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4540, 'Obtener estudiante con cédula: E-75', 'Tanner Shannon', '2024-08-27 23:52:15.586043', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4541, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:15.700303', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4542, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:15.93512', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4543, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:52:15.936117', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4544, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:52:23.566267', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4545, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:23.675809', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4546, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:52:25.048216', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4547, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:25.054201', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4548, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:52:28.583309', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4549, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:28.694957', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4550, 'Obtener estudiante con cédula: E-75', 'Tanner Shannon', '2024-08-27 23:52:36.320291', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4551, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:36.433615', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4552, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:52:40.682056', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4553, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:40.786254', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4554, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:52:42.903085', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4555, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:42.903085', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4556, 'Obtener estudiante con cédula: E-75', 'Tanner Shannon', '2024-08-27 23:52:44.757239', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4557, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:44.866508', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4558, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:52:46.069397', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4559, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:46.173903', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4560, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:52:47.473282', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4561, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:52:47.479266', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4562, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:52:50.771916', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4563, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:52:50.870744', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4564, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:52:52.814366', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4565, 'Añadir pago para el estudiante con cédula: E-75, monto: <models.entities.monto.Monto object at 0x000001B1CF604CE0>', 'Caja', '2024-08-27 23:53:07.916869', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4566, 'Obtener pago con id: 69', 'Caja', '2024-08-27 23:53:08.341213', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4567, 'Obtener estudiante con cédula: E-75', 'Caja', '2024-08-27 23:53:08.443622', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4568, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:53:09.809459', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4569, 'Añadir pago para el estudiante con cédula: E-75, monto: <models.entities.monto.Monto object at 0x000001B1CF5CC1D0>', 'Caja', '2024-08-27 23:53:22.208244', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4570, 'Obtener pago con id: 70', 'Caja', '2024-08-27 23:53:22.656958', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4571, 'Obtener estudiante con cédula: E-75', 'Caja', '2024-08-27 23:53:22.762301', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4572, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:53:37.344462', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4573, 'Obtener todos los pagos', 'Caja', '2024-08-27 23:53:38.557997', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4574, 'Obtener todos los estudiantes', 'Caja', '2024-08-27 23:53:38.662177', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4575, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:53:40.882143', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4576, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:53:40.887142', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4577, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-08-27 23:53:43.181334', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4578, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:53:43.290476', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4579, 'Obtener estudiante con cédula: E-75', 'Tanner Shannon', '2024-08-27 23:53:50.241399', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4580, 'Obtener Carreras', 'Tanner Shannon', '2024-08-27 23:53:50.358071', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4581, 'Inicio de sesión del estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:02.146801', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4582, 'Obtener notas del estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:02.563818', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4583, 'Obtener Carreras', 'Melodie Montgomery', '2024-08-27 23:54:02.659483', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4584, 'Obtener materias válidas para inscripción del estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:04.103687', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4585, 'Obtener Docentes', 'Melodie Montgomery', '2024-08-27 23:54:04.206567', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4586, 'Obtener materias válidas para inscripción del estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:14.751123', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4587, 'Añadir materia 01AGM122 al estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:14.946495', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4588, 'Añadir materia 01ETI122 al estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:15.136122', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4589, 'Añadir materia 01ING132 al estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:15.327944', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4590, 'Añadir materia 01INF132 al estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:15.51551', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4591, 'Añadir materia 01AMA144 al estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:15.711162', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4592, 'Añadir materia 01EPA122 al estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:16.034167', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4593, 'Añadir materia 01EDF121 al estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:16.221947', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4594, 'Añadir materia 01LYC122 al estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:16.407114', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4595, 'Añadir materia 01COG164 al estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:16.595054', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4596, 'Obtener horario del estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:16.980013', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4597, 'Obtener notas del estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:17.329578', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4598, 'Obtener Carreras', 'Melodie Montgomery', '2024-08-27 23:54:17.427288', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4599, 'Obtener horario del estudiante con cédula: E-75', 'Melodie Montgomery', '2024-08-27 23:54:25.028038', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4600, 'Obtener todos los estudiantes', 'Melodie Montgomery', '2024-08-27 23:54:33.838327', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4601, 'Obtener Carreras', 'Melodie Montgomery', '2024-08-27 23:54:33.944226', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4602, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:54:39.986311', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4603, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:54:44.133652', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4604, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:54:46.885556', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4605, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:54:47.002676', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4606, 'Obtener Materia con id: 01AGM122', 'Usuario coordinador', '2024-08-27 23:54:49.809493', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4607, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:54:58.124481', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4608, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:54:58.247413', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4609, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:54:58.364997', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4610, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:55:13.36606', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4611, 'Obtener Carreras', 'Usuario coordinador', '2024-08-27 23:56:10.809313', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4612, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-27 23:56:13.967465', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4613, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:56:14.093174', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4614, 'Obtener Materia con id: 01AGM122', 'Usuario coordinador', '2024-08-27 23:56:17.99779', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4615, 'Obtener Docentes', 'Usuario coordinador', '2024-08-27 23:56:23.824924', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4616, 'Inicio de sesión del docente con cédula: V-30555724', 'henrry@gmail.com', '2024-08-27 23:58:27.557132', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4617, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-27 23:58:28.059777', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4618, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-27 23:58:28.060774', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4619, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-27 23:58:48.913511', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4620, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-27 23:58:48.918497', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4621, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-27 23:58:52.772573', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4622, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:01:09.805858', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4623, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-08-28 00:01:46.808344', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4624, 'Obtener Carreras', 'Caja', '2024-08-28 00:01:46.9179', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4625, 'Inicio de sesión del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:01:56.104276', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4626, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:01:56.529623', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4627, 'Obtener Carreras', 'Nero Sanford', '2024-08-28 00:01:56.629273', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4628, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:02:18.260945', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4629, 'Obtener Carreras', 'Nero Sanford', '2024-08-28 00:02:18.362334', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4630, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:03:37.675333', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4631, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:03:37.72121', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4632, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:04:16.103031', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4633, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:04:16.154565', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4634, 'Subir archivo: planificacion.pdf a la carpeta: 01AGM122 y ciclo: 2024-1', 'Henrry bourgeot', '2024-08-28 00:04:22.963755', 'Archivos', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4635, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:04:23.199128', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4636, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:04:23.243434', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4637, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:04:37.081978', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4638, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:04:37.135857', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4639, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:04:37.745776', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4640, 'Subir archivo: planificacion.pdf a la carpeta: 01AGM122 y ciclo: 2024-1', 'Henrry bourgeot', '2024-08-28 00:04:49.32266', 'Archivos', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4641, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:04:49.540559', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4642, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:04:49.586436', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4643, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:04:55.416741', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4644, 'Obtener Carreras', 'Nero Sanford', '2024-08-28 00:04:55.525508', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4645, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:04:56.056925', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4646, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 00:05:12.905202', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4647, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:05:12.905202', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4648, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 00:05:14.700038', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4649, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 00:05:22.157176', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4650, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:05:42.700529', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4651, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:05:42.88333', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4652, 'Modificar materia del estudiante con cédula: E-16, campo: nota1, valor: 19', 'Henrry bourgeot', '2024-08-28 00:05:55.497265', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4653, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:05:55.716612', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4654, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:05:55.761491', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4655, 'Modificar materia del estudiante con cédula: E-240, campo: nota1, valor: 17', 'Henrry bourgeot', '2024-08-28 00:06:02.955909', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4656, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:06:03.189084', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4657, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:06:03.236956', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4658, 'Modificar materia del estudiante con cédula: E-254, campo: nota1, valor: 12', 'Henrry bourgeot', '2024-08-28 00:06:08.027655', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4659, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:06:08.275547', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4660, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:06:08.323426', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4661, 'Modificar materia del estudiante con cédula: E-75, campo: nota1, valor: 20', 'Henrry bourgeot', '2024-08-28 00:06:14.130711', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4662, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:06:14.356573', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4663, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:06:14.401453', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4664, 'Obtener histórico del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:06:23.481444', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4665, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:06:44.125388', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4666, 'Obtener Carreras', 'Nero Sanford', '2024-08-28 00:06:44.226437', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4667, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:06:44.426551', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4668, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:06:56.517919', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4669, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:07:01.343507', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4670, 'Obtener Carreras', 'Nero Sanford', '2024-08-28 00:07:01.450582', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4671, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:07:01.643523', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4672, 'Obtener horario del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:07:07.565481', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4673, 'Añadir Petición para el estudiante con cédula: E-240, materia: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:08:02.039553', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4674, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:08:02.156241', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4675, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:08:02.203116', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4676, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:08:02.891379', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4677, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-08-28 00:08:25.702418', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4678, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-08-28 00:08:29.169209', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4679, 'Actualizar Petición con id: 5', 'Usuario control de estudio', '2024-08-28 00:08:32.616507', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4680, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-08-28 00:08:32.820375', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4681, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:08:37.229905', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4682, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 00:08:38.260124', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4683, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 00:08:39.397781', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4684, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 00:08:41.156933', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4685, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:08:41.157897', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4686, 'Actualizar Petición con id: 5', 'Caja', '2024-08-28 00:08:48.860684', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4687, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 00:10:12.902431', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4688, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:10:25.091301', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4689, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:10:25.27839', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4690, 'Modificar materia del estudiante con cédula: E-16, campo: nota2, valor: 08', 'Henrry bourgeot', '2024-08-28 00:10:38.945094', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4691, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:10:39.15798', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4692, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:10:39.201863', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4693, 'Inicio de sesión del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:11:52.846397', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4694, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:11:53.44775', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4695, 'Obtener Carreras', 'Nero Sanford', '2024-08-28 00:11:53.544313', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4696, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:11:57.029454', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4697, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:11:57.1291', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4698, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:12:06.986172', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4699, 'Obtener Carreras', 'Nero Sanford', '2024-08-28 00:12:07.086484', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4700, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:12:47.664738', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4701, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-08-28 00:12:47.675716', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4702, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:12:47.781418', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4703, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:12:47.791949', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4704, 'Obtener Carreras', 'Nero Sanford', '2024-08-28 00:12:48.355754', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4705, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:12:52.435513', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4706, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:13:01.454942', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4707, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:13:01.725467', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4708, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:15:55.674783', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4709, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-08-28 00:15:55.68077', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4710, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:15:56.040179', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4711, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:15:56.307891', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4712, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:15:56.67073', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4713, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:16:02.666362', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4714, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:17:20.656532', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4715, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:17:20.799506', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4716, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:17:50.262214', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4717, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:17:50.395868', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4718, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:20:27.886941', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4719, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:20:28.019543', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4720, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-08-28 00:21:41.542425', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4721, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:21:41.728927', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4722, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:21:41.825186', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4723, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:21:41.842141', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4724, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:21:42.069602', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4725, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:21:45.025929', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4726, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 00:22:46.586649', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4727, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-08-28 00:22:46.630531', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4728, 'Obtener Materia con id: 01AGM122', 'Henrry bourgeot', '2024-08-28 00:22:46.654471', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4729, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:22:46.677406', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4730, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:22:47.172301', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4731, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:22:50.45693', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4732, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-28 00:24:00.217952', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4733, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 00:24:03.288446', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4734, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-28 00:24:05.670368', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4735, 'Obtener Docentes', 'Usuario coordinador', '2024-08-28 00:24:05.793139', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4736, 'Obtener Docentes', 'Usuario coordinador', '2024-08-28 00:24:10.010369', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4737, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-28 00:24:10.123948', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4738, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 00:24:10.241625', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4739, 'Actualizar Materia con id: 01AGM122, nombre: ALGORÍTMICA', 'Usuario coordinador', '2024-08-28 00:24:20.461253', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4740, 'Obtener Docentes', 'Usuario coordinador', '2024-08-28 00:24:20.768875', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4741, 'Obtener Docentes', 'Usuario coordinador', '2024-08-28 00:24:20.88005', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4742, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-28 00:24:20.899996', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4743, 'Obtener todas las Materias', 'Usuario coordinador', '2024-08-28 00:24:21.020184', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4744, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 00:24:21.041129', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4745, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 00:24:21.148841', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4746, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:24:31.326282', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4747, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:24:31.458672', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4748, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:24:37.69851', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4749, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:24:37.880979', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4750, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:24:39.671631', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4751, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:24:39.799261', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4752, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:24:41.438495', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4753, 'Obtener Docentes', 'Nero Sanford', '2024-08-28 00:24:41.569844', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4754, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:24:49.573441', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4755, 'Añadir materia 01AGM122 al estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:24:49.768901', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4756, 'Obtener horario del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:24:50.21521', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4757, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-08-28 00:24:50.583555', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4758, 'Obtener Carreras', 'Nero Sanford', '2024-08-28 00:24:50.678302', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4759, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-08-28 00:24:50.85287', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4792, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-28 20:22:30.639257', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4793, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:24:56.164383', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4794, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:24:56.274189', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4795, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:24:58.016367', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4796, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:24:58.121129', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4797, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:24:59.699854', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4798, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:24:59.798328', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4799, 'Obtener estudiante con cédula: E-159', 'Usuario coordinador', '2024-08-28 20:25:10.516632', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4800, 'Obtener Notas del Estudiante con cédula: E-159', 'Usuario coordinador', '2024-08-28 20:25:10.663472', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4801, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:25:11.064731', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4802, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:25:11.189518', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4803, 'Obtener estudiante con cédula: E-16', 'Usuario coordinador', '2024-08-28 20:25:15.50122', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4804, 'Obtener Notas del Estudiante con cédula: E-16', 'Usuario coordinador', '2024-08-28 20:25:15.640842', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4805, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:25:18.718117', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4806, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:25:18.980708', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4807, 'Obtener estudiante con cédula: E-17', 'Usuario coordinador', '2024-08-28 20:25:21.122773', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4808, 'Obtener Notas del Estudiante con cédula: E-17', 'Usuario coordinador', '2024-08-28 20:25:21.266915', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4809, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:25:21.52337', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4810, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:25:21.639875', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4811, 'Obtener estudiante con cédula: E-240', 'Usuario coordinador', '2024-08-28 20:25:23.973427', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4812, 'Obtener Notas del Estudiante con cédula: E-240', 'Usuario coordinador', '2024-08-28 20:25:24.250858', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4813, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:25:30.782983', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4814, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:25:30.888034', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4815, 'Obtener estudiante con cédula: E-254', 'Usuario coordinador', '2024-08-28 20:26:00.604349', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4816, 'Obtener Notas del Estudiante con cédula: E-254', 'Usuario coordinador', '2024-08-28 20:26:00.748872', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4817, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:26:01.950997', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4818, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:26:02.056402', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4819, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-08-28 20:26:26.112621', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4820, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:27:32.410806', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4821, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:27:32.652877', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4822, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-08-28 20:28:44.373619', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4823, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:28:56.087829', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4824, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:28:56.193246', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4825, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:29:00.232093', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4826, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:29:00.346685', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4827, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:29:03.08174', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4828, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:29:03.186758', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4829, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:29:04.400695', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4830, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:29:04.505763', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4831, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-08-28 20:29:19.206985', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4832, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:29:25.554164', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4833, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:29:25.647891', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4834, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:29:27.057884', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4835, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:29:27.302581', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4836, 'Obtener estudiante con cédula: E-159', 'Usuario control de estudio', '2024-08-28 20:29:29.886585', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4837, 'Obtener Notas del Estudiante con cédula: E-159', 'Usuario control de estudio', '2024-08-28 20:29:30.012055', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4838, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:29:30.308439', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4839, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:29:30.426835', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4840, 'Obtener estudiante con cédula: E-16', 'Usuario control de estudio', '2024-08-28 20:29:32.635568', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4841, 'Obtener Notas del Estudiante con cédula: E-16', 'Usuario control de estudio', '2024-08-28 20:29:32.768279', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4842, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:29:34.739663', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4843, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:29:34.844695', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4844, 'Obtener estudiante con cédula: E-17', 'Usuario control de estudio', '2024-08-28 20:29:36.074137', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4845, 'Obtener Notas del Estudiante con cédula: E-17', 'Usuario control de estudio', '2024-08-28 20:29:36.223918', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4846, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:29:36.458577', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4847, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:29:36.566586', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4848, 'Obtener estudiante con cédula: E-240', 'Usuario control de estudio', '2024-08-28 20:29:38.378757', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4849, 'Obtener Notas del Estudiante con cédula: E-240', 'Usuario control de estudio', '2024-08-28 20:29:38.532646', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4850, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:29:41.692379', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4851, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:29:41.797674', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4852, 'Generar PDF de estudiante con cédula: E-240', 'Caja', '2024-08-28 20:29:45.148201', 'Generar PDF', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4853, 'Obtener estudiante con cédula: E-254', 'Usuario control de estudio', '2024-08-28 20:30:32.562798', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4854, 'Obtener Notas del Estudiante con cédula: E-254', 'Usuario control de estudio', '2024-08-28 20:30:32.696182', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4855, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:30:34.766295', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4856, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:30:34.879616', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4857, 'Generar PDF de estudiante con cédula: E-254', 'Caja', '2024-08-28 20:30:37.780771', 'Generar PDF', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4858, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:30:50.709328', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4859, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:30:50.81257', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4860, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:30:56.239152', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4861, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:30:56.336663', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4862, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-08-28 20:30:58.204416', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4863, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:30:58.309793', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4864, 'Obtener Carreras', 'Usuario control de estudio', '2024-08-28 20:31:00.812712', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4865, 'Obtener todas las Materias', 'Usuario control de estudio', '2024-08-28 20:31:05.354782', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4866, 'Obtener Docentes', 'Usuario control de estudio', '2024-08-28 20:31:05.484215', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4867, 'Obtener Materia con id: 01IDO543', 'Usuario control de estudio', '2024-08-28 20:31:11.865344', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4868, 'Obtener Carreras', 'Caja', '2024-08-28 20:31:25.908079', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4869, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-08-28 20:32:28.383308', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4870, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-08-28 20:32:56.981988', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4871, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:33:01.411569', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4872, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:33:01.508868', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4873, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:33:05.178264', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4874, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:33:05.284868', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4875, 'Obtener estudiante con cédula: E-558', 'Usuario coordinador', '2024-08-28 20:33:07.88904', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4876, 'Obtener Notas del Estudiante con cédula: E-558', 'Usuario coordinador', '2024-08-28 20:33:08.033351', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4877, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:33:08.27259', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4878, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:33:08.383163', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4879, 'Obtener estudiante con cédula: E-254', 'Usuario coordinador', '2024-08-28 20:33:09.854722', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4880, 'Obtener Notas del Estudiante con cédula: E-254', 'Usuario coordinador', '2024-08-28 20:33:09.983376', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4881, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:33:13.726677', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4882, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:33:13.832978', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4883, 'Generar PDF de estudiante con cédula: E-254', 'Caja', '2024-08-28 20:33:15.86421', 'Generar PDF', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4884, 'Obtener estudiante con cédula: E-240', 'Usuario coordinador', '2024-08-28 20:33:25.952706', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4885, 'Obtener Notas del Estudiante con cédula: E-240', 'Usuario coordinador', '2024-08-28 20:33:26.103587', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4886, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:33:28.449979', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4887, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:33:28.553017', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4888, 'Generar PDF de estudiante con cédula: E-240', 'Caja', '2024-08-28 20:33:31.804721', 'Generar PDF', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4889, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:36:03.455367', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4890, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:36:03.559149', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4891, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:37:17.812523', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4892, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:37:17.92223', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4893, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:37:23.751953', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4894, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:37:24.891832', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4895, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:37:24.98575', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4896, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:37:35.288581', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4897, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:37:35.375269', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4898, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-08-28 20:37:41.037169', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4899, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:37:41.138932', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4900, 'Obtener pago con id: 64', 'Caja', '2024-08-28 20:37:51.3144', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4901, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-08-28 20:37:51.470614', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4902, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-08-28 20:38:25.626999', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4903, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:38:25.740796', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4904, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:38:28.095197', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4905, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:38:28.194962', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4906, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-08-28 20:39:02.737636', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4907, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:39:09.666448', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4908, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:39:09.762354', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4909, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:39:24.849748', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4910, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:39:26.324973', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4911, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:39:26.43435', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4912, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:40:11.584175', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4913, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:40:11.701644', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4914, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-08-28 20:40:21.568575', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4915, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:40:21.667561', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4916, 'Obtener pago con id: 68', 'Caja', '2024-08-28 20:40:24.322245', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4917, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-08-28 20:40:24.486111', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4918, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-08-28 20:40:42.351177', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4919, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:40:42.468423', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4920, 'Obtener pago con id: 67', 'Caja', '2024-08-28 20:40:45.856887', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4921, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-08-28 20:40:45.973567', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4922, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-08-28 20:40:48.566564', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4923, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:40:48.670947', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4924, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:40:49.741433', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4925, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:40:49.845534', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4926, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:40:58.043189', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4927, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:40:58.159812', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4928, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:40:59.746403', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4929, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:40:59.858944', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4930, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:01.57642', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4931, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:01.68119', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4932, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:04.331391', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4933, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:04.434811', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4934, 'Obtener estudiante con cédula: E-616', 'Usuario coordinador', '2024-08-28 20:41:05.922952', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4935, 'Obtener Notas del Estudiante con cédula: E-616', 'Usuario coordinador', '2024-08-28 20:41:06.070132', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4936, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:06.307056', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4937, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:06.407952', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4938, 'Obtener estudiante con cédula: E-928', 'Usuario coordinador', '2024-08-28 20:41:07.626217', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4939, 'Obtener Notas del Estudiante con cédula: E-928', 'Usuario coordinador', '2024-08-28 20:41:07.77708', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4940, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:08.012595', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4941, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:08.119019', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4942, 'Obtener estudiante con cédula: E-318', 'Usuario coordinador', '2024-08-28 20:41:09.545382', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4943, 'Obtener Notas del Estudiante con cédula: E-318', 'Usuario coordinador', '2024-08-28 20:41:09.693689', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4944, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:10.078745', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4945, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:10.184376', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4946, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:11.361027', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4947, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:11.466062', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4948, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:15.805921', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4949, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:15.905554', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4950, 'Obtener estudiante con cédula: E-558', 'Usuario coordinador', '2024-08-28 20:41:17.775625', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4951, 'Obtener Notas del Estudiante con cédula: E-558', 'Usuario coordinador', '2024-08-28 20:41:17.923232', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4952, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:18.160588', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4953, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:18.268897', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4954, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:19.204897', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4955, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:19.308214', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4956, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:23.668638', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4957, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:23.780368', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4958, 'Obtener estudiante con cédula: E-75', 'Usuario coordinador', '2024-08-28 20:41:25.996125', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4959, 'Obtener Notas del Estudiante con cédula: E-75', 'Usuario coordinador', '2024-08-28 20:41:26.136758', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4960, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:28.287922', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4961, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:28.538593', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4962, 'Generar PDF de estudiante con cédula: E-75', 'Caja', '2024-08-28 20:41:32.387911', 'Generar PDF', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4963, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-08-28 20:41:50.849399', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4964, 'Obtener Carreras', 'Usuario coordinador', '2024-08-28 20:41:50.946979', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4965, 'Obtener Docentes', 'Usuario coordinador', '2024-08-28 20:41:54.386006', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4966, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:43:21.340516', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4967, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:43:21.478217', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4968, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:43:40.910192', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4969, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:43:41.139694', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4970, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:43:59.506437', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4971, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:43:59.625969', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4972, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:44:05.235131', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4973, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:44:05.477605', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4974, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:44:06.68488', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4975, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:44:06.803265', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4976, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:44:27.771327', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4977, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:44:27.872292', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4978, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:44:29.020134', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4979, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:44:29.129512', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4980, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:44:44.035374', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4981, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:44:44.14364', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4982, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:44:45.046679', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4983, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:44:45.155566', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4984, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:45:03.630194', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4985, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:45:03.731085', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4986, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:45:04.928048', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4987, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:45:05.026183', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4988, 'Inicio de sesión del docente con cédula: V-30555724', 'henrry@gmail.com', '2024-08-28 20:53:13.944269', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4989, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 20:53:14.51313', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4990, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:53:14.51313', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4991, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:53:21.713444', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4992, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 20:53:21.721423', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4993, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:53:25.713316', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4994, 'Obtener Materia con id: 07ICF543', 'Henrry bourgeot', '2024-08-28 20:53:39.615665', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4995, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:53:45.628415', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4996, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:53:46.763941', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4997, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:53:48.355977', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4998, 'Obtener Materia con id: 01AMA144', 'Henrry bourgeot', '2024-08-28 20:53:54.024863', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (4999, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:53:56.962159', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5000, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:53:57.949139', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5001, 'Actualizar contraseña del docente: Henrry bourgeot', 'henrry@gmail.com', '2024-08-28 20:54:39.501591', 'Docentes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5002, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:54:39.823041', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5003, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 20:54:39.823041', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5004, 'Inicio de sesión del docente con cédula: V-30555724', 'henrry@gmail.com', '2024-08-28 20:54:56.091414', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5005, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-08-28 20:54:56.588674', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5006, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-08-28 20:54:56.60431', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5007, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:55:33.692228', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5008, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:55:33.802091', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5009, 'Obtener todos los pagos', 'Caja', '2024-08-28 20:55:34.673095', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5010, 'Obtener todos los estudiantes', 'Caja', '2024-08-28 20:55:34.779524', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5011, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-05 20:21:57.379517', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5012, 'Obtener todos los estudiantes', 'Caja', '2024-09-05 20:33:39.371028', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5013, 'Obtener Carreras', 'Caja', '2024-09-05 20:33:39.373083', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5014, 'Obtener todos los estudiantes', 'Caja', '2024-09-05 20:33:41.514825', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5015, 'Obtener Carreras', 'Caja', '2024-09-05 20:33:41.613002', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5016, 'Obtener todos los estudiantes', 'Caja', '2024-09-05 20:34:03.552814', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5017, 'Obtener Carreras', 'Caja', '2024-09-05 20:34:03.554819', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5018, 'Obtener todos los estudiantes', 'Caja', '2024-09-05 20:34:09.064985', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5019, 'Obtener Carreras', 'Caja', '2024-09-05 20:34:09.176197', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5020, 'Obtener Carreras', 'Caja', '2024-09-05 20:34:19.816995', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5021, 'Obtener todos los estudiantes', 'Caja', '2024-09-05 20:34:19.816995', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5022, 'Obtener todos los estudiantes', 'Caja', '2024-09-05 20:34:24.536643', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5023, 'Obtener Carreras', 'Caja', '2024-09-05 20:34:24.652238', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5024, 'Obtener estudiante con cédula: V-601', 'Caja', '2024-09-05 20:34:44.812198', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5025, 'Obtener Carreras', 'Caja', '2024-09-05 20:34:44.907109', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5026, 'Obtener todos los estudiantes', 'Caja', '2024-09-05 20:42:52.544032', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5027, 'Obtener Carreras', 'Caja', '2024-09-05 20:42:52.789991', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5028, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-09 16:35:29.98149', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5029, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:16:52.275956', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5030, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:16:52.577718', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5031, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:04.543079', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5032, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:04.939943', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5033, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:05.046145', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5034, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:08.939941', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5035, 'Obtener Carreras', 'Caja', '2024-09-09 17:17:08.939941', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5036, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:10.358306', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5037, 'Obtener Carreras', 'Caja', '2024-09-09 17:17:10.458125', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5038, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:15.987135', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5039, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:16.086614', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5040, 'Obtener estudiante con cédula: E-159', 'Caja', '2024-09-09 17:17:22.277615', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5041, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:22.390271', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5042, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:26.165222', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5043, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:26.274792', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5044, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:28.500706', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5045, 'Obtener Carreras', 'Caja', '2024-09-09 17:17:28.516327', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5046, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:29.523212', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5047, 'Obtener Carreras', 'Caja', '2024-09-09 17:17:29.633437', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5048, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:32.103977', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5049, 'Obtener Carreras', 'Caja', '2024-09-09 17:17:32.106957', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5050, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:34.308711', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5051, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:34.394539', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5052, 'Obtener estudiante con cédula: E-17', 'Caja', '2024-09-09 17:17:39.90503', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5053, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:40.021706', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5054, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:41.357465', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5055, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:41.470013', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5056, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:47.978542', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5057, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:48.20453', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5058, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:48.309704', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5059, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:51.284312', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5060, 'Obtener Carreras', 'Caja', '2024-09-09 17:17:51.284312', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5061, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:52.412645', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5062, 'Obtener Carreras', 'Caja', '2024-09-09 17:17:52.521093', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5063, 'Obtener Carreras', 'Caja', '2024-09-09 17:17:55.383635', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5064, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:55.383635', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5065, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:17:57.065111', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5066, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:17:57.168775', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5067, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 17:18:02.326766', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5068, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:18:02.428624', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5069, 'Obtener pago con id: 67', 'Caja', '2024-09-09 17:18:11.042519', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5070, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 17:18:11.153944', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5071, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 17:18:22.324021', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5072, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:18:22.431604', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5073, 'Obtener pago con id: 68', 'Caja', '2024-09-09 17:18:24.526813', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5074, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 17:18:24.686519', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5075, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 17:18:32.841646', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5076, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:18:32.950163', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5077, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:18:33.827596', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5078, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:18:34.105241', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5079, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:18:36.664138', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5080, 'Obtener Carreras', 'Caja', '2024-09-09 17:18:36.664138', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5081, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:18:37.418373', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5082, 'Obtener Carreras', 'Caja', '2024-09-09 17:18:37.533412', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5083, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:19:05.412604', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5084, 'Obtener Carreras', 'Caja', '2024-09-09 17:19:05.412604', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5085, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:19:08.450918', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5086, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:19:08.544646', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5087, 'Obtener estudiante con cédula: E-159', 'Caja', '2024-09-09 17:19:13.648547', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5088, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:19:13.74462', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5089, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:19:17.466067', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5090, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:19:17.586089', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5091, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:19:20.812112', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5092, 'Obtener Carreras', 'Caja', '2024-09-09 17:19:20.813101', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5093, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:19:22.336061', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5094, 'Obtener Carreras', 'Caja', '2024-09-09 17:19:22.444834', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5095, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:19:24.94337', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5096, 'Obtener Carreras', 'Caja', '2024-09-09 17:19:24.94337', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5097, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:19:26.616368', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5098, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:19:26.721152', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5099, 'Obtener estudiante con cédula: E-240', 'Caja', '2024-09-09 17:19:32.59082', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5100, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:19:32.704595', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5101, 'Obtener pago con id: 65', 'Caja', '2024-09-09 17:19:35.79596', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5102, 'Obtener estudiante con cédula: E-240', 'Caja', '2024-09-09 17:19:35.898211', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5103, 'Obtener estudiante con cédula: E-240', 'Caja', '2024-09-09 17:19:37.599444', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5104, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:19:37.709961', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5105, 'Obtener pago con id: 66', 'Caja', '2024-09-09 17:19:38.968779', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5106, 'Obtener estudiante con cédula: E-240', 'Caja', '2024-09-09 17:19:39.069501', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5107, 'Obtener estudiante con cédula: E-240', 'Caja', '2024-09-09 17:19:40.285929', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5108, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:19:40.394477', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5109, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:19:42.08859', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5110, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:19:42.197967', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5111, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:19:59.653831', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5112, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:19:59.748936', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5113, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:20:03.3738', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5114, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:20:03.482417', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5115, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:20:24.336629', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5116, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:20:24.42843', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5117, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:20:25.726686', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5118, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:20:25.832047', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5119, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:20:37.807685', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5120, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:20:37.900943', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5121, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:20:39.383746', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5122, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:20:39.491904', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5123, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:20:51.963623', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5124, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:20:52.065425', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5125, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:20:53.372297', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5126, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:20:53.4857', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5127, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:21:03.180981', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5128, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:21:03.28776', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5129, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:21:04.641311', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5130, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:21:04.759868', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5131, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:21:41.872624', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5132, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:21:41.981088', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5133, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:21:43.075854', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5134, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:21:43.187292', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5135, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:21:48.89945', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5136, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:21:49.001424', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5137, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:21:49.963085', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5138, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:21:50.070357', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5139, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:21:54.703119', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5140, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:21:54.804871', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5141, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:21:55.708038', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5142, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:21:55.816717', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5143, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:22:01.83566', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5144, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:22:04.579388', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5145, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:22:04.687982', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5146, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:22:05.50499', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5147, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:31:25.726636', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5148, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:31:25.833236', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5149, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:31:38.763934', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5150, 'Obtener Carreras', 'Caja', '2024-09-09 17:31:38.763934', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5151, 'Añadir estudiante con cédula: V-30555724, nombre: Francisco silva', 'Caja', '2024-09-09 17:33:28.75509', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5152, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:33:29.102042', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5153, 'Obtener Carreras', 'Caja', '2024-09-09 17:33:29.102042', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5154, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:33:35.62462', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5155, 'Obtener Carreras', 'Caja', '2024-09-09 17:33:35.727082', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5156, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:33:39.833871', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5157, 'Obtener Carreras', 'Caja', '2024-09-09 17:33:39.839021', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5158, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:33:43.550557', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5159, 'Obtener Carreras', 'Caja', '2024-09-09 17:33:43.659485', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5160, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:33:49.596724', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5161, 'Obtener Carreras', 'Caja', '2024-09-09 17:33:49.596724', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5162, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:33:52.286921', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5163, 'Obtener Carreras', 'Caja', '2024-09-09 17:33:52.400496', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5164, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:33:54.673397', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5165, 'Obtener Carreras', 'Caja', '2024-09-09 17:33:54.673397', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5166, 'Obtener Carreras', 'Caja', '2024-09-09 17:33:56.39375', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5167, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:33:56.39375', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5168, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:34:00.908097', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5169, 'Obtener Carreras', 'Caja', '2024-09-09 17:34:01.00168', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5170, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:34:09.800478', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5171, 'Obtener Carreras', 'Caja', '2024-09-09 17:34:09.807508', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5172, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:34:15.711261', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5173, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:34:15.764233', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5174, 'Obtener Carreras', 'Caja', '2024-09-09 17:34:15.823106', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5175, 'Obtener Carreras', 'Caja', '2024-09-09 17:34:15.870254', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5176, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 17:34:18.313533', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5177, 'Obtener Carreras', 'Caja', '2024-09-09 17:34:18.407292', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5178, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:34:24.272956', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5179, 'Obtener Carreras', 'Caja', '2024-09-09 17:34:24.372473', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5180, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:34:26.440111', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5181, 'Obtener Carreras', 'Caja', '2024-09-09 17:34:26.445808', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5182, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:34:57.888412', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5183, 'Obtener Carreras', 'Caja', '2024-09-09 17:34:57.995066', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5184, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:34:59.089985', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5185, 'Obtener Carreras', 'Caja', '2024-09-09 17:34:59.089985', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5186, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:35:01.674091', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5187, 'Obtener Carreras', 'Caja', '2024-09-09 17:35:01.679054', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5188, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:35:44.616987', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5189, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:35:44.721312', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5190, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:35:51.912417', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5191, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:35:52.167578', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5192, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:35:52.28013', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5193, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 17:35:58.448778', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5194, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:35:58.545355', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5195, 'Obtener pago con id: 68', 'Caja', '2024-09-09 17:36:03.40736', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5196, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 17:36:03.577394', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5197, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 17:36:05.002455', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5198, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:36:05.110361', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5199, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:36:05.869862', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5200, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:36:05.979212', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5201, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:36:09.342778', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5202, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:36:10.278032', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5203, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:36:10.387602', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5204, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:36:37.328954', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5205, 'Obtener Carreras', 'Caja', '2024-09-09 17:36:37.335908', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5206, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:36:42.660346', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5207, 'Obtener Carreras', 'Caja', '2024-09-09 17:36:42.77339', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5208, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 17:36:44.005432', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5209, 'Obtener Carreras', 'Caja', '2024-09-09 17:36:44.103291', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5210, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:37:01.965654', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5211, 'Obtener Carreras', 'Caja', '2024-09-09 17:37:02.059409', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5212, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:37:03.181345', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5213, 'Obtener Carreras', 'Caja', '2024-09-09 17:37:03.181345', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5214, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:37:05.834392', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5215, 'Obtener Carreras', 'Caja', '2024-09-09 17:37:05.941863', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5216, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 17:37:10.680542', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5217, 'Obtener Carreras', 'Caja', '2024-09-09 17:37:10.796568', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5218, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-09-09 17:40:46.813199', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5219, 'Actualizar Configuración con id: 1, ciclo: 2024-1', 'Usuario coordinador', '2024-09-09 17:41:01.086589', 'General', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5220, 'Inicio de sesión del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:09.035982', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5221, 'Inicio de sesión del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:09.323174', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5222, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:09.786039', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5223, 'Obtener Carreras', 'Tanner Shannon', '2024-09-09 17:41:09.895694', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5224, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:10.190168', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5225, 'Obtener Carreras', 'Tanner Shannon', '2024-09-09 17:41:10.292577', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5226, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:41:10.487824', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5227, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:17.619884', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5228, 'Obtener Carreras', 'Tanner Shannon', '2024-09-09 17:41:17.736431', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5229, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:41:17.917749', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5230, 'Actualizar Configuración con id: 1, ciclo: 2024-1', 'Usuario coordinador', '2024-09-09 17:41:26.741823', 'General', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5231, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:29.989116', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5232, 'Obtener Carreras', 'Tanner Shannon', '2024-09-09 17:41:30.106188', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5233, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:41:30.830517', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5234, 'Obtener horario del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:32.389386', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5235, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:35.666328', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5236, 'Obtener Carreras', 'Tanner Shannon', '2024-09-09 17:41:35.770267', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5237, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:41:35.9686', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5238, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:38.267748', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5239, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:41:42.525511', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5240, 'Obtener Carreras', 'Tanner Shannon', '2024-09-09 17:41:42.622803', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5241, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:41:42.793156', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5242, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-09-09 17:42:38.326619', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5243, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-09 17:42:39.075409', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5244, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-09 17:42:39.084906', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5245, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-09 17:43:36.66386', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5246, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-09 17:43:36.66386', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5247, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-09 17:43:41.88302', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5248, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-09 17:43:51.533938', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5249, 'Modificar materia del estudiante con cédula: E-254, campo: nota2, valor: 15', 'elibeth curalli', '2024-09-09 17:44:02.003418', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5250, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-09 17:44:02.215572', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5251, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-09 17:44:02.262434', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5252, 'Obtener notas del estudiante con cédula: E-254', 'Tanner Shannon', '2024-09-09 17:44:08.667005', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5253, 'Obtener todos los estudiantes', 'Tanner Shannon', '2024-09-09 17:45:46.193944', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5254, 'Obtener Carreras', 'Tanner Shannon', '2024-09-09 17:45:46.309492', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5255, 'Obtener estudiante con cédula: E-240', 'Tanner Shannon', '2024-09-09 17:45:51.718986', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5256, 'Obtener Carreras', 'Tanner Shannon', '2024-09-09 17:45:51.823483', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5257, 'Inicio de sesión del estudiante con cédula: E-240', 'Zahir Hart', '2024-09-09 17:46:10.967901', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5258, 'Obtener notas del estudiante con cédula: E-240', 'Zahir Hart', '2024-09-09 17:46:11.5303', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5259, 'Obtener Carreras', 'Zahir Hart', '2024-09-09 17:46:11.624056', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5260, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:46:11.797827', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5261, 'Obtener horario del estudiante con cédula: E-240', 'Zahir Hart', '2024-09-09 17:46:12.879863', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5262, 'Obtener notas del estudiante con cédula: E-240', 'Zahir Hart', '2024-09-09 17:46:14.890968', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5263, 'Obtener Carreras', 'Zahir Hart', '2024-09-09 17:46:14.988785', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5264, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:46:15.151848', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5265, 'Obtener notas del estudiante con cédula: E-240', 'Zahir Hart', '2024-09-09 17:46:16.258252', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5266, 'Obtener notas del estudiante con cédula: E-240', 'Zahir Hart', '2024-09-09 17:46:19.993154', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5267, 'Obtener Carreras', 'Zahir Hart', '2024-09-09 17:46:20.203601', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5268, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:46:20.377607', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5269, 'Modificar materia del estudiante con cédula: E-240, campo: nota2, valor: 18', 'elibeth curalli', '2024-09-09 17:46:29.295107', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5270, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-09 17:46:29.646442', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5271, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-09 17:46:29.693278', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5272, 'Obtener notas del estudiante con cédula: E-240', 'Zahir Hart', '2024-09-09 17:46:33.309508', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5273, 'Obtener notas del estudiante con cédula: E-240', 'Zahir Hart', '2024-09-09 17:46:36.397792', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5274, 'Obtener Carreras', 'Zahir Hart', '2024-09-09 17:46:36.503085', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5275, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:46:36.676973', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5276, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:46:40.193951', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5277, 'Obtener Carreras', 'Caja', '2024-09-09 17:46:40.294533', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5278, 'Obtener estudiante con cédula: E-286', 'Caja', '2024-09-09 17:46:43.954881', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5279, 'Obtener Carreras', 'Caja', '2024-09-09 17:46:44.071087', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5280, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:47:00.481771', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5281, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:47:04.063767', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5282, 'Obtener Carreras', 'Caja', '2024-09-09 17:47:04.162533', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5283, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:47:06.388448', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5284, 'Obtener Carreras', 'Caja', '2024-09-09 17:47:06.388448', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5285, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:47:07.846279', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5286, 'Obtener Carreras', 'Caja', '2024-09-09 17:47:07.944061', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5287, 'Obtener estudiante con cédula: E-159', 'Caja', '2024-09-09 17:47:11.250858', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5288, 'Obtener Carreras', 'Caja', '2024-09-09 17:47:11.35009', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5289, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:47:25.959637', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5290, 'Obtener Carreras', 'Caja', '2024-09-09 17:47:26.065906', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5291, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-09-09 17:47:27.830623', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5292, 'Obtener Carreras', 'Caja', '2024-09-09 17:47:27.92097', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5293, 'Inicio de sesión del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:47:44.554334', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5294, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:47:44.970992', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5295, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:47:45.064724', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5296, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:47:45.237481', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5297, 'Obtener horario del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:47:46.800199', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5298, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:48:05.204831', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5299, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:48:05.298609', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5300, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:48:05.603496', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5301, 'Inicio de sesión del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:49:20.29116', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5302, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:49:20.700941', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5303, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:49:20.79467', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5304, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:49:21.862358', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5305, 'Obtener Docentes', 'Nero Sanford', '2024-09-09 17:49:21.971733', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5306, 'Obtener Docentes', 'Usuario coordinador', '2024-09-09 17:50:20.520004', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5307, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-09 17:50:20.662629', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5308, 'Obtener Carreras', 'Usuario coordinador', '2024-09-09 17:50:20.771871', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5309, 'Obtener Carreras', 'Usuario coordinador', '2024-09-09 17:50:22.964951', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5310, 'Obtener Docentes', 'Usuario coordinador', '2024-09-09 17:50:24.318799', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5311, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-09 17:50:24.44746', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5312, 'Obtener Carreras', 'Usuario coordinador', '2024-09-09 17:50:24.685256', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5313, 'Actualizar Materia con id: 01ETI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-09-09 17:50:46.916653', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5314, 'Obtener Docentes', 'Usuario coordinador', '2024-09-09 17:50:47.183273', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5315, 'Obtener Docentes', 'Usuario coordinador', '2024-09-09 17:50:47.195524', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5316, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-09 17:50:47.313869', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5317, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-09 17:50:47.315864', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5318, 'Obtener Carreras', 'Usuario coordinador', '2024-09-09 17:50:47.43476', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5319, 'Obtener Carreras', 'Usuario coordinador', '2024-09-09 17:50:47.440519', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5320, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:50:54.27849', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5321, 'Obtener Docentes', 'Nero Sanford', '2024-09-09 17:50:54.402191', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5322, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:04.888019', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5323, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:07.666321', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5324, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:51:07.758936', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5325, 'Actualizar Materia con id: 01ETI122, nombre: TÉCNICAS DE INVESTIGACIÓN', 'Usuario coordinador', '2024-09-09 17:51:26.598989', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5326, 'Obtener Docentes', 'Usuario coordinador', '2024-09-09 17:51:26.903176', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5327, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-09 17:51:27.055668', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5328, 'Obtener Docentes', 'Usuario coordinador', '2024-09-09 17:51:27.049597', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5329, 'Obtener Carreras', 'Usuario coordinador', '2024-09-09 17:51:27.326694', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5330, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-09 17:51:27.329686', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5331, 'Obtener Carreras', 'Usuario coordinador', '2024-09-09 17:51:27.707513', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5409, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:37:43.400211', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5332, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:29.807995', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5333, 'Obtener Docentes', 'Nero Sanford', '2024-09-09 17:51:29.982722', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5334, 'Obtener materias válidas para inscripción del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:44.439129', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5335, 'Añadir materia 01ETI122 al estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:44.642531', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5336, 'Añadir materia 01ING132 al estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:44.829987', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5337, 'Añadir materia 01INF132 al estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:45.017443', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5338, 'Añadir materia 01AMA144 al estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:45.205562', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5339, 'Añadir materia 01EPA122 al estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:45.393018', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5340, 'Añadir materia 01EDF121 al estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:45.580968', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5341, 'Añadir materia 01AGM122 al estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:45.768428', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5342, 'Añadir materia 01LYC122 al estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:45.960855', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5343, 'Añadir materia 01COG164 al estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:46.162458', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5344, 'Obtener horario del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:46.696967', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5345, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:47.019716', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5346, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:51:47.140739', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5347, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:51:47.322534', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5348, 'Obtener horario del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:49.029459', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5349, 'Obtener notas del estudiante con cédula: E-16', 'Nero Sanford', '2024-09-09 17:51:51.60986', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5350, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:51:51.712028', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5351, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-09 17:51:51.885868', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5352, 'Obtener todos los estudiantes', 'Nero Sanford', '2024-09-09 17:51:59.706382', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5353, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:51:59.806247', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5354, 'Obtener todos los estudiantes', 'Nero Sanford', '2024-09-09 17:52:01.07309', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5355, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:52:01.07309', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5356, 'Obtener todos los estudiantes', 'Nero Sanford', '2024-09-09 17:52:04.013177', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5357, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:52:04.120075', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5358, 'Obtener estudiante con cédula: E-159', 'Nero Sanford', '2024-09-09 17:52:07.253157', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5359, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:52:07.370426', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5360, 'Obtener todos los estudiantes', 'Nero Sanford', '2024-09-09 17:52:09.120946', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5361, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:52:09.234036', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5362, 'Obtener estudiante con cédula: E-318', 'Nero Sanford', '2024-09-09 17:52:15.349338', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5363, 'Obtener Carreras', 'Nero Sanford', '2024-09-09 17:52:15.4491', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5364, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:52:31.804675', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5365, 'Obtener Carreras', 'Caja', '2024-09-09 17:52:31.901482', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5366, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:52:32.574308', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5367, 'Obtener Carreras', 'Caja', '2024-09-09 17:52:32.574308', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5368, 'Obtener todos los pagos', 'Caja', '2024-09-09 17:52:35.163305', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5369, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:52:35.281799', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5370, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 17:52:36.371971', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5371, 'Obtener todos los pagos', 'Caja', '2024-09-09 18:02:09.061344', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5372, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 18:02:09.170067', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5373, 'Obtener Carreras', 'Usuario coordinador', '2024-09-09 18:02:13.953214', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5374, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-09 18:02:17.863069', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5375, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-09 18:02:17.863069', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5376, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-09 18:02:18.824288', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5377, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-09 20:35:19.29878', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5378, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:36:10.871348', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5379, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:36:10.969635', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5380, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:36:14.381128', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5381, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-09 20:36:40.474355', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5382, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:36:41.841017', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5383, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:36:42.066023', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5384, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 20:36:46.52776', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5385, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:36:46.632277', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5386, 'Obtener pago con id: 67', 'Caja', '2024-09-09 20:36:48.637565', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5387, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 20:36:48.75212', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5388, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 20:36:49.617475', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5389, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:36:49.733866', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5390, 'Obtener pago con id: 68', 'Caja', '2024-09-09 20:36:50.562416', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5391, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 20:36:50.730321', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5392, 'Obtener estudiante con cédula: E-254', 'Caja', '2024-09-09 20:36:51.48607', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5393, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:36:51.595716', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5394, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:36:51.888483', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5395, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:36:51.986741', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5396, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:36:53.03373', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5397, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:37:01.028714', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5398, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:37:01.14892', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5399, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:37:08.299127', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5400, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:37:08.408845', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5401, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:37:08.885028', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5402, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:37:09.113429', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5403, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:37:28.737029', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5404, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:37:28.847299', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5405, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:37:29.312604', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5406, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:37:29.432817', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5407, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:37:42.836666', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5408, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:37:42.942958', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5410, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:37:43.522027', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5411, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:37:49.714924', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5412, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:37:49.833924', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5413, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:37:50.289504', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5414, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:37:50.407943', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5415, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:38:06.581848', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5416, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:38:06.68682', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5417, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:38:07.369912', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5418, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:38:07.487197', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5419, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:38:10.01032', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5420, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:38:39.485557', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5421, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:38:39.588153', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5422, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:38:54.980515', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5423, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:38:55.089917', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5424, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:39:11.947811', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5425, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:39:12.052726', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5426, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:39:23.753964', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5427, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:39:23.863988', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5428, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:39:27.732313', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5429, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:39:27.83653', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5430, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:39:38.175977', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5431, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:39:38.285618', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5432, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:39:41.652089', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5433, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:39:41.758008', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5434, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:39:52.07118', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5435, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:39:52.185435', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5436, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:39:55.135055', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5437, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:39:55.244902', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5438, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:40:01.988813', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5439, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:40:45.579215', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5440, 'Añadir pago para el estudiante con cédula: V-30555724, monto: <models.entities.monto.Monto object at 0x00000182775F66C0>', 'Caja', '2024-09-09 20:41:35.381688', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5441, 'Obtener pago con id: 71', 'Caja', '2024-09-09 20:41:36.193366', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5442, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:41:36.286276', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5443, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:42:01.76932', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5444, 'Añadir pago para el estudiante con cédula: V-30555724, monto: <models.entities.monto.Monto object at 0x0000018276FFC350>', 'Caja', '2024-09-09 20:42:13.8697', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5445, 'Obtener pago con id: 72', 'Caja', '2024-09-09 20:42:14.314453', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5446, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:42:14.423984', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5447, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:42:16.333443', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5448, 'Añadir pago para el estudiante con cédula: V-30555724, monto: <models.entities.monto.Monto object at 0x0000018277541070>', 'Caja', '2024-09-09 20:42:33.640149', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5449, 'Obtener pago con id: 73', 'Caja', '2024-09-09 20:42:34.082221', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5450, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:42:34.176594', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5451, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:42:36.23102', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5452, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:42:37.355615', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5453, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:42:37.455945', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5454, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:42:43.845823', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5455, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:42:43.958333', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5456, 'Obtener pago con id: 71', 'Caja', '2024-09-09 20:42:46.21147', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5457, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:42:46.387545', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5458, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:42:50.360284', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5459, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:42:50.47084', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5460, 'Obtener pago con id: 72', 'Caja', '2024-09-09 20:42:52.012259', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5461, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:42:52.139089', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5462, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:42:54.764726', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5463, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:42:54.873426', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5464, 'Obtener pago con id: 73', 'Caja', '2024-09-09 20:42:56.219635', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5465, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:42:56.336951', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5466, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-09 20:43:00.270113', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5467, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:43:00.369415', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5468, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:43:01.251775', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5469, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:43:01.35961', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5470, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:43:05.563493', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5471, 'Obtener todos los pagos', 'Caja', '2024-09-09 20:43:06.995689', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5472, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 20:43:07.099033', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5473, 'Obtener todo el Control', 'Caja', '2024-09-09 20:44:28.340804', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5474, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:00:28.859549', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5475, 'Obtener Carreras', 'Caja', '2024-09-09 21:00:28.862541', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5476, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:00:43.689378', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5477, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:00:43.77415', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5478, 'Obtener Carreras', 'Caja', '2024-09-09 21:00:43.820026', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5479, 'Obtener Carreras', 'Caja', '2024-09-09 21:00:43.902806', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5480, 'Obtener Carreras', 'Caja', '2024-09-09 21:00:45.424095', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5481, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:00:45.436063', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5482, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:00:47.166548', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5483, 'Obtener Carreras', 'Caja', '2024-09-09 21:00:47.290349', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5484, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:00:54.715383', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5485, 'Obtener Carreras', 'Caja', '2024-09-09 21:00:54.715383', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5486, 'Obtener Carreras', 'Caja', '2024-09-09 21:00:57.387645', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5487, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:00:57.401609', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5488, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:00:59.745159', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5489, 'Obtener Carreras', 'Caja', '2024-09-09 21:00:59.752143', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5490, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:01:04.683573', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5491, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:01:04.793281', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5492, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:01:17.495564', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5493, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:01:20.170986', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5494, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:01:20.289549', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5495, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:01:28.868667', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5496, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:01:30.147177', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5497, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:01:30.262839', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5498, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:01:41.84297', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5499, 'Obtener Carreras', 'Caja', '2024-09-09 21:01:41.852944', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5500, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:01:50.327755', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5501, 'Obtener Carreras', 'Caja', '2024-09-09 21:01:50.328753', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5502, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-09 21:02:07.172007', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5503, 'Obtener Carreras', 'Caja', '2024-09-09 21:03:38.18886', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5504, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:03:38.190856', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5505, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:05:01.893986', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5506, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:05:02.004418', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5507, 'Obtener Carreras', 'Caja', '2024-09-09 21:05:06.76721', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5508, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:05:06.86925', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5509, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:05:13.319965', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5510, 'Obtener Carreras', 'Caja', '2024-09-09 21:05:13.440666', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5511, 'Obtener estudiante con cédula: E-558', 'Caja', '2024-09-09 21:05:19.428794', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5512, 'Obtener Carreras', 'Caja', '2024-09-09 21:05:19.544251', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5513, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:05:29.280103', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5514, 'Obtener Carreras', 'Caja', '2024-09-09 21:05:29.395797', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5515, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:05:37.702477', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5516, 'Obtener Carreras', 'Caja', '2024-09-09 21:05:37.708439', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5517, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:05:41.646191', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5518, 'Obtener Carreras', 'Caja', '2024-09-09 21:05:41.768058', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5519, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:05:58.604414', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5520, 'Obtener Carreras', 'Caja', '2024-09-09 21:05:58.61439', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5521, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:06:05.362921', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5522, 'Obtener Carreras', 'Caja', '2024-09-09 21:06:05.491187', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5523, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:06:07.948141', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5524, 'Obtener Carreras', 'Caja', '2024-09-09 21:06:07.953127', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5525, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:06:11.401737', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5526, 'Obtener Carreras', 'Caja', '2024-09-09 21:06:11.520325', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5527, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:06:15.732607', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5528, 'Obtener Carreras', 'Caja', '2024-09-09 21:06:15.73461', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5529, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:06:19.954936', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5530, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:06:20.075235', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5531, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:06:29.690888', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5532, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:06:29.955327', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5533, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:06:30.176089', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5534, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:06:38.549624', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5535, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:06:38.803528', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5536, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:06:38.922212', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5537, 'Obtener estudiante con cédula: E-558', 'Caja', '2024-09-09 21:06:44.898386', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5538, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:06:45.021067', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5539, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:06:49.183244', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5540, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:06:49.302531', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5541, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:06:55.898388', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5542, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:06:56.012081', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5543, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:17:57.157413', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5544, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:17:57.265134', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5545, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:20:32.476193', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5546, 'Obtener Carreras', 'Caja', '2024-09-09 21:20:32.478189', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5547, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:21:20.382124', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5548, 'Obtener Carreras', 'Caja', '2024-09-09 21:21:20.389162', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5549, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-09 21:28:34.859231', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5550, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-09 21:30:54.479188', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5551, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-09 21:32:38.770464', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5552, 'Obtener Carreras', 'Caja', '2024-09-09 21:32:46.95108', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5553, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:32:46.963048', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5554, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:33:02.923698', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5555, 'Obtener Carreras', 'Caja', '2024-09-09 21:33:03.025416', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5556, 'Obtener estudiante con cédula: E-286', 'Caja', '2024-09-09 21:33:18.21751', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5557, 'Obtener Carreras', 'Caja', '2024-09-09 21:33:18.315153', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5558, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:33:29.288861', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5559, 'Obtener Carreras', 'Caja', '2024-09-09 21:33:29.39588', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5560, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:33:32.379989', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5561, 'Obtener Carreras', 'Caja', '2024-09-09 21:33:32.383991', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5562, 'Añadir estudiante con cédula: V-48774, nombre: Jose Garavito', 'Caja', '2024-09-09 21:34:46.053549', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5563, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:34:46.375726', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5564, 'Obtener Carreras', 'Caja', '2024-09-09 21:34:46.380728', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5565, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:34:57.569162', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5566, 'Obtener Carreras', 'Caja', '2024-09-09 21:34:57.687875', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5567, 'Obtener estudiante con cédula: V-48774', 'Caja', '2024-09-09 21:35:01.793873', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5568, 'Obtener Carreras', 'Caja', '2024-09-09 21:35:01.921555', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5569, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:35:05.176693', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5570, 'Obtener Carreras', 'Caja', '2024-09-09 21:35:05.284013', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5571, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:35:06.674279', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5572, 'Obtener Carreras', 'Caja', '2024-09-09 21:35:06.675276', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5573, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:36:27.242614', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5574, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:36:27.523826', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5575, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:36:33.893564', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5576, 'Obtener Carreras', 'Caja', '2024-09-09 21:36:33.900546', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5577, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:36:39.387801', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5578, 'Obtener Carreras', 'Caja', '2024-09-09 21:36:39.513479', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5579, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:36:43.930693', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5580, 'Obtener Carreras', 'Caja', '2024-09-09 21:36:43.937893', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5581, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:36:47.704045', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5582, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:36:47.815668', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5583, 'Obtener estudiante con cédula: V-48774', 'Caja', '2024-09-09 21:36:53.482287', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5584, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:36:53.589424', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5585, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:36:57.578123', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5586, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:36:57.682363', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5587, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:37:03.534343', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5588, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:37:03.628578', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5589, 'Obtener todos los pagos', 'Caja', '2024-09-09 21:37:41.469474', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5590, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:37:41.570924', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5591, 'Obtener todos los estudiantes', 'Caja', '2024-09-09 21:37:50.641674', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5592, 'Añadir pago para el estudiante con cédula: V-48774, monto: <models.entities.monto.Monto object at 0x000001C47B1DA1B0>', 'Caja', '2024-09-09 21:38:32.685229', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5593, 'Obtener pago con id: 74', 'Caja', '2024-09-09 21:38:33.244152', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5594, 'Obtener estudiante con cédula: V-48774', 'Caja', '2024-09-09 21:38:33.35235', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5595, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-23 18:12:26.156974', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5596, 'Obtener Carreras', 'Caja', '2024-09-23 18:31:59.937729', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5597, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:31:59.937729', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5598, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:32:01.696299', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5599, 'Obtener Carreras', 'Caja', '2024-09-23 18:32:01.805651', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5600, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:32:06.336915', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5601, 'Obtener Carreras', 'Caja', '2024-09-23 18:32:06.339335', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5602, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:32:12.575871', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5603, 'Obtener Carreras', 'Caja', '2024-09-23 18:32:12.69133', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5604, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-09-23 18:32:15.72556', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5605, 'Obtener Carreras', 'Caja', '2024-09-23 18:32:15.835506', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5606, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:32:25.502171', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5607, 'Obtener Carreras', 'Caja', '2024-09-23 18:32:25.618361', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5608, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-09-23 18:32:30.229823', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5609, 'Obtener Carreras', 'Caja', '2024-09-23 18:32:30.50161', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5610, 'Actualizar estudiante con cédula: E-16, nombre: Nero Sanford', 'Caja', '2024-09-23 18:35:28.488333', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5611, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-09-23 18:35:28.705261', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5612, 'Obtener Carreras', 'Caja', '2024-09-23 18:35:28.83506', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5613, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:35:29.039507', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5614, 'Obtener Carreras', 'Caja', '2024-09-23 18:35:29.056393', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5615, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:35:39.969577', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5616, 'Obtener Carreras', 'Caja', '2024-09-23 18:35:40.082742', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5617, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:35:42.887048', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5618, 'Obtener Carreras', 'Caja', '2024-09-23 18:35:42.892036', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5619, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:35:46.796388', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5620, 'Obtener Carreras', 'Caja', '2024-09-23 18:35:46.901151', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5621, 'Obtener estudiante con cédula: E-558', 'Caja', '2024-09-23 18:35:48.704036', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5622, 'Obtener Carreras', 'Caja', '2024-09-23 18:35:48.806181', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5623, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:35:51.957562', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5624, 'Obtener Carreras', 'Caja', '2024-09-23 18:35:52.061851', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5625, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:35:52.92612', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5626, 'Obtener Carreras', 'Caja', '2024-09-23 18:35:52.941713', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5627, 'Añadir estudiante con cédula: V-30321456, nombre: Leonardo Torres', 'Caja', '2024-09-23 18:37:17.901938', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5628, 'Obtener Carreras', 'Caja', '2024-09-23 18:37:18.119628', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5629, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:37:18.119628', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5630, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:37:22.842978', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5631, 'Obtener Carreras', 'Caja', '2024-09-23 18:37:22.972311', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5632, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:37:24.12768', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5633, 'Obtener Carreras', 'Caja', '2024-09-23 18:37:24.12768', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5634, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:37:26.234923', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5635, 'Obtener Carreras', 'Caja', '2024-09-23 18:37:26.339515', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5636, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:37:32.642214', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5637, 'Obtener Carreras', 'Caja', '2024-09-23 18:37:32.649195', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5638, 'Obtener estudiante con cédula: E-16', 'Caja', '2024-09-23 18:37:34.639028', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5639, 'Obtener Carreras', 'Caja', '2024-09-23 18:37:34.726105', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5640, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:37:49.950418', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5641, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:37:50.04418', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5642, 'Obtener estudiante con cédula: V-30321456', 'Caja', '2024-09-23 18:38:03.675143', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5643, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:38:03.784471', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5644, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:38:06.278825', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5645, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:38:06.388204', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5646, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:38:18.516709', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5647, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:38:18.610348', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5648, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:38:24.659172', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5649, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:38:24.768521', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5650, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:38:32.642456', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5651, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:38:32.752085', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5652, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:38:34.791363', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5653, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:38:34.903711', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5654, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:38:42.920188', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5655, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:38:43.02368', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5656, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:38:50.599112', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5657, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:38:50.708436', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5658, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:38:57.209279', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5659, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:38:57.323649', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5660, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:16.845019', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5661, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:16.959663', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5662, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:24.743778', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5663, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:24.843883', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5664, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:25.29401', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5665, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:25.410971', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5666, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:34.738805', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5667, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:34.846424', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5668, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:35.291905', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5669, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:35.393935', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5670, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:42.057008', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5671, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:42.166373', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5672, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:42.611422', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5673, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:42.725909', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5674, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:48.208089', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5675, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:48.316126', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5676, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:55.958667', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5677, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:56.067992', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5678, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:58.93046', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5679, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:59.03981', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5680, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:39:59.483351', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5681, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:39:59.583862', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5682, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-09-23 18:41:45.313318', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5683, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:42:32.270627', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5684, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:42:32.367054', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5685, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:42:40.931301', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5686, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:42:41.032659', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5687, 'Obtener todos los pagos', 'Caja', '2024-09-23 18:42:50.29426', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5688, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:42:50.405488', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5689, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:42:52.539833', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5690, 'Obtener Carreras', 'Caja', '2024-09-23 18:42:52.545817', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5691, 'Obtener todos los estudiantes', 'Caja', '2024-09-23 18:43:01.255094', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5692, 'Obtener Carreras', 'Caja', '2024-09-23 18:43:01.371652', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5693, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-23 18:43:03.189739', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5694, 'Obtener Carreras', 'Caja', '2024-09-23 18:43:03.299628', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5695, 'Inicio de sesión del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:43:29.713175', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5696, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:43:30.641039', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5697, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:43:30.733307', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5698, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:43:36.774147', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5699, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:43:36.886196', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5700, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:43:39.340349', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5701, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:43:40.776218', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5702, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:43:40.880048', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5703, 'Obtener histórico del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:43:42.046879', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5704, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:43:43.334996', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5705, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:43:43.428783', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5706, 'Actualizar Configuración con id: 1, ciclo: 2024-1', 'Usuario coordinador', '2024-09-23 18:44:07.155193', 'General', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5707, 'Obtener materias válidas para inscripción del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:44:18.818108', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5708, 'Obtener Docentes', 'Francisco silva', '2024-09-23 18:44:19.137531', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5709, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:44:20.4761', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5710, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:44:20.577825', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5711, 'Obtener todos los estudiantes', 'Francisco silva', '2024-09-23 18:44:24.49441', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5712, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:44:24.596182', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5713, 'Inicio de sesión del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:46:12.335302', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5714, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:46:12.959102', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5715, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:46:13.063078', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5716, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:46:33.49173', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5717, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:46:42.104625', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5718, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:46:42.42828', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5719, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:46:42.646311', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5720, 'Obtener histórico del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:47:12.954756', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5721, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:47:14.732193', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5722, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:47:14.833075', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5723, 'Obtener materias válidas para inscripción del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:47:33.803069', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5724, 'Obtener Docentes', 'Francisco silva', '2024-09-23 18:47:33.932846', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5725, 'Obtener materias válidas para inscripción del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:06.496725', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5726, 'Obtener Docentes', 'Francisco silva', '2024-09-23 18:50:06.634903', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5727, 'Obtener materias válidas para inscripción del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:19.722162', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5728, 'Añadir materia 01ETI122 al estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:20.066757', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5729, 'Añadir materia 01ING132 al estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:20.254226', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5730, 'Añadir materia 01INF132 al estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:20.441682', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5731, 'Añadir materia 01AMA144 al estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:20.629129', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5732, 'Añadir materia 01EPA122 al estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:20.816588', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5733, 'Añadir materia 01EDF121 al estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:21.004509', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5734, 'Añadir materia 01AGM122 al estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:21.207905', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5735, 'Añadir materia 01LYC122 al estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:21.426603', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5736, 'Añadir materia 01COG164 al estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:21.615317', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5737, 'Obtener horario del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:22.14691', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5738, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:22.500731', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5739, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:50:22.587221', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5740, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-23 18:50:22.78508', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5741, 'Obtener horario del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:50:27.809277', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5742, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:51:01.387446', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5743, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:51:01.481208', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5744, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-23 18:51:01.670157', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5745, 'Obtener histórico del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:51:03.70795', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5746, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:51:42.98447', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5747, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:51:43.086701', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5748, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-23 18:51:43.26543', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5749, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:51:44.40315', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5750, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:52:06.008028', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5751, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:52:06.101756', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5752, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-23 18:52:06.286781', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5753, 'Obtener horario del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:52:39.066858', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5754, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 18:52:40.274075', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5755, 'Obtener Carreras', 'Francisco silva', '2024-09-23 18:52:40.373977', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5756, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-23 18:52:40.551151', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5757, 'Obtener Docentes', 'Usuario coordinador', '2024-09-23 18:57:44.827398', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5758, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-23 18:57:44.966552', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5759, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 18:57:45.074611', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5760, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 18:57:48.369843', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5761, 'Obtener Docentes', 'Usuario coordinador', '2024-09-23 18:57:49.805582', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5762, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-23 18:57:49.899336', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5763, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 18:57:50.00869', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5764, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 18:58:59.616805', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5765, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-09-23 18:59:36.186269', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5766, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 18:59:36.830566', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5767, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 18:59:36.830566', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5768, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 18:59:42.592597', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5769, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 18:59:42.592597', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5770, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-09-23 19:00:45.236899', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5771, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 19:00:45.573127', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5772, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 19:00:45.588747', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5773, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 19:01:58.03986', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5774, 'Inicio de sesión del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 19:02:26.545767', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5775, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 19:02:26.979581', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5776, 'Obtener Carreras', 'Francisco silva', '2024-09-23 19:02:27.078333', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5777, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-23 19:02:27.399149', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5778, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 19:02:29.171113', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5779, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 19:02:46.588967', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5780, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 19:02:52.439941', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5781, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 19:03:11.872815', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5782, 'Modificar materia del estudiante con cédula: V-30555724, campo: nota1, valor: 18', 'elibeth curalli', '2024-09-23 19:05:42.096289', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5783, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 19:05:42.324309', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5784, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 19:05:42.372398', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5785, 'Subir archivo: planificacion.pdf a la carpeta: 01ING132 y ciclo: 2024-1', 'elibeth curalli', '2024-09-23 19:08:25.955772', 'Archivos', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5786, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 19:08:26.289785', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5787, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 19:08:26.336867', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5788, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 19:08:34.627579', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5789, 'Obtener Carreras', 'Francisco silva', '2024-09-23 19:08:34.745777', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5790, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-23 19:08:34.940501', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5791, 'Descargar archivo: planificacion.pdf de la carpeta: 01ING132 y ciclo: 2024-1', 'Caja', '2024-09-23 19:08:35.825875', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5792, 'Obtener notas del estudiante con cédula: V-30555724', 'Francisco silva', '2024-09-23 19:08:36.41962', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5793, 'Obtener Carreras', 'Francisco silva', '2024-09-23 19:08:36.531111', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5794, 'Descargar archivo: planificacion.pdf de la carpeta: 01AGM122 y ciclo: 2024-1', 'Caja', '2024-09-23 19:08:37.063972', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5795, 'Descargar archivo: planificacion.pdf de la carpeta: 01ING132 y ciclo: 2024-1', 'Caja', '2024-09-23 19:08:38.17844', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5796, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 19:11:37.31167', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5797, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 19:11:37.31167', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5798, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 19:11:51.322402', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5799, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 19:11:51.322402', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5800, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-09-23 19:17:40.671538', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5801, 'Obtener Docentes', 'Usuario coordinador', '2024-09-23 19:19:18.956439', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5802, 'Generar PDF de docenteria', 'Caja', '2024-09-23 19:19:47.514545', 'Generar PDF', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5803, 'Obtener Docentes', 'Usuario coordinador', '2024-09-23 19:20:21.824883', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5804, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-23 19:20:21.934272', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5805, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:20:22.027969', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5806, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:21:07.685534', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5807, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-23 19:21:38.387003', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5808, 'Obtener Docentes', 'Usuario coordinador', '2024-09-23 19:21:38.503245', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5809, 'Obtener Docentes', 'Usuario coordinador', '2024-09-23 19:22:06.86642', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5810, 'Obtener todas las Materias', 'Usuario coordinador', '2024-09-23 19:22:06.976148', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5811, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:22:07.074406', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5812, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:23:25.344427', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5813, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:23:25.453778', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5814, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:23:48.784427', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5815, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:23:48.894229', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5816, 'Obtener estudiante con cédula: E-16', 'Usuario coordinador', '2024-09-23 19:23:53.589751', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5817, 'Obtener Notas del Estudiante con cédula: E-16', 'Usuario coordinador', '2024-09-23 19:23:53.730346', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5818, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:23:56.342196', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5819, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:23:56.454957', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5820, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:24:03.470069', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5821, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:24:03.573426', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5822, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:24:10.000646', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5823, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:24:09.92959', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5824, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:24:10.096812', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5825, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:24:10.128048', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5826, 'Obtener estudiante con cédula: V-30555724', 'Usuario coordinador', '2024-09-23 19:24:13.524471', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5827, 'Obtener Notas del Estudiante con cédula: V-30555724', 'Usuario coordinador', '2024-09-23 19:24:13.655829', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5828, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:24:17.921352', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5829, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:24:18.01428', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5830, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:24:20.261963', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5831, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:24:20.367586', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5832, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:24:24.246968', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5833, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:24:24.355599', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5834, 'Obtener estudiante con cédula: V-30555724', 'Usuario coordinador', '2024-09-23 19:25:30.934706', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5835, 'Obtener Notas del Estudiante con cédula: V-30555724', 'Usuario coordinador', '2024-09-23 19:25:31.080077', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5836, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:25:49.208553', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5837, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:25:49.319026', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5838, 'Generar PDF de estudiante con cédula: V-30555724', 'Caja', '2024-09-23 19:25:58.667273', 'Generar PDF', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5839, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-23 19:26:30.143052', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5840, 'Obtener Carreras', 'Usuario coordinador', '2024-09-23 19:26:30.248688', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5841, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-09-23 19:28:31.505101', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5842, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-09-23 19:34:00.160548', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5843, 'Obtener Carreras', 'Usuario control de estudio', '2024-09-23 19:37:36.359398', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5844, 'Obtener todas las Materias', 'Usuario control de estudio', '2024-09-23 19:38:07.244229', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5845, 'Obtener Docentes', 'Usuario control de estudio', '2024-09-23 19:38:07.360185', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5846, 'Obtener Materia con id: 01ING132', 'Usuario control de estudio', '2024-09-23 19:38:24.905528', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5847, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-09-23 19:39:08.832703', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5848, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 19:39:09.222673', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5849, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 19:39:09.238296', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5850, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 19:39:11.64286', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5851, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 19:39:13.451298', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5852, 'Descargar archivo: planificacion.pdf de la carpeta: 01ING132 y ciclo: 2024-1', 'Caja', '2024-09-23 19:39:13.632455', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5853, 'Obtener Carreras', 'Usuario control de estudio', '2024-09-23 19:39:53.056907', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5854, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 19:39:56.75189', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5855, 'Añadir Petición para el estudiante con cédula: V-30555724, materia: 01ING132', 'elibeth curalli', '2024-09-23 19:40:36.837286', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5856, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 19:40:36.958333', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5857, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 19:40:36.998461', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5858, 'Descargar archivo: planificacion.pdf de la carpeta: 01ING132 y ciclo: 2024-1', 'Caja', '2024-09-23 19:40:37.807867', 'Archivos', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5859, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 19:40:44.051447', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5860, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-09-23 23:42:54.779654', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5861, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 23:42:55.127022', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5862, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:42:55.127022', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5863, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-09-23 23:44:19.67376', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5864, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:45:33.338378', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5865, 'Actualizar Petición con id: 6', 'Usuario control de estudio', '2024-09-23 23:46:46.961804', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5866, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:46:47.171358', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5867, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 23:46:58.561511', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5868, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:46:58.56645', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5869, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 23:47:34.670412', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5870, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:47:35.954681', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5871, 'Añadir Petición para el estudiante con cédula: V-30555724, materia: 01ING132', 'elibeth curalli', '2024-09-23 23:49:29.427541', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5872, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:49:29.552558', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5873, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:49:29.60457', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5874, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:49:42.619087', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5875, 'Actualizar Petición con id: 7', 'Usuario control de estudio', '2024-09-23 23:49:50.535455', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5876, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:49:50.767177', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5877, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:49:53.854194', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5878, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:49:53.904345', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5879, 'Añadir Petición para el estudiante con cédula: V-30555724, materia: 01ING132', 'elibeth curalli', '2024-09-23 23:50:11.755599', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5880, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:50:11.878324', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5881, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:50:11.921463', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5882, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:50:19.229669', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5883, 'Actualizar Petición con id: 8', 'Usuario control de estudio', '2024-09-23 23:50:21.766125', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5884, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:50:21.997214', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5885, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:50:25.088781', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5886, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:50:25.154107', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5887, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:50:33.335776', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5888, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:50:33.385681', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5889, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:50:42.85121', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5890, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:50:42.90133', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5891, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:50:45.196829', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5892, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:50:45.238437', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5893, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:50:49.1782', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5894, 'Modificar materia del estudiante con cédula: V-30555724, campo: nota2, valor: 15', 'elibeth curalli', '2024-09-23 23:50:59.459954', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5895, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:50:59.715941', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5896, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:50:59.760873', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5897, 'Añadir Petición para el estudiante con cédula: V-30555724, materia: 01ING132', 'elibeth curalli', '2024-09-23 23:51:19.728871', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5898, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:51:19.850232', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5899, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:51:19.89843', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5900, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:51:50.829713', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5901, 'Actualizar Petición con id: 9', 'Usuario control de estudio', '2024-09-23 23:51:54.235452', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5902, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:51:54.457362', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5903, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:52:00.703514', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5904, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:52:00.753794', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5905, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:53:42.271213', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5906, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:54:38.724547', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5907, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:54:38.77607', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5908, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:54:41.37524', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5909, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:54:41.426143', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5910, 'Añadir Petición para el estudiante con cédula: V-30555724, materia: 01ING132', 'elibeth curalli', '2024-09-23 23:54:59.25442', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5911, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:54:59.376589', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5912, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-09-23 23:54:59.420472', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5913, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:55:04.898471', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5914, 'Actualizar Petición con id: 10', 'Usuario control de estudio', '2024-09-23 23:55:09.657268', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5915, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-23 23:55:09.863238', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5916, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-09-23 23:55:22.695719', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5917, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-23 23:55:23.091042', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5918, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-23 23:55:23.091042', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5919, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-09-23 23:58:03.574733', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5920, 'Obtener todo el Control', 'admin', '2024-09-23 23:58:06.6488', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5921, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-09-23 23:59:10.390731', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5922, 'Obtener todo el Control', 'admin', '2024-09-23 23:59:52.731018', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5923, 'Obtener todo el Control', 'admin', '2024-09-24 00:00:12.657094', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5924, 'Obtener Coordinadores', 'admin', '2024-09-24 00:00:28.236714', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5925, 'Obtener Coordinadores', 'admin', '2024-09-24 00:00:41.381514', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5926, 'Obtener Carreras', 'admin', '2024-09-24 00:02:09.196495', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5927, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-09-24 18:23:17.378679', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5928, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-09-24 18:23:20.036174', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5929, 'Obtener Carreras', 'Usuario control de estudio', '2024-09-24 18:23:30.09544', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5930, 'Obtener todas las Materias', 'Usuario control de estudio', '2024-09-24 18:23:33.466355', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5931, 'Obtener Docentes', 'Usuario control de estudio', '2024-09-24 18:23:33.586068', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5932, 'Obtener Materia con id: 01ING132', 'Usuario control de estudio', '2024-09-24 18:23:39.492804', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5933, 'Modificar materia del estudiante con cédula: V-30555724, campo: nota2, valor: 19', 'Usuario control de estudio', '2024-09-24 18:26:45.877683', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5934, 'Obtener Materia con id: 01ING132', 'Usuario control de estudio', '2024-09-24 18:26:46.138986', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5935, 'Obtener Carreras', 'Usuario control de estudio', '2024-09-24 18:27:07.417166', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5936, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-09-24 18:27:09.620466', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5937, 'Obtener Carreras', 'Usuario control de estudio', '2024-09-24 18:27:09.855421', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5938, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-09-24 18:27:17.393358', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5939, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-09-24 18:27:17.455842', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5940, 'Obtener Carreras', 'Usuario control de estudio', '2024-09-24 18:27:17.518328', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5941, 'Obtener Carreras', 'Usuario control de estudio', '2024-09-24 18:27:17.565191', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5942, 'Obtener estudiante con cédula: V-30555724', 'Usuario control de estudio', '2024-09-24 18:27:19.76888', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5943, 'Obtener Notas del Estudiante con cédula: V-30555724', 'Usuario control de estudio', '2024-09-24 18:27:19.90984', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5944, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-09-24 18:27:24.907775', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5945, 'Obtener Carreras', 'Usuario control de estudio', '2024-09-24 18:27:25.021335', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5946, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-09-24 18:28:04.306394', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5947, 'Obtener Carreras', 'Usuario control de estudio', '2024-09-24 18:28:04.410417', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5948, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-09-24 18:28:16.568367', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5949, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-24 18:28:22.004035', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5950, 'Obtener Carreras', 'Usuario coordinador', '2024-09-24 18:28:22.098205', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5951, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-24 18:28:27.931359', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5952, 'Obtener Carreras', 'Usuario coordinador', '2024-09-24 18:28:28.033828', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5953, 'Obtener estudiante con cédula: V-30555724', 'Usuario coordinador', '2024-09-24 18:28:29.993433', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5954, 'Obtener Notas del Estudiante con cédula: V-30555724', 'Usuario coordinador', '2024-09-24 18:28:30.134387', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5955, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-24 18:28:32.054099', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5956, 'Obtener Carreras', 'Usuario coordinador', '2024-09-24 18:28:32.168784', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5957, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-24 18:29:31.971116', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5958, 'Obtener Carreras', 'Usuario coordinador', '2024-09-24 18:29:32.08512', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5959, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-09-24 18:32:49.509694', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5960, 'Obtener Carreras', 'Usuario coordinador', '2024-09-24 18:32:49.617382', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5961, 'Obtener Docentes', 'Usuario coordinador', '2024-09-24 18:32:52.433686', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5962, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-09-24 18:33:11.263891', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5963, 'Obtener todos los estudiantes', 'Caja', '2024-09-24 18:33:13.865036', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5964, 'Obtener Carreras', 'Caja', '2024-09-24 18:33:13.882363', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5965, 'Obtener todos los estudiantes', 'Caja', '2024-09-24 18:33:15.621432', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5966, 'Obtener Carreras', 'Caja', '2024-09-24 18:33:15.719853', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5967, 'Obtener todos los estudiantes', 'Caja', '2024-09-24 18:33:16.853974', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5968, 'Obtener Carreras', 'Caja', '2024-09-24 18:33:16.853974', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5969, 'Obtener todos los estudiantes', 'Caja', '2024-09-24 18:33:17.705484', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5970, 'Obtener Carreras', 'Caja', '2024-09-24 18:33:17.827293', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5971, 'Obtener todos los pagos', 'Caja', '2024-09-24 18:33:18.608424', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5972, 'Obtener todos los estudiantes', 'Caja', '2024-09-24 18:33:18.757952', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5973, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-24 18:33:27.990977', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5974, 'Obtener todos los pagos', 'Caja', '2024-09-24 18:33:28.089048', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5975, 'Obtener pago con id: 71', 'Caja', '2024-09-24 18:33:30.813784', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5976, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-24 18:33:30.989992', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5977, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-24 18:33:33.789221', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5978, 'Obtener todos los pagos', 'Caja', '2024-09-24 18:33:33.901475', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5979, 'Obtener pago con id: 72', 'Caja', '2024-09-24 18:33:35.668628', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5980, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-24 18:33:35.782008', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5981, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-24 18:33:37.45585', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5982, 'Obtener todos los pagos', 'Caja', '2024-09-24 18:33:37.579615', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5983, 'Obtener pago con id: 73', 'Caja', '2024-09-24 18:33:38.841309', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5984, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-24 18:33:38.952264', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5985, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-09-24 18:33:39.917397', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5986, 'Obtener todos los pagos', 'Caja', '2024-09-24 18:33:40.012194', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5987, 'Obtener todos los pagos', 'Caja', '2024-09-24 18:33:40.343982', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5988, 'Obtener todos los estudiantes', 'Caja', '2024-09-24 18:33:40.45008', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5989, 'Obtener todos los estudiantes', 'Caja', '2024-09-24 18:33:42.031841', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5990, 'Obtener todos los pagos', 'Caja', '2024-09-24 18:33:45.84671', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5991, 'Obtener todos los estudiantes', 'Caja', '2024-09-24 18:33:46.085986', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5992, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-09-25 18:59:48.60264', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5993, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-25 18:59:49.733634', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5994, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-25 18:59:49.737584', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5995, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-25 19:00:07.444455', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5996, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-25 19:00:07.444455', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5997, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-09-25 20:49:44.573163', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5998, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-09-25 20:49:44.589994', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (5999, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-10-03 17:59:01.489795', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6000, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 17:59:04.372525', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6001, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 17:59:04.477257', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6002, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 17:59:06.299198', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6003, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 17:59:06.404916', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6004, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 17:59:58.656274', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6005, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 17:59:58.769981', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6006, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 18:00:09.940949', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6007, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 18:00:10.050655', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6008, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 18:00:15.796444', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6009, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 18:00:15.921309', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6010, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 18:00:44.086386', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6011, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 18:00:44.171161', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6012, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 18:00:44.20906', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6013, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 18:00:44.297826', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6014, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 18:13:18.551723', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6015, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 18:13:18.668471', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6016, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 18:13:35.431047', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6017, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 18:13:35.543268', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6018, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 18:13:41.803789', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6019, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 18:13:41.927829', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6020, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-10-03 18:36:16.579319', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6021, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 18:36:22.226869', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6022, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-10-03 18:42:14.632594', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6023, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-10-03 18:42:15.332588', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6024, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 18:42:15.346551', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6025, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-10-03 18:42:42.244308', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6026, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 18:42:46.012934', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6027, 'Añadir Petición para el estudiante con cédula: V-30555724, materia: 01ING132', 'elibeth curalli', '2024-10-03 18:46:00.981689', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6028, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 18:46:01.111167', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6029, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 18:46:01.161548', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6030, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 18:46:19.958434', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6031, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 18:46:20.106521', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6032, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 18:51:27.47591', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6033, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 18:51:27.533265', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6034, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 18:51:29.215253', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6035, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 18:51:29.215253', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6036, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 18:52:43.450138', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6037, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 18:52:43.500517', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6038, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 18:57:48.475321', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6039, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 18:57:48.532169', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6040, 'Modificar materia del estudiante con cédula: V-30555724, campo: nota1, valor: 18', '01ING132', '2024-10-03 18:57:55.004126', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6041, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 18:59:59.120225', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6042, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 18:59:59.188562', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6043, 'Modificar materia del estudiante con cédula: V-30555724, campo: nota1, valor: 18', '01ING132', '2024-10-03 19:00:04.018992', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6044, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:01:38.714655', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6045, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:01:38.773501', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6046, 'Modificar materia del estudiante con cédula: V-30555724, campo: nota1, valor: 18', '01ING132', '2024-10-03 19:01:44.671501', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6047, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:01:50.039126', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6048, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:01:50.097482', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6049, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:01:56.926036', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6050, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:01:57.075498', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6051, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:02:25.841512', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6052, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:02:25.890899', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6053, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:09:18.351774', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6054, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:09:18.408625', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6055, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:10:08.646441', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6056, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:10:08.697394', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6057, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:10:12.190906', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6058, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:10:12.242736', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6059, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:10:34.496322', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6060, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:10:34.547701', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6061, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 19:16:33.548842', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6062, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-10-03 19:18:49.704698', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6063, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:18:50.205837', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6064, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-10-03 19:18:50.205837', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6065, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-10-03 19:18:52.626354', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6066, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:18:55.273161', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6067, 'Añadir Petición para el estudiante con cédula: V-30555724, materia: 01ING132', 'elibeth curalli', '2024-10-03 19:19:17.219118', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6068, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:19:17.345868', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6069, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:19:17.396251', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6070, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-10-03 19:19:31.245274', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6071, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 19:19:33.916495', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6072, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 19:19:39.672548', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6073, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:19:44.345996', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6074, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:19:44.399275', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6075, 'Modificar materia del estudiante con cédula: V-30555724, campo: nota1, valor: 19', '01ING132', '2024-10-03 19:19:52.03698', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6076, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:20:01.270377', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6077, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:20:01.320254', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6078, 'Añadir Petición para el estudiante con cédula: V-30555724, materia: 01ING132', 'elibeth curalli', '2024-10-03 19:20:21.090312', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6079, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:20:21.221476', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6080, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:20:21.273849', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6081, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 19:20:25.786848', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6082, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 19:20:30.03284', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6083, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:20:33.825168', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6084, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:20:33.876546', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6085, 'Añadir Petición para el estudiante con cédula: V-30555724, materia: 01ING132', 'elibeth curalli', '2024-10-03 19:20:51.725753', 'Peticiones', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6086, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:20:51.85523', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6087, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:20:51.908564', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6088, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 19:20:55.495158', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6089, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 19:21:16.762954', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6090, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 19:21:19.024076', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6091, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:21:21.819116', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6092, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:21:21.873494', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6093, 'Modificar materia del estudiante con cédula: V-30555724, campo: nota2, valor: 15', '01ING132', '2024-10-03 19:21:30.87157', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6094, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:21:35.588133', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6095, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:21:35.645003', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6096, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-10-03 19:21:54.811209', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6097, 'Obtener Materia con id: 01ING132', 'elibeth curalli', '2024-10-03 19:21:54.864068', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6098, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-10-03 19:21:57.300391', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6099, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-10-03 19:21:59.556735', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6100, 'Obtener Carreras', 'Usuario control de estudio', '2024-10-03 19:22:12.085235', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6101, 'Obtener todas las Materias', 'Usuario control de estudio', '2024-10-03 19:22:15.198694', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6102, 'Obtener Docentes', 'Usuario control de estudio', '2024-10-03 19:22:15.325383', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6103, 'Obtener Materia con id: 03CON144', 'Usuario control de estudio', '2024-10-03 19:22:21.155536', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6104, 'Obtener Carreras', 'Usuario control de estudio', '2024-10-03 19:22:26.934257', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6105, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-10-03 19:22:29.554712', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6106, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-10-03 19:22:49.379279', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6107, 'Obtener Docentes', 'Usuario coordinador', '2024-10-03 19:23:02.649449', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6108, 'Obtener Docentes', 'Usuario coordinador', '2024-10-03 19:23:35.482244', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6109, 'Obtener todas las Materias', 'Usuario coordinador', '2024-10-03 19:23:35.592349', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6110, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 19:23:35.703082', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6111, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 19:23:37.438929', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6112, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 19:23:40.171843', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6113, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 19:23:40.278655', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6114, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 19:23:42.071856', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6115, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 19:23:42.176837', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6116, 'Obtener estudiante con cédula: E-159', 'Usuario coordinador', '2024-10-03 19:23:47.776192', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6117, 'Obtener Notas del Estudiante con cédula: E-159', 'Usuario coordinador', '2024-10-03 19:23:47.926577', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6118, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 19:23:48.550298', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6119, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 19:23:48.651544', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6120, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 19:24:10.954389', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6121, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 19:24:11.065479', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6122, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 19:24:17.888525', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6123, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 19:24:17.996763', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6124, 'Obtener estudiante con cédula: V-30555724', 'Usuario coordinador', '2024-10-03 19:24:19.626019', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6125, 'Obtener Notas del Estudiante con cédula: V-30555724', 'Usuario coordinador', '2024-10-03 19:24:19.895211', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6126, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-10-03 19:24:30.254455', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6127, 'Obtener Carreras', 'Usuario coordinador', '2024-10-03 19:24:30.356699', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6128, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-10-03 19:27:48.036406', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6129, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-10-03 19:28:57.534104', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6130, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-10-03 19:29:22.639605', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6131, 'Obtener todos los estudiantes', 'Caja', '2024-10-03 19:29:24.946505', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6132, 'Obtener Carreras', 'Caja', '2024-10-03 19:29:24.947502', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6133, 'Obtener todos los estudiantes', 'Caja', '2024-10-03 19:29:26.509282', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6134, 'Obtener Carreras', 'Caja', '2024-10-03 19:29:26.620542', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6135, 'Obtener todos los estudiantes', 'Caja', '2024-10-03 19:29:27.644039', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6136, 'Obtener Carreras', 'Caja', '2024-10-03 19:29:27.64005', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6137, 'Obtener todos los estudiantes', 'Caja', '2024-10-03 19:29:28.808524', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6138, 'Obtener Carreras', 'Caja', '2024-10-03 19:29:28.931844', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6139, 'Obtener todos los pagos', 'Caja', '2024-10-03 19:29:31.911238', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6140, 'Obtener todos los estudiantes', 'Caja', '2024-10-03 19:29:32.020295', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6141, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-10-03 19:29:35.913467', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6142, 'Obtener todos los pagos', 'Caja', '2024-10-03 19:29:36.025766', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6143, 'Obtener pago con id: 71', 'Caja', '2024-10-03 19:29:39.823567', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6144, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-10-03 19:29:39.996176', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6145, 'Obtener estudiante con cédula: V-30555724', 'Caja', '2024-10-03 19:29:42.080102', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6146, 'Obtener todos los pagos', 'Caja', '2024-10-03 19:29:42.194806', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6147, 'Obtener todos los pagos', 'Caja', '2024-10-03 19:29:43.081307', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6148, 'Obtener todos los estudiantes', 'Caja', '2024-10-03 19:29:43.190794', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6149, 'Obtener todos los pagos', 'Caja', '2024-10-03 19:29:45.09013', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6150, 'Obtener todos los estudiantes', 'Caja', '2024-10-03 19:29:45.198783', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6151, 'Obtener todos los pagos', 'Caja', '2024-10-03 19:29:46.729105', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6152, 'Obtener todos los estudiantes', 'Caja', '2024-10-03 19:29:46.833376', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6153, 'Obtener todos los pagos', 'Caja', '2024-10-03 19:29:51.669351', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6154, 'Obtener todos los estudiantes', 'Caja', '2024-10-03 19:29:51.777766', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6155, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-10-09 17:55:33.795053', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6156, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 17:55:36.539451', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6157, 'Obtener Carreras', 'Caja', '2024-10-09 17:55:36.805198', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6158, 'Obtener todos los pagos', 'Caja', '2024-10-09 17:55:40.864483', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6159, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 17:55:41.157545', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6160, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 17:55:43.180085', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6161, 'Obtener Carreras', 'Caja', '2024-10-09 17:55:43.185075', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6162, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 18:52:42.825917', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6163, 'Obtener Carreras', 'Caja', '2024-10-09 18:52:42.926191', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6164, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 18:52:43.112547', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6165, 'Obtener Carreras', 'Caja', '2024-10-09 18:52:43.129464', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6166, 'Añadir estudiante con cédula: V-32073287, nombre: CARLOS EDUARDO JASPE NOGUERA', 'Caja', '2024-10-09 19:25:52.926664', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6167, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:25:53.105415', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6168, 'Obtener Carreras', 'Caja', '2024-10-09 19:25:53.105415', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6169, 'Añadir estudiante con cédula: V-29728463, nombre: GLAYSMARI KAIRUBI CISNEROS PEÑA', 'Caja', '2024-10-09 19:27:48.332524', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6170, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:27:48.525612', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6171, 'Obtener Carreras', 'Caja', '2024-10-09 19:27:48.527605', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6172, 'Añadir estudiante con cédula: V-27400076, nombre: JOSWYL ARON MENDEZ BOMPART', 'Caja', '2024-10-09 19:29:12.405855', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6173, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:29:12.566983', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6174, 'Obtener Carreras', 'Caja', '2024-10-09 19:29:12.566983', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6175, 'Añadir estudiante con cédula: V-28097785, nombre: SANTIAGO MARTINEZ', 'Caja', '2024-10-09 19:30:29.547406', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6176, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:30:29.734211', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6177, 'Obtener Carreras', 'Caja', '2024-10-09 19:30:29.74216', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6178, 'Añadir estudiante con cédula: V-30499635, nombre: GABRIEL DE JESÚS RIVAS ADRIAN', 'Caja', '2024-10-09 19:32:49.27316', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6179, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:32:49.438825', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6180, 'Obtener Carreras', 'Caja', '2024-10-09 19:32:49.438825', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6181, 'Añadir estudiante con cédula: V-31030746, nombre: MARIA JOSE GONZALEZ', 'Caja', '2024-10-09 19:34:02.219319', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6182, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:34:02.391127', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6183, 'Obtener Carreras', 'Caja', '2024-10-09 19:34:02.406745', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6184, 'Añadir estudiante con cédula: V-10459189, nombre: TAMARA VERÓNICA LORENZO GUEVARA', 'Caja', '2024-10-09 19:35:17.419303', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6185, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:35:17.595843', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6186, 'Obtener Carreras', 'Caja', '2024-10-09 19:35:17.595843', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6187, 'Añadir estudiante con cédula: V-28023802, nombre: IVANNA ALEJANDRA RODRÍGUEZ MARTÍNEZ', 'Caja', '2024-10-09 19:36:27.767451', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6188, 'Obtener Carreras', 'Caja', '2024-10-09 19:36:27.945058', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6189, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:36:27.945058', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6190, 'Añadir estudiante con cédula: V-31302786, nombre: YONAIKER ALEJANDRO HENRÍQUEZ LÓPEZ', 'Caja', '2024-10-09 19:38:06.39762', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6191, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:38:06.560641', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6192, 'Obtener Carreras', 'Caja', '2024-10-09 19:38:06.576249', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6193, 'Añadir estudiante con cédula: V-31536828, nombre: YORKELYS DEL CARMEN VENTURA MENDOZA', 'Caja', '2024-10-09 19:39:19.11665', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6194, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:39:19.313424', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6195, 'Obtener Carreras', 'Caja', '2024-10-09 19:39:19.3224', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6196, 'Añadir estudiante con cédula: V-31715004, nombre: MARÍA ALEJANDRA RUIZ DELGADO', 'Caja', '2024-10-09 19:40:25.261226', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6197, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:40:25.430957', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6198, 'Obtener Carreras', 'Caja', '2024-10-09 19:40:25.435972', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6199, 'Añadir estudiante con cédula: V-27865941, nombre: GREISMAR FRANYELI  TRAVIEZO FLORES', 'Caja', '2024-10-09 19:42:05.110315', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6200, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:42:05.280711', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6201, 'Obtener Carreras', 'Caja', '2024-10-09 19:42:05.280711', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6202, 'Añadir estudiante con cédula: V-30659332, nombre: MARIAFERNANDA CUELLO DA SILVA', 'Caja', '2024-10-09 19:43:17.30763', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6203, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:43:17.647551', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6204, 'Obtener Carreras', 'Caja', '2024-10-09 19:43:17.650543', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6205, 'Añadir estudiante con cédula: V-30477677, nombre: BRYAN RAFAEL ARIAS GIMÉNEZ', 'Caja', '2024-10-09 19:45:27.320406', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6206, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:45:27.501327', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6207, 'Obtener Carreras', 'Caja', '2024-10-09 19:45:27.501327', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6208, 'Añadir estudiante con cédula: V-13862485, nombre: KONIETZY	AVILA', 'Caja', '2024-10-09 19:48:26.76453', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6209, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:48:26.926653', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6210, 'Obtener Carreras', 'Caja', '2024-10-09 19:48:26.926653', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6211, 'Añadir estudiante con cédula: V-31081111, nombre: WILLIAM JAVIER	TALERO JIMÉNEZ', 'Caja', '2024-10-09 19:49:20.704761', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6212, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:49:20.884229', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6213, 'Obtener Carreras', 'Caja', '2024-10-09 19:49:20.893945', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6214, 'Añadir estudiante con cédula: V-29502239, nombre: DANIELA   	SALCEDO', 'Caja', '2024-10-09 19:50:17.180637', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6215, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:50:17.357415', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6216, 'Obtener Carreras', 'Caja', '2024-10-09 19:50:17.357415', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6217, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:50:27.770122', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6218, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:50:27.80417', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6219, 'Obtener Carreras', 'Caja', '2024-10-09 19:50:27.881288', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6220, 'Obtener Carreras', 'Caja', '2024-10-09 19:50:27.91256', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6221, 'Obtener estudiante con cédula: V-29502239', 'Caja', '2024-10-09 19:50:29.547886', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6222, 'Obtener Carreras', 'Caja', '2024-10-09 19:50:29.649926', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6223, 'Actualizar estudiante con cédula: V-29502239, nombre: DANIELA   	SALCEDO', 'Caja', '2024-10-09 19:50:48.59738', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6224, 'Obtener estudiante con cédula: V-29502239', 'Caja', '2024-10-09 19:50:48.797859', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6225, 'Obtener Carreras', 'Caja', '2024-10-09 19:50:48.916751', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6226, 'Obtener Carreras', 'Caja', '2024-10-09 19:50:49.164999', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6227, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:50:49.164999', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6228, 'Añadir estudiante con cédula: V-31055907, nombre: JHANNELYS NUÑEZ	NUÑEZ FUENTES', 'Caja', '2024-10-09 19:52:12.265572', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6229, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:52:12.433837', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6230, 'Obtener Carreras', 'Caja', '2024-10-09 19:52:12.449457', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6231, 'Añadir estudiante con cédula: V-31128439, nombre: GREISMARY JOSÉ	BOLIVAR ALECIO', 'Caja', '2024-10-09 19:53:19.696417', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6232, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:53:19.866017', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6233, 'Obtener Carreras', 'Caja', '2024-10-09 19:53:19.875957', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6234, 'Añadir estudiante con cédula: V-28316669, nombre: YORGELIS PATRICIA	VELASQUEZ RONDÓN', 'Caja', '2024-10-09 19:55:12.514883', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6235, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:55:12.678897', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6236, 'Obtener Carreras', 'Caja', '2024-10-09 19:55:12.678897', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6237, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-10-09 19:56:16.58585', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6238, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:56:19.975985', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6239, 'Obtener Carreras', 'Caja', '2024-10-09 19:56:19.981969', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6240, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:56:36.239052', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6241, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:56:36.342276', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6242, 'Obtener Carreras', 'Caja', '2024-10-09 19:56:36.351996', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6243, 'Obtener Carreras', 'Caja', '2024-10-09 19:56:36.43353', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6244, 'Obtener Carreras', 'Caja', '2024-10-09 19:56:36.602092', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6245, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:56:36.623724', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6246, 'Añadir estudiante con cédula: V-28387523, nombre: ANNGI NAKARID	MADRID QUINTANA', 'Caja', '2024-10-09 19:57:32.411874', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6247, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:57:32.575202', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6248, 'Obtener Carreras', 'Caja', '2024-10-09 19:57:32.575202', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6249, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:57:46.803354', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6250, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:57:46.909486', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6251, 'Obtener Carreras', 'Caja', '2024-10-09 19:57:47.010615', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6252, 'Obtener Carreras', 'Caja', '2024-10-09 19:57:47.018742', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6253, 'Obtener estudiante con cédula: V-28387523', 'Caja', '2024-10-09 19:57:48.366297', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6254, 'Obtener Carreras', 'Caja', '2024-10-09 19:57:48.472662', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6255, 'Actualizar estudiante con cédula: V-28387523, nombre: ANNGI NAKARID	MADRID QUINTANA', 'Caja', '2024-10-09 19:58:00.338502', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6256, 'Obtener estudiante con cédula: V-28387523', 'Caja', '2024-10-09 19:58:00.540186', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6257, 'Obtener Carreras', 'Caja', '2024-10-09 19:58:00.640222', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6258, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:58:00.873807', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6259, 'Obtener Carreras', 'Caja', '2024-10-09 19:58:00.873807', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6260, 'Añadir estudiante con cédula: V-30499959, nombre: JOSE GREGORIO	ALFONZO ARAQUE', 'Caja', '2024-10-09 19:59:45.11364', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6261, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 19:59:45.296537', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6262, 'Obtener Carreras', 'Caja', '2024-10-09 19:59:45.296537', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6263, 'Añadir estudiante con cédula: V-31652040, nombre: JHONATAN JOSÉ	GUACARE UGAS', 'Caja', '2024-10-09 20:00:37.533045', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6264, 'Obtener Carreras', 'Caja', '2024-10-09 20:00:37.71551', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6265, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:00:37.81656', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6266, 'Añadir estudiante con cédula: V-31182704, nombre: PAOLA ALEJANDRA	MENDOZA CARRILLO', 'Caja', '2024-10-09 20:01:29.671994', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6267, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:01:29.851424', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6268, 'Obtener Carreras', 'Caja', '2024-10-09 20:01:29.851424', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6269, 'Añadir estudiante con cédula: V-26680848, nombre: GLADIOLA CORINA	MATOS RODRÍGUEZ', 'Caja', '2024-10-09 20:02:40.115096', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6270, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:02:40.280346', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6271, 'Obtener Carreras', 'Caja', '2024-10-09 20:02:40.280346', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6272, 'Añadir estudiante con cédula: V-30643997, nombre: CÉSAR DANIEL	MÉNDEZ HERNÁNDEZ', 'Caja', '2024-10-09 20:04:10.331234', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6273, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:04:10.49517', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6274, 'Obtener Carreras', 'Caja', '2024-10-09 20:04:10.510768', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6275, 'Añadir estudiante con cédula: V-31469401, nombre: MARÍA JOSÉ	VIVAS RODRÍGUEZ', 'Caja', '2024-10-09 20:05:06.105715', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6276, 'Obtener Carreras', 'Caja', '2024-10-09 20:05:06.290302', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6277, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:05:06.389752', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6278, 'Añadir estudiante con cédula: V-30291842, nombre: DANIELA DEL VALLE	MARTINEZ HERNANDEZ', 'Caja', '2024-10-09 20:06:10.477104', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6279, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:06:10.642229', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6280, 'Obtener Carreras', 'Caja', '2024-10-09 20:06:10.642229', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6281, 'Añadir estudiante con cédula: V-31407711, nombre: ARIAMNY LUISANA	AGUILERA RODRIGUEZ', 'Caja', '2024-10-09 20:07:00.673446', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6282, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:07:00.844101', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6283, 'Obtener Carreras', 'Caja', '2024-10-09 20:07:00.844101', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6284, 'Añadir estudiante con cédula: V-14319901, nombre: EDGAR JOSE	REINA PARISCA', 'Caja', '2024-10-09 20:08:37.786855', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6285, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:08:37.966227', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6286, 'Obtener Carreras', 'Caja', '2024-10-09 20:08:37.966227', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6287, 'Añadir estudiante con cédula: V-26484537, nombre: DIEGO LUIS	MARIN FUENTES', 'Caja', '2024-10-09 20:09:36.967675', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6288, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:09:37.151499', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6289, 'Obtener Carreras', 'Caja', '2024-10-09 20:09:37.157503', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6290, 'Añadir estudiante con cédula: V-30090674, nombre: MICHAEL ELEAZAR	HERNANDEZ TERAN', 'Caja', '2024-10-09 20:15:30.398804', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6291, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:15:30.574057', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6292, 'Obtener Carreras', 'Caja', '2024-10-09 20:15:30.579093', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6293, 'Añadir estudiante con cédula: V-30147650, nombre: IVENS ANTONIO	LANDAEZ LANDAEZ', 'Caja', '2024-10-09 20:16:26.021904', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6294, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:16:26.18931', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6295, 'Obtener Carreras', 'Caja', '2024-10-09 20:16:26.18931', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6296, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:17:15.169814', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6297, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:17:15.226369', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6298, 'Obtener Carreras', 'Caja', '2024-10-09 20:17:15.284032', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6299, 'Obtener Carreras', 'Caja', '2024-10-09 20:17:15.315278', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6300, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:17:17.125598', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6301, 'Obtener Carreras', 'Caja', '2024-10-09 20:17:17.126569', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6302, 'Añadir estudiante con cédula: V-30924161, nombre: GABRIEL ENRIQUE	YANEZ ZAMORA', 'Caja', '2024-10-09 20:18:26.33949', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6303, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:18:26.513752', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6304, 'Obtener Carreras', 'Caja', '2024-10-09 20:18:26.516743', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6305, 'Añadir estudiante con cédula: V-23786262, nombre: JOSE JESUS	MIRELIS PEREZ', 'Caja', '2024-10-09 20:19:18.27149', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6306, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:19:18.456471', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6307, 'Obtener Carreras', 'Caja', '2024-10-09 20:19:18.48792', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6308, 'Añadir estudiante con cédula: V-30596054, nombre: JOSE MIGUEL	MEDINA RODRIGUEZ', 'Caja', '2024-10-09 20:20:09.870961', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6309, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:20:10.051578', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6310, 'Obtener Carreras', 'Caja', '2024-10-09 20:20:10.057563', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6311, 'Añadir estudiante con cédula: V-30406816, nombre: KEYBEL STYVEN	CEDEÑO PEREZ', 'Caja', '2024-10-09 20:21:01.782652', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6312, 'Obtener Carreras', 'Caja', '2024-10-09 20:21:01.961011', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6313, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:21:02.067421', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6314, 'Añadir estudiante con cédula: V-27712263, nombre: JOSE MANUEL	LLOVERA URERA', 'Caja', '2024-10-09 20:22:28.534579', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6315, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:22:28.874092', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6316, 'Obtener Carreras', 'Caja', '2024-10-09 20:22:28.877082', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6317, 'Añadir estudiante con cédula: V-23423801, nombre: JOSE RAFAEL	ULLOA MACHADO', 'Caja', '2024-10-09 20:24:27.454223', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6318, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:24:27.623996', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6319, 'Obtener Carreras', 'Caja', '2024-10-09 20:24:27.631976', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6320, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:26:37.826646', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6321, 'Obtener Carreras', 'Caja', '2024-10-09 20:26:37.92664', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6322, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:26:50.45165', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6323, 'Obtener Carreras', 'Caja', '2024-10-09 20:26:50.455578', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6324, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:26:54.648954', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6325, 'Obtener Carreras', 'Caja', '2024-10-09 20:26:54.753284', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6326, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:27:07.564821', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6327, 'Obtener Carreras', 'Caja', '2024-10-09 20:27:07.570807', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6328, 'Obtener estudiante con cédula: V-28387523', 'Caja', '2024-10-09 20:27:08.946491', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6329, 'Obtener Carreras', 'Caja', '2024-10-09 20:27:09.049873', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6330, 'Obtener Carreras', 'Caja', '2024-10-09 20:27:10.811855', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6331, 'Obtener todos los estudiantes', 'Caja', '2024-10-09 20:27:10.815845', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6332, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-11-04 20:45:55.620707', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6333, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 20:46:49.716317', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6334, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 20:47:45.34589', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6335, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 20:47:45.458866', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6336, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:47:45.602579', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6337, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:48:09.130217', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6338, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 20:48:24.607091', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6339, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 20:48:24.721206', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6340, 'Obtener Materia con id: 01ING132', 'Usuario coordinador', '2024-11-04 20:48:44.020969', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6341, 'Obtener Materia con id: 01EDF121', 'Usuario coordinador', '2024-11-04 20:48:47.447142', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6342, 'Obtener Materia con id: 01AMA144', 'Usuario coordinador', '2024-11-04 20:48:49.76874', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6343, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:48:52.367421', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6344, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 20:48:54.941775', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6345, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 20:48:55.067702', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6346, 'Obtener Materia con id: 01ING132', 'Usuario coordinador', '2024-11-04 20:48:56.762748', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6347, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 20:49:30.8255', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6348, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 20:49:30.942761', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6349, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:49:31.05741', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6350, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:49:34.185339', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6351, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 20:49:35.766197', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6352, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 20:49:35.87323', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6353, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:49:35.987489', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6354, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:50:29.151473', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6355, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:50:37.289889', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6356, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:50:37.389239', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6357, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:50:53.850844', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6358, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:50:53.951139', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6359, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:50:54.204261', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6360, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:50:54.31146', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6361, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:50:56.998517', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6362, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:50:57.107503', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6363, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:50:57.337707', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6364, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:50:57.444067', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6365, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:50:58.089039', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6366, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:50:58.202303', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6367, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:51:03.168323', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6368, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:51:03.283263', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6369, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:51:07.073418', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6370, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:51:07.171908', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6371, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:51:07.407297', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6372, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:51:07.673217', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6373, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:51:10.880702', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6374, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:51:10.996068', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6375, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:51:14.14848', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6376, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:51:14.256857', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6377, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:51:17.04359', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6378, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:51:17.138527', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6379, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:51:24.401102', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6380, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:51:24.515551', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6381, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:53:22.188405', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6382, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:53:22.315588', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6383, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-04 20:53:26.434636', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6384, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 20:53:26.550747', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6385, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-11-04 21:08:24.463356', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6386, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 21:08:27.916398', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6387, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 21:08:28.026332', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6388, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 21:08:28.132378', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6389, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 21:08:30.095548', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6390, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 21:08:32.163052', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6391, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 21:08:32.277679', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6392, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 21:08:32.383426', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6393, 'Obtener Carreras', 'Usuario coordinador', '2024-11-04 21:13:25.413431', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6394, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 21:13:30.168338', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6395, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 21:13:30.267967', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6396, 'Obtener Materia con id: 06INF153', 'Usuario coordinador', '2024-11-04 21:13:32.64926', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6397, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 21:13:43.523208', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6398, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 21:13:43.642296', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6399, 'Obtener Materia con id: 07TEI122', 'Usuario coordinador', '2024-11-04 21:13:46.34519', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6400, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 21:13:50.952544', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6401, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 21:13:51.079316', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6402, 'Obtener Materia con id: 07ESG333', 'Usuario coordinador', '2024-11-04 21:13:55.784023', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6403, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-04 21:14:05.811165', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6404, 'Obtener Docentes', 'Usuario coordinador', '2024-11-04 21:14:05.933683', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6405, 'Obtener Materia con id: 02EDF121', 'Usuario coordinador', '2024-11-04 21:14:08.412883', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6406, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-11-04 21:14:22.001729', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6407, 'Obtener todos los estudiantes', 'Caja', '2024-11-04 21:14:23.918897', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6408, 'Obtener Carreras', 'Caja', '2024-11-04 21:14:24.135704', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6409, 'Obtener todos los estudiantes', 'Caja', '2024-11-04 21:14:25.475636', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6410, 'Obtener Carreras', 'Caja', '2024-11-04 21:14:25.574178', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6411, 'Obtener estudiante con cédula: V-10459189', 'Caja', '2024-11-04 21:14:31.599339', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6412, 'Obtener Carreras', 'Caja', '2024-11-04 21:14:31.701601', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6413, 'Obtener todos los estudiantes', 'Caja', '2024-11-04 21:14:34.280054', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6414, 'Obtener Carreras', 'Caja', '2024-11-04 21:14:34.383228', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6415, 'Obtener todos los estudiantes', 'Caja', '2024-11-04 21:14:36.389713', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6416, 'Obtener Carreras', 'Caja', '2024-11-04 21:14:36.399255', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6417, 'Obtener Materia con id: 021NG132', 'Usuario coordinador', '2024-11-04 21:14:38.948854', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6418, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-11-04 21:15:33.902237', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6419, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-04 21:16:11.265141', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6420, 'Obtener todas las Materias', 'Usuario control de estudio', '2024-11-04 21:16:33.43467', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6421, 'Obtener Docentes', 'Usuario control de estudio', '2024-11-04 21:16:33.550585', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6422, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-11-04 21:16:55.303001', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6423, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-11-04 21:17:43.94265', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6424, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-04 21:17:44.033626', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6425, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-11-04 21:17:59.746273', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6426, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-04 21:17:59.855069', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6427, 'Obtener estudiante con cédula: V-14319901', 'Usuario control de estudio', '2024-11-04 21:18:01.563129', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6428, 'Obtener Notas del Estudiante con cédula: V-14319901', 'Usuario control de estudio', '2024-11-04 21:18:01.711206', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6429, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-11-04 21:18:02.139328', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6430, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-04 21:18:02.305049', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6431, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-11-04 21:18:26.75331', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6432, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-04 21:18:26.853183', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6433, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-11-04 21:23:08.047512', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6434, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-04 21:23:08.153247', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6435, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-11-04 21:28:43.558644', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6436, 'Obtener todo el Control', 'admin', '2024-11-04 21:30:18.898565', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6437, 'Obtener Coordinadores', 'admin', '2024-11-04 21:30:33.660916', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6438, 'Obtener Coordinadores', 'admin', '2024-11-04 21:30:50.854073', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6439, 'Obtener todo el Control', 'admin', '2024-11-04 21:31:04.897435', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6440, 'Obtener Carreras', 'admin', '2024-11-04 21:32:20.166986', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6441, 'Inicio de sesión del usuario: caja_pascal', 'caja_pascal', '2024-11-25 21:56:56.395787', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6442, 'Obtener Carreras', 'Caja', '2024-11-25 21:56:59.724807', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6443, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 21:56:59.736774', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6444, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 21:57:01.260795', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6445, 'Obtener Carreras', 'Caja', '2024-11-25 21:57:01.358387', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6446, 'Obtener Carreras', 'Caja', '2024-11-25 21:57:05.467382', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6447, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 21:57:05.469377', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6448, 'Obtener todos los pagos', 'Caja', '2024-11-25 21:57:21.23479', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6449, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 21:57:21.336119', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6450, 'Obtener todos los pagos', 'Caja', '2024-11-25 21:57:26.183203', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6451, 'Obtener todos los pagos', 'Caja', '2024-11-25 21:57:26.454215', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6452, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 21:57:26.585422', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6453, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 21:57:34.284026', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6454, 'Obtener todos los pagos', 'Caja', '2024-11-25 21:57:36.982983', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6455, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 21:57:37.089666', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6456, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-11-25 21:57:53.95756', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6457, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 21:58:01.394597', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6458, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 21:58:04.331231', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6459, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 21:58:19.64552', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6460, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 21:58:19.747812', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6461, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 21:58:19.856526', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6462, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 21:58:23.23961', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6463, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 21:58:27.679872', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6464, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 21:58:27.797721', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6465, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 21:58:35.62757', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6466, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 21:58:35.750206', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6467, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-25 21:58:40.701137', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6468, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 21:58:40.801891', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6469, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-25 21:58:42.959592', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6470, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 21:58:43.056333', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6471, 'Obtener estudiante con cédula: V-10459189', 'Usuario coordinador', '2024-11-25 21:58:44.876643', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6472, 'Obtener Notas del Estudiante con cédula: V-10459189', 'Usuario coordinador', '2024-11-25 21:58:45.021528', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6473, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-25 21:58:45.425071', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6474, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 21:58:45.55087', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6475, 'Obtener todos los estudiantes', 'Usuario coordinador', '2024-11-25 21:58:59.169158', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6476, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 21:58:59.375218', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6477, 'Inicio de sesión del control con cédula: V-45678910', 'control1@gmail.com', '2024-11-25 21:59:20.207987', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6478, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-25 21:59:23.043777', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6479, 'Obtener todas las Materias', 'Usuario control de estudio', '2024-11-25 21:59:25.384931', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6480, 'Obtener Docentes', 'Usuario control de estudio', '2024-11-25 21:59:25.504089', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6481, 'Obtener Materia con id: 05ING222', 'Usuario control de estudio', '2024-11-25 21:59:27.992513', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6482, 'Obtener todas las Peticiones', 'Usuario control de estudio', '2024-11-25 21:59:33.720374', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6483, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-11-25 21:59:39.074386', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6484, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-25 21:59:39.32706', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6485, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-11-25 21:59:40.981178', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6486, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-25 21:59:41.239698', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6487, 'Obtener estudiante con cédula: V-14319901', 'Usuario control de estudio', '2024-11-25 21:59:42.893995', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6488, 'Obtener Notas del Estudiante con cédula: V-14319901', 'Usuario control de estudio', '2024-11-25 21:59:43.320012', 'Estudiante', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6489, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-11-25 21:59:43.728437', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6490, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-25 21:59:43.912942', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6491, 'Obtener todos los estudiantes', 'Usuario control de estudio', '2024-11-25 21:59:45.149606', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6492, 'Obtener Carreras', 'Usuario control de estudio', '2024-11-25 21:59:45.256256', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6493, 'Inicio de sesión del super usuario con cédula: V-12345', 'admin@pascal.com', '2024-11-25 22:00:12.793042', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6494, 'Obtener todo el Control', 'admin', '2024-11-25 22:00:17.858035', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6495, 'Obtener Coordinadores', 'admin', '2024-11-25 22:00:22.8718', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6496, 'Obtener Coordinadores', 'admin', '2024-11-25 22:00:26.628978', 'Coordinacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6497, 'Obtener todo el Control', 'admin', '2024-11-25 22:00:30.168768', 'Control de estudios', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6498, 'Obtener Carreras', 'admin', '2024-11-25 22:00:59.008712', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6499, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 22:01:40.954679', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6500, 'Obtener Carreras', 'Caja', '2024-11-25 22:01:40.959665', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6501, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 22:01:42.43075', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6502, 'Obtener Carreras', 'Caja', '2024-11-25 22:01:42.551427', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6503, 'Obtener estudiante con cédula: V-10459189', 'Caja', '2024-11-25 22:01:44.097886', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6504, 'Obtener Carreras', 'Caja', '2024-11-25 22:01:44.209587', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6505, 'Obtener todos los pagos', 'Caja', '2024-11-25 22:02:18.410781', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6506, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 22:02:18.516941', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6507, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 22:02:20.504213', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6508, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-11-25 22:02:42.283143', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6509, 'Actualizar Configuración con id: 1, ciclo: 2024-1', 'Usuario coordinador', '2024-11-25 22:04:28.040414', 'General', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6510, 'Añadir pago para el estudiante con cédula: V-10459189, monto: <models.entities.monto.Monto object at 0x0000018888B4D3D0>', 'Caja', '2024-11-25 22:04:45.666281', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6511, 'Obtener pago con id: 75', 'Caja', '2024-11-25 22:04:46.206691', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6512, 'Obtener estudiante con cédula: V-10459189', 'Caja', '2024-11-25 22:04:46.312915', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6513, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 22:05:14.066213', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6514, 'Añadir pago para el estudiante con cédula: V-10459189, monto: <models.entities.monto.Monto object at 0x0000018888B4DA30>', 'Caja', '2024-11-25 22:06:05.722662', 'Administración', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6515, 'Obtener pago con id: 76', 'Caja', '2024-11-25 22:06:06.297339', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6516, 'Obtener estudiante con cédula: V-10459189', 'Caja', '2024-11-25 22:06:06.395137', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6517, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 22:06:11.238979', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6518, 'Inicio de sesión del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:06:15.764067', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6519, 'Obtener notas del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:06:16.367843', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6520, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:06:16.473037', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6521, 'Obtener histórico del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:06:26.43719', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6522, 'Obtener notas del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:06:27.769281', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6523, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:06:27.877273', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6524, 'Obtener notas del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:06:33.956302', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6525, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:06:34.054722', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6526, 'Actualizar Configuración con id: 1, ciclo: 2024-1', 'Usuario coordinador', '2024-11-25 22:07:24.106939', 'General', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6527, 'Obtener notas del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:07:27.433569', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6528, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:07:27.666735', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6529, 'Obtener notas del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:07:29.514399', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6530, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:07:29.626073', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6531, 'Obtener notas del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:07:34.256096', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6532, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:07:34.361254', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6533, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:07:40.125183', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6534, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:07:41.752952', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6535, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 22:07:41.86169', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6536, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:07:41.970676', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6537, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:07:47.924806', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6538, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:08:00.128011', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6539, 'Obtener todos los pagos', 'Caja', '2024-11-25 22:08:07.255111', 'Administración', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6540, 'Obtener todos los estudiantes', 'Caja', '2024-11-25 22:08:07.357033', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6541, 'Obtener todos los estudiantes', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:08:09.55918', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6542, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:08:09.564167', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6543, 'Obtener todos los estudiantes', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:08:11.160656', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6544, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:08:11.278983', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6545, 'Obtener estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:08:13.122135', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6546, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:08:13.23683', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6547, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 22:08:26.813716', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6548, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:08:26.940344', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6549, 'Obtener Materia con id: 02ADM133', 'Usuario coordinador', '2024-11-25 22:08:30.429336', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6550, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:08:38.041493', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6551, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:08:39.69369', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6552, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 22:08:39.792915', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6553, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:08:39.903278', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6554, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:08:56.654491', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6555, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 22:08:59.898427', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6556, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:09:00.021491', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6557, 'Actualizar Materia con id: 02ADM133, nombre: ADMINISTRACIÓN I', 'Usuario coordinador', '2024-11-25 22:09:45.770615', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6558, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:09:46.064045', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6559, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:09:46.160788', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6560, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 22:09:46.185719', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6561, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 22:09:46.277843', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6562, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:09:46.309761', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6563, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:09:46.399041', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6564, 'Obtener notas del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:09:54.985338', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6565, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:09:55.103794', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6566, 'Obtener materias válidas para inscripción del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:09:57.161899', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6567, 'Obtener Docentes', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:09:57.271999', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6568, 'Actualizar Materia con id: 02ADM133, nombre: ADMINISTRACIÓN I', 'Usuario coordinador', '2024-11-25 22:10:34.348878', 'Materias', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6569, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:10:34.679161', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6570, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:10:34.805822', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6571, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 22:10:34.864356', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6572, 'Obtener todas las Materias', 'Usuario coordinador', '2024-11-25 22:10:34.959102', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6573, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:10:35.153582', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6574, 'Obtener Carreras', 'Usuario coordinador', '2024-11-25 22:10:35.166547', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6575, 'Obtener materias válidas para inscripción del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:10:38.462133', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6576, 'Obtener Docentes', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:10:38.581991', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6577, 'Obtener materias válidas para inscripción del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:10:52.467294', 'Materias', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6578, 'Añadir materia 02ADM133 al estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:10:52.67078', 'Estudiantes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6579, 'Obtener horario del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:10:53.174367', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6580, 'Obtener notas del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:10:53.524455', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6581, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:10:53.628372', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6582, 'Obtener horario del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:10:57.627422', 'Estudiantes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6583, 'Obtener notas del estudiante con cédula: V-10459189', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:11:02.762543', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6584, 'Obtener Carreras', 'TAMARA VERÓNICA LORENZO GUEVARA', '2024-11-25 22:11:02.868385', 'General', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6585, 'Inicio de sesión del docente con cédula: V-29890437', 'elibeth@gmail.com', '2024-11-25 22:17:26.132674', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6586, 'Obtener Docente con cédula: V-29890437', 'elibeth curalli', '2024-11-25 22:17:26.742397', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6587, 'Obtener todas las Peticiones', 'elibeth curalli', '2024-11-25 22:17:26.776306', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6588, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-11-25 22:20:56.817369', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6589, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:21:11.629156', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6590, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:31:16.357233', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6591, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:31:33.754936', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6592, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:31:33.761972', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6593, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:33:18.811499', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6594, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:45:51.03497', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6595, 'Inicio de sesión del coordinador con cédula: V-12345678', 'coordinador1@gmail.com', '2024-11-25 22:56:27.225175', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6596, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:56:33.697333', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6597, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:56:38.815641', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6598, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:56:44.867114', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6599, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:56:56.191086', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6600, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:56:58.592236', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6601, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:57:00.629346', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6602, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:57:02.486119', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6603, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:58:14.406623', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6604, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:58:57.478352', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6605, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 22:59:25.626703', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6606, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 23:00:22.409322', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6607, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 23:00:31.426013', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6608, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 23:01:17.896025', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6609, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 23:02:15.301827', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6610, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 23:02:29.413253', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6611, 'Reiniciar contraseña del docente: Henrry bourgeot', 'coordinador1@gmail.com', '2024-11-25 23:04:33.344207', 'Docentes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6612, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 23:04:33.456001', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6613, 'Reiniciar contraseña del docente: Henrry bourgeot', 'coordinador1@gmail.com', '2024-11-25 23:05:00.988426', 'Docentes', 2);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6614, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 23:05:01.101356', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6615, 'Inicio de sesión del docente con cédula: V-30555724', 'henrry@gmail.com', '2024-11-25 23:05:35.301732', 'Autenticacion', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6616, 'Obtener Docente con cédula: V-30555724', 'Henrry bourgeot', '2024-11-25 23:05:36.07651', 'Docentes', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6617, 'Obtener todas las Peticiones', 'Henrry bourgeot', '2024-11-25 23:05:36.078505', 'Peticiones', 1);
INSERT INTO public.trazabilidad (id, accion, usuario, fecha, modulo, nivel_alerta) VALUES (6618, 'Obtener Docentes', 'Usuario coordinador', '2024-11-25 23:07:01.775395', 'Docentes', 1);


--
-- TOC entry 5006 (class 0 OID 16693)
-- Dependencies: 242
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 216
-- Name: billetes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billetes_id_seq', 53, true);


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

SELECT pg_catalog.setval('public.materias_estudiantes_id_seq', 98, true);


--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 230
-- Name: metodo_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metodo_pago_id_seq', 93, true);


--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 232
-- Name: monto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.monto_id_seq', 93, true);


--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 234
-- Name: pagos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pagos_id_seq', 76, true);


--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 236
-- Name: peticiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peticiones_id_seq', 14, true);


--
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 239
-- Name: transferencias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transferencias_id_seq', 29, true);


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 241
-- Name: trazabilidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trazabilidad_id_seq', 6618, true);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 243
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 2, true);


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


-- Completed on 2024-11-25 23:10:09

--
-- PostgreSQL database dump complete
--

