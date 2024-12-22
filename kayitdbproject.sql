--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6
-- Dumped by pg_dump version 16.6

-- Started on 2024-12-22 22:20:26

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
-- TOC entry 4953 (class 1262 OID 16398)
-- Name: vytsodev; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE vytsodev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE vytsodev OWNER TO postgres;

\connect vytsodev

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
-- TOC entry 215 (class 1259 OID 16399)
-- Name: personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personel (
    personelid integer NOT NULL,
    "personelAd" character varying(40) NOT NULL,
    "personelSoyad" character varying(40) NOT NULL,
    "bulunduguSehirid" integer NOT NULL,
    "telNo" numeric NOT NULL,
    "sabitUcret" integer NOT NULL,
    "ePosta" character varying(40),
    adres character varying(70),
    "baslamaTarihi" date
);


ALTER TABLE public.personel OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16434)
-- Name: doktor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doktor (
    "uzmanlikAlani" character varying(40) NOT NULL,
    "gunlukKota" integer NOT NULL,
    "mesaiSaatleri" date NOT NULL
)
INHERITS (public.personel);


ALTER TABLE public.doktor OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16478)
-- Name: hasta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasta (
    hastaid integer NOT NULL,
    "hastaAd" character varying(40) NOT NULL,
    "hastaSoyad" character varying(40) NOT NULL,
    "telNo" numeric NOT NULL,
    yas integer NOT NULL,
    eposta character varying(30),
    adres character varying(100)
);


ALTER TABLE public.hasta OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16492)
-- Name: hastahastalik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hastahastalik (
    hastahastlikid integer NOT NULL,
    "bulunanHastaid" integer NOT NULL,
    "bulunanHastalikid" integer NOT NULL,
    "hastalikSüresi" integer
);


ALTER TABLE public.hastahastalik OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16485)
-- Name: hastalik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hastalik (
    hastalikid integer NOT NULL,
    "hastalikAd" character varying NOT NULL
);


ALTER TABLE public.hastalik OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16427)
-- Name: hemsire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hemsire (
    "bulunduguPolikinlik" character varying(50) NOT NULL,
    "nobetGunleri" character varying(40) NOT NULL
)
INHERITS (public.personel);


ALTER TABLE public.hemsire OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16446)
-- Name: ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilce (
    ilceid integer NOT NULL,
    "ilceAd" character varying(40) NOT NULL,
    "bulunduguSehir" integer NOT NULL
);


ALTER TABLE public.ilce OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16413)
-- Name: kadrolueleman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kadrolueleman (
    "tecrubeYili" integer
)
INHERITS (public.personel);


ALTER TABLE public.kadrolueleman OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16463)
-- Name: memnuniyetdurum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.memnuniyetdurum (
    memnuniyetid integer NOT NULL,
    "memnuniyetAd" character varying(40) NOT NULL
);


ALTER TABLE public.memnuniyetdurum OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16468)
-- Name: polikinlik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.polikinlik (
    polikinlikid integer NOT NULL,
    "polikinlikAd" character varying(50) NOT NULL
);


ALTER TABLE public.polikinlik OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16509)
-- Name: randevu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.randevu (
    randevuid integer NOT NULL,
    doktorid integer NOT NULL,
    memnuniyetdurumid integer NOT NULL,
    hastaid integer NOT NULL,
    durumid integer NOT NULL,
    polikinlikid integer NOT NULL,
    randevutarihi character varying,
    odenentutar integer,
    odemesekli character varying(30)
);


ALTER TABLE public.randevu OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16473)
-- Name: randevudurum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.randevudurum (
    "ranedevuDurumid" integer NOT NULL,
    "durumAd" character varying(40) NOT NULL
);


ALTER TABLE public.randevudurum OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16441)
-- Name: sehir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sehir (
    sehirid integer NOT NULL,
    "sehirAd" character varying(20) NOT NULL
);


ALTER TABLE public.sehir OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16406)
-- Name: sozlesmelieleman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sozlesmelieleman (
    "sozlesmeSuresi" integer NOT NULL,
    "mesaiUcreti" integer
)
INHERITS (public.personel);


ALTER TABLE public.sozlesmelieleman OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16420)
-- Name: yonetici; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yonetici (
    pozisyon character varying(50) NOT NULL
)
INHERITS (public.personel);


