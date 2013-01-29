--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: AuthAssignment; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE "AuthAssignment" (
    itemname character varying(64) NOT NULL,
    userid character varying(64) NOT NULL,
    bizrule text,
    data text
);


ALTER TABLE public."AuthAssignment" OWNER TO postgres;

--
-- Name: AuthItem; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE "AuthItem" (
    name character varying(64) NOT NULL,
    type integer NOT NULL,
    description text,
    bizrule text,
    data text
);


ALTER TABLE public."AuthItem" OWNER TO postgres;

--
-- Name: YiiSession; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE "YiiSession" (
    id character(32) NOT NULL,
    expire integer,
    data text
);


ALTER TABLE public."YiiSession" OWNER TO postgres;

--
-- Name: author; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE author (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    orcid character varying(128) NOT NULL,
    rank integer NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE author_id_seq
    START WITH 1177
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE author_id_seq OWNED BY author.id;


--
-- Name: dataset; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE dataset (
    id integer NOT NULL,
    submitter_id integer NOT NULL,
    image_id integer,
    identifier character varying(32) NOT NULL,
    title character varying(300) NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    dataset_size bigint NOT NULL,
    ftp_site character varying(100) NOT NULL,
    upload_status character varying(45) DEFAULT 'Pending'::character varying NOT NULL,
    excelfile character varying(50),
    excelfile_md5 character varying(32),
    publication_date date,
    modification_date date,
    publisher_id integer
);


ALTER TABLE public.dataset OWNER TO postgres;

--
-- Name: dataset_author; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE dataset_author (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.dataset_author OWNER TO postgres;

--
-- Name: dataset_author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dataset_author_id_seq
    START WITH 1177
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dataset_author_id_seq OWNER TO postgres;

--
-- Name: dataset_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dataset_author_id_seq OWNED BY dataset_author.id;


--
-- Name: dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dataset_id_seq
    START WITH 33
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dataset_id_seq OWNER TO postgres;

--
-- Name: dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dataset_id_seq OWNED BY dataset.id;


--
-- Name: dataset_project; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE dataset_project (
    id integer NOT NULL,
    dataset_id integer,
    project_id integer
);


ALTER TABLE public.dataset_project OWNER TO postgres;

--
-- Name: dataset_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dataset_project_id_seq
    START WITH 7
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dataset_project_id_seq OWNER TO postgres;

--
-- Name: dataset_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dataset_project_id_seq OWNED BY dataset_project.id;


--
-- Name: dataset_sample; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE dataset_sample (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    sample_id integer NOT NULL
);


ALTER TABLE public.dataset_sample OWNER TO postgres;

--
-- Name: dataset_sample_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dataset_sample_id_seq
    START WITH 211
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dataset_sample_id_seq OWNER TO postgres;

--
-- Name: dataset_sample_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dataset_sample_id_seq OWNED BY dataset_sample.id;


--
-- Name: dataset_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE dataset_type (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    type_id integer
);


ALTER TABLE public.dataset_type OWNER TO postgres;

--
-- Name: dataset_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dataset_type_id_seq
    START WITH 37
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dataset_type_id_seq OWNER TO postgres;

--
-- Name: dataset_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dataset_type_id_seq OWNED BY dataset_type.id;


--
-- Name: external_link; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE external_link (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    url character varying(128) NOT NULL,
    external_link_type_id integer NOT NULL
);


ALTER TABLE public.external_link OWNER TO postgres;

--
-- Name: external_link_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE external_link_id_seq
    START WITH 17
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.external_link_id_seq OWNER TO postgres;

--
-- Name: external_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE external_link_id_seq OWNED BY external_link.id;


--
-- Name: external_link_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE external_link_type (
    id integer NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.external_link_type OWNER TO postgres;

--
-- Name: external_link_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE external_link_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.external_link_type_id_seq OWNER TO postgres;

--
-- Name: external_link_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE external_link_type_id_seq OWNED BY external_link_type.id;


--
-- Name: file; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE file (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    sample_id integer,
    name character varying(100) NOT NULL,
    location character varying(200) NOT NULL,
    extension character varying(30) NOT NULL,
    size bigint NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    date_stamp date,
    format_id integer,
    type_id integer,
    code character varying(64) DEFAULT 'FILE_CODE'::character varying
);


ALTER TABLE public.file OWNER TO postgres;

--
-- Name: file_format; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE file_format (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    description text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.file_format OWNER TO postgres;

--
-- Name: file_format_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE file_format_id_seq
    START WITH 26
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.file_format_id_seq OWNER TO postgres;

--
-- Name: file_format_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE file_format_id_seq OWNED BY file_format.id;


--
-- Name: file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE file_id_seq
    START WITH 6716
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.file_id_seq OWNER TO postgres;

--
-- Name: file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE file_id_seq OWNED BY file.id;


--
-- Name: file_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE file_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.file_type OWNER TO postgres;

--
-- Name: file_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE file_type_id_seq
    START WITH 15
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.file_type_id_seq OWNER TO postgres;

--
-- Name: file_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE file_type_id_seq OWNED BY file_type.id;


--
-- Name: gigadb_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE gigadb_user (
    id integer NOT NULL,
    email character varying(64) NOT NULL,
    password character varying(64) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    affiliation character varying(100) NOT NULL,
    role character varying(30) DEFAULT 'user'::character varying NOT NULL,
    is_activated boolean DEFAULT false NOT NULL,
    newsletter boolean DEFAULT true NOT NULL
);


ALTER TABLE public.gigadb_user OWNER TO postgres;

--
-- Name: gigadb_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE gigadb_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.gigadb_user_id_seq OWNER TO postgres;

--
-- Name: gigadb_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE gigadb_user_id_seq OWNED BY gigadb_user.id;


--
-- Name: image; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE image (
    id integer NOT NULL,
    location character varying(45) NOT NULL,
    tag character varying(50),
    url character varying(256),
    license text NOT NULL,
    photographer character varying(128) NOT NULL,
    source character varying(256) NOT NULL
);


ALTER TABLE public.image OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE image_id_seq
    START WITH 31
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO postgres;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE image_id_seq OWNED BY image.id;


--
-- Name: link; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE link (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    is_primary boolean DEFAULT false NOT NULL,
    link character varying(100) NOT NULL
);


ALTER TABLE public.link OWNER TO postgres;

--
-- Name: link_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE link_id_seq
    START WITH 66
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.link_id_seq OWNER TO postgres;

--
-- Name: link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE link_id_seq OWNED BY link.id;


--
-- Name: manuscript; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE manuscript (
    id integer NOT NULL,
    identifier character varying(32) NOT NULL,
    pmid integer,
    dataset_id integer NOT NULL
);


ALTER TABLE public.manuscript OWNER TO postgres;

--
-- Name: manuscript_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE manuscript_id_seq
    START WITH 27
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.manuscript_id_seq OWNER TO postgres;

--
-- Name: manuscript_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE manuscript_id_seq OWNED BY manuscript.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE news (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    body text DEFAULT ''::text NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE news_id_seq OWNED BY news.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE project (
    id integer NOT NULL,
    url character varying(128) NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    image_location character varying(100)
);


ALTER TABLE public.project OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE project_id_seq
    START WITH 7
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO postgres;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE project_id_seq OWNED BY project.id;


--
-- Name: publisher; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE publisher (
    id integer NOT NULL,
    name character varying(45) NOT NULL,
    description text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.publisher OWNER TO postgres;

--
-- Name: publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE publisher_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.publisher_id_seq OWNER TO postgres;

--
-- Name: publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE publisher_id_seq OWNED BY publisher.id;


--
-- Name: relation; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE relation (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    related_doi character varying(15) NOT NULL,
    relationship character varying(30) NOT NULL
);


ALTER TABLE public.relation OWNER TO postgres;

--
-- Name: relation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE relation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.relation_id_seq OWNER TO postgres;

--
-- Name: relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE relation_id_seq OWNED BY relation.id;


--
-- Name: rss_message; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE rss_message (
    id integer NOT NULL,
    message character varying(128) NOT NULL,
    publication_date date DEFAULT ('now'::text)::date NOT NULL
);


ALTER TABLE public.rss_message OWNER TO postgres;

--
-- Name: rss_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rss_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rss_message_id_seq OWNER TO postgres;

--
-- Name: rss_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rss_message_id_seq OWNED BY rss_message.id;


--
-- Name: sample; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE sample (
    id integer NOT NULL,
    species_id integer NOT NULL,
    s_attrs text DEFAULT ''::text,
    code character varying(50) DEFAULT 'SAMPLE:SRS188811'::character varying NOT NULL
);


ALTER TABLE public.sample OWNER TO postgres;

--
-- Name: sample_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sample_id_seq
    START WITH 210
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sample_id_seq OWNER TO postgres;

--
-- Name: sample_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sample_id_seq OWNED BY sample.id;


--
-- Name: schemup_tables; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE schemup_tables (
    table_name character varying NOT NULL,
    version character varying NOT NULL,
    is_current boolean DEFAULT false NOT NULL,
    schema text
);


ALTER TABLE public.schemup_tables OWNER TO postgres;

--
-- Name: search; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE search (
    id integer NOT NULL,
    user_id integer NOT NULL,
    name character varying(128) NOT NULL,
    query text NOT NULL,
    result text
);


ALTER TABLE public.search OWNER TO postgres;

--
-- Name: search_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE search_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.search_id_seq OWNER TO postgres;

--
-- Name: search_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE search_id_seq OWNED BY search.id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE species (
    id integer NOT NULL,
    tax_id integer NOT NULL,
    common_name character varying(64) NOT NULL,
    genbank_name character varying(128),
    scientific_name character varying(128) NOT NULL
);


ALTER TABLE public.species OWNER TO postgres;

--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE species_id_seq
    START WITH 28
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.species_id_seq OWNER TO postgres;

--
-- Name: species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE species_id_seq OWNED BY species.id;


--
-- Name: type; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE type (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    description text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.type OWNER TO postgres;

--
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE type_id_seq
    START WITH 6
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.type_id_seq OWNER TO postgres;

--
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE type_id_seq OWNED BY type.id;


--
-- Name: yiisession; Type: TABLE; Schema: public; Owner: postgres; Tablespace:
--

CREATE TABLE yiisession (
    id character(32) NOT NULL,
    expire integer,
    data text
);


ALTER TABLE public.yiisession OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY author ALTER COLUMN id SET DEFAULT nextval('author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset ALTER COLUMN id SET DEFAULT nextval('dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_author ALTER COLUMN id SET DEFAULT nextval('dataset_author_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_project ALTER COLUMN id SET DEFAULT nextval('dataset_project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_sample ALTER COLUMN id SET DEFAULT nextval('dataset_sample_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_type ALTER COLUMN id SET DEFAULT nextval('dataset_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY external_link ALTER COLUMN id SET DEFAULT nextval('external_link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY external_link_type ALTER COLUMN id SET DEFAULT nextval('external_link_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file ALTER COLUMN id SET DEFAULT nextval('file_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file_format ALTER COLUMN id SET DEFAULT nextval('file_format_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file_type ALTER COLUMN id SET DEFAULT nextval('file_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY gigadb_user ALTER COLUMN id SET DEFAULT nextval('gigadb_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY image ALTER COLUMN id SET DEFAULT nextval('image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY link ALTER COLUMN id SET DEFAULT nextval('link_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manuscript ALTER COLUMN id SET DEFAULT nextval('manuscript_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY news ALTER COLUMN id SET DEFAULT nextval('news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY publisher ALTER COLUMN id SET DEFAULT nextval('publisher_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relation ALTER COLUMN id SET DEFAULT nextval('relation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rss_message ALTER COLUMN id SET DEFAULT nextval('rss_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sample ALTER COLUMN id SET DEFAULT nextval('sample_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY search ALTER COLUMN id SET DEFAULT nextval('search_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY species ALTER COLUMN id SET DEFAULT nextval('species_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY type ALTER COLUMN id SET DEFAULT nextval('type_id_seq'::regclass);


--
-- Name: AuthAssignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY "AuthAssignment"
    ADD CONSTRAINT "AuthAssignment_pkey" PRIMARY KEY (itemname, userid);


--
-- Name: AuthItem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY "AuthItem"
    ADD CONSTRAINT "AuthItem_pkey" PRIMARY KEY (name);


--
-- Name: author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: dataset_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY dataset_author
    ADD CONSTRAINT dataset_author_pkey PRIMARY KEY (id);


--
-- Name: dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (id);


--
-- Name: dataset_project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY dataset_project
    ADD CONSTRAINT dataset_project_pkey PRIMARY KEY (id);


--
-- Name: dataset_sample_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY dataset_sample
    ADD CONSTRAINT dataset_sample_pkey PRIMARY KEY (id);


--
-- Name: dataset_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY dataset_type
    ADD CONSTRAINT dataset_type_pkey PRIMARY KEY (id);


--
-- Name: external_link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY external_link
    ADD CONSTRAINT external_link_pkey PRIMARY KEY (id);


--
-- Name: external_link_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY external_link_type
    ADD CONSTRAINT external_link_type_pkey PRIMARY KEY (id);


--
-- Name: file_format_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY file_format
    ADD CONSTRAINT file_format_pkey PRIMARY KEY (id);


--
-- Name: file_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY file
    ADD CONSTRAINT file_pkey PRIMARY KEY (id);


--
-- Name: file_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY file_type
    ADD CONSTRAINT file_type_pkey PRIMARY KEY (id);


--
-- Name: gigadb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY gigadb_user
    ADD CONSTRAINT gigadb_user_pkey PRIMARY KEY (id);


--
-- Name: image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY link
    ADD CONSTRAINT link_pkey PRIMARY KEY (id);


--
-- Name: manuscript_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY manuscript
    ADD CONSTRAINT manuscript_pkey PRIMARY KEY (id);


--
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);


--
-- Name: relation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY relation
    ADD CONSTRAINT relation_pkey PRIMARY KEY (id);


--
-- Name: rss_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY rss_message
    ADD CONSTRAINT rss_message_pkey PRIMARY KEY (id);


--
-- Name: sample_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_pkey PRIMARY KEY (id);


--
-- Name: search_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY search
    ADD CONSTRAINT search_pkey PRIMARY KEY (id);


--
-- Name: species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);


--
-- Name: yiisession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY "YiiSession"
    ADD CONSTRAINT yiisession_pkey PRIMARY KEY (id);


--
-- Name: yiisession_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace:
--

ALTER TABLE ONLY yiisession
    ADD CONSTRAINT yiisession_pkey1 PRIMARY KEY (id);


--
-- Name: identifier_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace:
--

CREATE UNIQUE INDEX identifier_idx ON dataset USING btree (identifier);


--
-- Name: AuthAssignment_itemname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AuthAssignment"
    ADD CONSTRAINT "AuthAssignment_itemname_fkey" FOREIGN KEY (itemname) REFERENCES "AuthItem"(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dataset_author_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_author
    ADD CONSTRAINT dataset_author_author_id_fkey FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE;


--
-- Name: dataset_author_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_author
    ADD CONSTRAINT dataset_author_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id) ON DELETE CASCADE;


--
-- Name: dataset_image_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_image_id_fkey FOREIGN KEY (image_id) REFERENCES image(id) ON DELETE SET NULL;


--
-- Name: dataset_project_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_project
    ADD CONSTRAINT dataset_project_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id) ON DELETE CASCADE;


--
-- Name: dataset_project_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_project
    ADD CONSTRAINT dataset_project_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE;


--
-- Name: dataset_publisher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES publisher(id) ON DELETE SET NULL;


--
-- Name: dataset_sample_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_sample
    ADD CONSTRAINT dataset_sample_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id) ON DELETE CASCADE;


--
-- Name: dataset_sample_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_sample
    ADD CONSTRAINT dataset_sample_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES sample(id) ON DELETE CASCADE;


--
-- Name: dataset_submitter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_submitter_id_fkey FOREIGN KEY (submitter_id) REFERENCES gigadb_user(id) ON DELETE RESTRICT;


--
-- Name: dataset_type_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_type
    ADD CONSTRAINT dataset_type_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id) ON DELETE CASCADE;


--
-- Name: dataset_type_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dataset_type
    ADD CONSTRAINT dataset_type_type_id_fkey FOREIGN KEY (type_id) REFERENCES type(id) ON DELETE CASCADE;


--
-- Name: external_link_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY external_link
    ADD CONSTRAINT external_link_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id) ON DELETE CASCADE;


--
-- Name: external_link_external_link_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY external_link
    ADD CONSTRAINT external_link_external_link_type_id_fkey FOREIGN KEY (external_link_type_id) REFERENCES external_link_type(id) ON DELETE CASCADE;


--
-- Name: file_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file
    ADD CONSTRAINT file_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id) ON DELETE CASCADE;


--
-- Name: file_format_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file
    ADD CONSTRAINT file_format_id_fkey FOREIGN KEY (format_id) REFERENCES file_format(id) ON DELETE CASCADE;


--
-- Name: file_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file
    ADD CONSTRAINT file_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES sample(id) ON DELETE CASCADE;


--
-- Name: file_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY file
    ADD CONSTRAINT file_type_id_fkey FOREIGN KEY (type_id) REFERENCES file_type(id) ON DELETE CASCADE;


--
-- Name: link_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY link
    ADD CONSTRAINT link_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id) ON DELETE CASCADE;


--
-- Name: manuscript_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY manuscript
    ADD CONSTRAINT manuscript_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id) ON DELETE CASCADE;


--
-- Name: relation_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY relation
    ADD CONSTRAINT relation_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id) ON DELETE CASCADE;


--
-- Name: sample_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_species_id_fkey FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;


--
-- Name: search_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY search
    ADD CONSTRAINT search_user_id_fkey FOREIGN KEY (user_id) REFERENCES gigadb_user(id) ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