ALTER TABLE public.yonetici OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 16434)
-- Dependencies: 220
-- Data for Name: doktor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doktor (personelid, "personelAd", "personelSoyad", "bulunduguSehirid", "telNo", "sabitUcret", "ePosta", adres, "baslamaTarihi", "uzmanlikAlani", "gunlukKota", "mesaiSaatleri") FROM stdin;
3	Efe	Efe	3	533333333	45000	efe@gmail.com	Adres3	2017-12-10	Kardiyoloji	45	2017-12-10
2	Can	Boz	1	522222222	55000	can@gmail.com	Adres2	2017-12-10	Kulak Burun Boğaz	30	2017-12-10
1	Ali	Yılmaz	6	5111111111	50000	ali@gmail.com	Adres1	2024-12-10	Genel Cerrahi	40	2017-12-10
\.


--
-- TOC entry 4944 (class 0 OID 16478)
-- Dependencies: 226
-- Data for Name: hasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hasta (hastaid, "hastaAd", "hastaSoyad", "telNo", yas, eposta, adres) FROM stdin;
6	Selcan	Condek	5666666666	25	selcan@gmail.com	adres13
5	İhsan	Pasa	5555555555	24	ihsan@gmail.com	adres0
4	Melike	Subasi	5444444444	23	melike@gmail.com	adress
3	Ahmet	Kaya	5333333333	22	ahmet@gmail.com	adres2
2	Yasemin	ince	5222222222	21	yasemin@gmail.com	adres1
1	Veli	Aksa	5111111111	20	veli@gmail.com	adresss
\.


--
-- TOC entry 4946 (class 0 OID 16492)
-- Dependencies: 228
-- Data for Name: hastahastalik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hastahastalik (hastahastlikid, "bulunanHastaid", "bulunanHastalikid", "hastalikSüresi") FROM stdin;
4	3	5	5
3	1	5	4
2	2	4	2
1	2	6	3
\.


--
-- TOC entry 4945 (class 0 OID 16485)
-- Dependencies: 227
-- Data for Name: hastalik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hastalik (hastalikid, "hastalikAd") FROM stdin;
8	Tiroid Hastalıkları
7	Depresyon
6	Romatoid Artrit\n
5	Anemi (Kansızlık)\n
4	Astım
3	Migren\n
2	Hipertansiyon (Yüksek Tansiyon)\n
1	Diyabet (Şeker Hastalığı)\n
\.


--
-- TOC entry 4937 (class 0 OID 16427)
-- Dependencies: 219
-- Data for Name: hemsire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hemsire (personelid, "personelAd", "personelSoyad", "bulunduguSehirid", "telNo", "sabitUcret", "ePosta", adres, "baslamaTarihi", "bulunduguPolikinlik", "nobetGunleri") FROM stdin;
11	Sefa	Akyol	7	5999999999	25000	sefa@gmail.com	adres9	2023-01-20	Dahiliye	Perşembe Cuma
10	Musa	Alev	6	5888888888	20000	musa@gmail.com	adres8	2023-01-20	Dahiliye	Pazartesi Sali
\.


--
-- TOC entry 4940 (class 0 OID 16446)
-- Dependencies: 222
-- Data for Name: ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ilce (ilceid, "ilceAd", "bulunduguSehir") FROM stdin;
3	Etimesgut	6
2	Kızılay	6
1	Sincan	6
6	Nizip	11
5	Şehitkamil	11
4	Şahinbey	11
\.


--
-- TOC entry 4935 (class 0 OID 16413)
-- Dependencies: 217
-- Data for Name: kadrolueleman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kadrolueleman (personelid, "personelAd", "personelSoyad", "bulunduguSehirid", "telNo", "sabitUcret", "ePosta", adres, "baslamaTarihi", "tecrubeYili") FROM stdin;
7	Ayse	coban	2	5777777777	35000	ayse@gmail.com	adres5	2023-01-20	2
6	Melek	Apari	1	5666666666	32000	melek@gmail.com	adres4	2023-01-20	2
\.


--
-- TOC entry 4941 (class 0 OID 16463)
-- Dependencies: 223
-- Data for Name: memnuniyetdurum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.memnuniyetdurum (memnuniyetid, "memnuniyetAd") FROM stdin;
5	Cok İyi
4	İyi
3	Orta
2	Kötü
1	Berbat
\.


--
-- TOC entry 4933 (class 0 OID 16399)
-- Dependencies: 215
-- Data for Name: personel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personel (personelid, "personelAd", "personelSoyad", "bulunduguSehirid", "telNo", "sabitUcret", "ePosta", adres, "baslamaTarihi") FROM stdin;
\.


--
-- TOC entry 4942 (class 0 OID 16468)
-- Dependencies: 224
-- Data for Name: polikinlik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.polikinlik (polikinlikid, "polikinlikAd") FROM stdin;
7	Kulak Burun Boğaz (KBB)\n
6	Göz Hastalıkları\n
5	Kadın Hastalıkları ve Doğum
4	Ortopedi ve Travmatoloji
3	Kardiyoloji\n
2	Dahiliye (İç Hastalıkları)\n
1	Dermatoloji (Cildiye)
\.


--
-- TOC entry 4947 (class 0 OID 16509)
-- Dependencies: 229
-- Data for Name: randevu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.randevu (randevuid, doktorid, memnuniyetdurumid, hastaid, durumid, polikinlikid, randevutarihi, odenentutar, odemesekli) FROM stdin;
2	2	3	3	3	5	15.07.2016	2000	Kart
1	2	4	5	1	2	15.07.2016	1000	Kart
3	3	1	2	2	6	8.12.2024	2500	Nakit
4	3	5	6	3	7	8.12.2024	5000	Kart
\.


--
-- TOC entry 4943 (class 0 OID 16473)
-- Dependencies: 225
-- Data for Name: randevudurum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.randevudurum ("ranedevuDurumid", "durumAd") FROM stdin;
3	İptal Edildi
2	Gerçekleşti
1	Beklemede
\.


--
-- TOC entry 4939 (class 0 OID 16441)
-- Dependencies: 221
-- Data for Name: sehir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sehir (sehirid, "sehirAd") FROM stdin;
10	Balıkesir
9	Aydın
8	Artvin
7	Antalya
6	Ankara
5	Amasya
4	Ağrı
3	Afyon
2	Adıyaman
1	Adana
11	Gaziantep
\.


--
-- TOC entry 4934 (class 0 OID 16406)
-- Dependencies: 216
-- Data for Name: sozlesmelieleman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sozlesmelieleman (personelid, "personelAd", "personelSoyad", "bulunduguSehirid", "telNo", "sabitUcret", "ePosta", adres, "sozlesmeSuresi", "mesaiUcreti", "baslamaTarihi") FROM stdin;
5	Mert	Demir	2	5555555555	30000	mert@gmail.com	adres3	2	100	2023-01-20
4	Ayla	Gunes	2	5444444444	30000	ayla@gmail.com	adres2	2	100	2023-01-20
\.


--
-- TOC entry 4936 (class 0 OID 16420)
-- Dependencies: 218
-- Data for Name: yonetici; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.yonetici (personelid, "personelAd", "personelSoyad", "bulunduguSehirid", "telNo", "sabitUcret", "ePosta", adres, "baslamaTarihi", pozisyon) FROM stdin;
9	Yasin	Cakir	11	5300348227	90000	yasin@gmail.com	adres7	2024-01-20	Müdür Yardımcısı
8	Asuman	Odabasi	11	5071942503	1000000	asuman@gmail.com	adres6	2024-01-20	Müdür
\.


--
-- TOC entry 4755 (class 2606 OID 16440)
-- Name: doktor doktor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doktor
    ADD CONSTRAINT doktor_pkey PRIMARY KEY (personelid);


--
-- TOC entry 4768 (class 2606 OID 16484)
-- Name: hasta hasta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT hasta_pkey PRIMARY KEY (hastaid);


--
-- TOC entry 4774 (class 2606 OID 16496)
-- Name: hastahastalik hastahastalik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hastahastalik
    ADD CONSTRAINT hastahastalik_pkey PRIMARY KEY (hastahastlikid);


--
-- TOC entry 4770 (class 2606 OID 16491)
-- Name: hastalik hastalik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hastalik
    ADD CONSTRAINT hastalik_pkey PRIMARY KEY (hastalikid);


--
-- TOC entry 4753 (class 2606 OID 16433)
-- Name: hemsire hemsire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hemsire
    ADD CONSTRAINT hemsire_pkey PRIMARY KEY (personelid);


--
-- TOC entry 4760 (class 2606 OID 16450)
-- Name: ilce ilce_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT ilce_pkey PRIMARY KEY (ilceid);


--
-- TOC entry 4749 (class 2606 OID 16419)
-- Name: kadrolueleman kadrolueleman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kadrolueleman
    ADD CONSTRAINT kadrolueleman_pkey PRIMARY KEY (personelid);


--
-- TOC entry 4762 (class 2606 OID 16467)
-- Name: memnuniyetdurum memnuniyetdurum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.memnuniyetdurum
    ADD CONSTRAINT memnuniyetdurum_pkey PRIMARY KEY (memnuniyetid);


--
-- TOC entry 4745 (class 2606 OID 16405)
-- Name: personel personel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT personel_pkey PRIMARY KEY (personelid);


--
-- TOC entry 4764 (class 2606 OID 16472)
-- Name: polikinlik polikinlik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.polikinlik
    ADD CONSTRAINT polikinlik_pkey PRIMARY KEY (polikinlikid);


--
-- TOC entry 4780 (class 2606 OID 16513)
-- Name: randevu randevu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT randevu_pkey PRIMARY KEY (randevuid);


--
-- TOC entry 4766 (class 2606 OID 16477)
-- Name: randevudurum randevudurum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevudurum
    ADD CONSTRAINT randevudurum_pkey PRIMARY KEY ("ranedevuDurumid");


--
-- TOC entry 4757 (class 2606 OID 16445)
-- Name: sehir sehir_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sehir
    ADD CONSTRAINT sehir_pkey PRIMARY KEY (sehirid);


--
-- TOC entry 4747 (class 2606 OID 16412)
-- Name: sozlesmelieleman sozlesmelieleman_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sozlesmelieleman
    ADD CONSTRAINT sozlesmelieleman_pkey PRIMARY KEY (personelid);


--
-- TOC entry 4751 (class 2606 OID 16426)
-- Name: yonetici yonetici_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yonetici
    ADD CONSTRAINT yonetici_pkey PRIMARY KEY (personelid);


--
-- TOC entry 4775 (class 1259 OID 16519)
-- Name: fki_doktor_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_doktor_foreign ON public.randevu USING btree (doktorid);


--
-- TOC entry 4776 (class 1259 OID 16536)
-- Name: fki_durum_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_durum_foreign ON public.randevu USING btree (durumid);


--
-- TOC entry 4771 (class 1259 OID 16502)
-- Name: fki_hasta_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_hasta_foreign ON public.hastahastalik USING btree ("bulunanHastaid");


--
-- TOC entry 4772 (class 1259 OID 16508)
-- Name: fki_hastalik_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_hastalik_foreign ON public.hastahastalik USING btree ("bulunanHastalikid");


--
-- TOC entry 4777 (class 1259 OID 16525)
-- Name: fki_memnuniyet_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_memnuniyet_foreign ON public.randevu USING btree (memnuniyetdurumid);


--
-- TOC entry 4778 (class 1259 OID 16542)
-- Name: fki_polikinlik_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_polikinlik_foreign ON public.randevu USING btree (polikinlikid);


--
-- TOC entry 4758 (class 1259 OID 16548)
-- Name: fki_s; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_s ON public.ilce USING btree ("bulunduguSehir");


--
-- TOC entry 4743 (class 1259 OID 16462)
-- Name: fki_sehir_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_sehir_foreign ON public.personel USING btree ("bulunduguSehirid");


--
-- TOC entry 4782 (class 2606 OID 16543)
-- Name: ilce bulundugusehir_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilce
    ADD CONSTRAINT bulundugusehir_foreign FOREIGN KEY ("bulunduguSehir") REFERENCES public.sehir(sehirid) NOT VALID;


--
-- TOC entry 4785 (class 2606 OID 16514)
-- Name: randevu doktor_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT doktor_foreign FOREIGN KEY (doktorid) REFERENCES public.doktor(personelid) NOT VALID;


--
-- TOC entry 4786 (class 2606 OID 16531)
-- Name: randevu durum_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT durum_foreign FOREIGN KEY (durumid) REFERENCES public.randevudurum("ranedevuDurumid") NOT VALID;


--
-- TOC entry 4783 (class 2606 OID 16497)
-- Name: hastahastalik hasta_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hastahastalik
    ADD CONSTRAINT hasta_foreign FOREIGN KEY ("bulunanHastaid") REFERENCES public.hasta(hastaid) NOT VALID;


--
-- TOC entry 4787 (class 2606 OID 16526)
-- Name: randevu hasta_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT hasta_foreign FOREIGN KEY (hastaid) REFERENCES public.hasta(hastaid) NOT VALID;


--
-- TOC entry 4784 (class 2606 OID 16503)
-- Name: hastahastalik hastalik_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hastahastalik
    ADD CONSTRAINT hastalik_foreign FOREIGN KEY ("bulunanHastalikid") REFERENCES public.hastalik(hastalikid) NOT VALID;


--
-- TOC entry 4788 (class 2606 OID 16520)
-- Name: randevu memnuniyet_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT memnuniyet_foreign FOREIGN KEY (memnuniyetdurumid) REFERENCES public.memnuniyetdurum(memnuniyetid) NOT VALID;


--
-- TOC entry 4789 (class 2606 OID 16537)
-- Name: randevu polikinlik_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu
    ADD CONSTRAINT polikinlik_foreign FOREIGN KEY (polikinlikid) REFERENCES public.polikinlik(polikinlikid) NOT VALID;


--
-- TOC entry 4781 (class 2606 OID 16457)
-- Name: personel sehir_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT sehir_foreign FOREIGN KEY ("bulunduguSehirid") REFERENCES public.sehir(sehirid) NOT VALID;


-- Completed on 2024-12-22 22:20:26

--
-- PostgreSQL database dump complete
--

