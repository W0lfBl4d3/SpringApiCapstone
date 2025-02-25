PGDMP         "                {           spring_api_capstone    15.2    15.2 <    E           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            F           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            G           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            H           1262    16558    spring_api_capstone    DATABASE     �   CREATE DATABASE spring_api_capstone WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
 #   DROP DATABASE spring_api_capstone;
                postgres    false            �            1259    16724    bundle    TABLE     �   CREATE TABLE public.bundle (
    id bigint NOT NULL,
    discount double precision,
    name character varying(255) NOT NULL
);
    DROP TABLE public.bundle;
       public         heap    postgres    false            �            1259    16730    bundle_dish    TABLE     `   CREATE TABLE public.bundle_dish (
    bundle_id bigint NOT NULL,
    dish_id bigint NOT NULL
);
    DROP TABLE public.bundle_dish;
       public         heap    postgres    false            �            1259    16723    bundle_id_seq    SEQUENCE     v   CREATE SEQUENCE public.bundle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.bundle_id_seq;
       public          postgres    false    226            I           0    0    bundle_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.bundle_id_seq OWNED BY public.bundle.id;
          public          postgres    false    225            �            1259    16674    dish    TABLE     �   CREATE TABLE public.dish (
    id bigint NOT NULL,
    description character varying(255),
    image character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    price double precision,
    manufacturer_id bigint
);
    DROP TABLE public.dish;
       public         heap    postgres    false            �            1259    16673    dish_id_seq    SEQUENCE     t   CREATE SEQUENCE public.dish_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.dish_id_seq;
       public          postgres    false    219            J           0    0    dish_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.dish_id_seq OWNED BY public.dish.id;
          public          postgres    false    218            �            1259    16660    manufacturer    TABLE     �   CREATE TABLE public.manufacturer (
    id bigint NOT NULL,
    description character varying(255),
    image character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);
     DROP TABLE public.manufacturer;
       public         heap    postgres    false            �            1259    16659    manufacturer_id_seq    SEQUENCE     |   CREATE SEQUENCE public.manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.manufacturer_id_seq;
       public          postgres    false    217            K           0    0    manufacturer_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.manufacturer_id_seq OWNED BY public.manufacturer.id;
          public          postgres    false    216            �            1259    16688    reservation    TABLE     �   CREATE TABLE public.reservation (
    id bigint NOT NULL,
    reservation_timestamp timestamp(6) without time zone NOT NULL,
    seats integer NOT NULL,
    user_id bigint NOT NULL
);
    DROP TABLE public.reservation;
       public         heap    postgres    false            �            1259    16687    reservation_id_seq    SEQUENCE     {   CREATE SEQUENCE public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.reservation_id_seq;
       public          postgres    false    221            L           0    0    reservation_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.reservation_id_seq OWNED BY public.reservation.id;
          public          postgres    false    220            �            1259    16700    roles    TABLE     =  CREATE TABLE public.roles (
    id bigint NOT NULL,
    role_name character varying(255),
    discount double precision,
    CONSTRAINT roles_role_name_check CHECK (((role_name)::text = ANY ((ARRAY['ROLE_USER'::character varying, 'ROLE_USER_GOLDEN'::character varying, 'ROLE_ADMIN'::character varying])::text[])))
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16699    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    223            M           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    222            �            1259    16632    users    TABLE     �   CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16631    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215            N           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            �            1259    16707    users_roles    TABLE     ^   CREATE TABLE public.users_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.users_roles;
       public         heap    postgres    false            �           2604    16727 	   bundle id    DEFAULT     f   ALTER TABLE ONLY public.bundle ALTER COLUMN id SET DEFAULT nextval('public.bundle_id_seq'::regclass);
 8   ALTER TABLE public.bundle ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    16677    dish id    DEFAULT     b   ALTER TABLE ONLY public.dish ALTER COLUMN id SET DEFAULT nextval('public.dish_id_seq'::regclass);
 6   ALTER TABLE public.dish ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    16663    manufacturer id    DEFAULT     r   ALTER TABLE ONLY public.manufacturer ALTER COLUMN id SET DEFAULT nextval('public.manufacturer_id_seq'::regclass);
 >   ALTER TABLE public.manufacturer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    16691    reservation id    DEFAULT     p   ALTER TABLE ONLY public.reservation ALTER COLUMN id SET DEFAULT nextval('public.reservation_id_seq'::regclass);
 =   ALTER TABLE public.reservation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16703    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    16635    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            A          0    16724    bundle 
   TABLE DATA           4   COPY public.bundle (id, discount, name) FROM stdin;
    public          postgres    false    226   C       B          0    16730    bundle_dish 
   TABLE DATA           9   COPY public.bundle_dish (bundle_id, dish_id) FROM stdin;
    public          postgres    false    227   `C       :          0    16674    dish 
   TABLE DATA           T   COPY public.dish (id, description, image, name, price, manufacturer_id) FROM stdin;
    public          postgres    false    219   �C       8          0    16660    manufacturer 
   TABLE DATA           D   COPY public.manufacturer (id, description, image, name) FROM stdin;
    public          postgres    false    217   �M       <          0    16688    reservation 
   TABLE DATA           P   COPY public.reservation (id, reservation_timestamp, seats, user_id) FROM stdin;
    public          postgres    false    221   �O       >          0    16700    roles 
   TABLE DATA           8   COPY public.roles (id, role_name, discount) FROM stdin;
    public          postgres    false    223   �O       6          0    16632    users 
   TABLE DATA           K   COPY public.users (id, email, first_name, last_name, password) FROM stdin;
    public          postgres    false    215   P       ?          0    16707    users_roles 
   TABLE DATA           7   COPY public.users_roles (user_id, role_id) FROM stdin;
    public          postgres    false    224   HQ       O           0    0    bundle_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.bundle_id_seq', 6, true);
          public          postgres    false    225            P           0    0    dish_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.dish_id_seq', 29, true);
          public          postgres    false    218            Q           0    0    manufacturer_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.manufacturer_id_seq', 5, true);
          public          postgres    false    216            R           0    0    reservation_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.reservation_id_seq', 1, true);
          public          postgres    false    220            S           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
          public          postgres    false    222            T           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 7, true);
          public          postgres    false    214            �           2606    16734    bundle_dish bundle_dish_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.bundle_dish
    ADD CONSTRAINT bundle_dish_pkey PRIMARY KEY (bundle_id, dish_id);
 F   ALTER TABLE ONLY public.bundle_dish DROP CONSTRAINT bundle_dish_pkey;
       public            postgres    false    227    227            �           2606    16729    bundle bundle_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.bundle
    ADD CONSTRAINT bundle_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.bundle DROP CONSTRAINT bundle_pkey;
       public            postgres    false    226            �           2606    16681    dish dish_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_pkey;
       public            postgres    false    219            �           2606    16667    manufacturer manufacturer_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.manufacturer
    ADD CONSTRAINT manufacturer_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.manufacturer DROP CONSTRAINT manufacturer_pkey;
       public            postgres    false    217            �           2606    16693    reservation reservation_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    221            �           2606    16706    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    223            �           2606    16658 !   users uk6dotkott2kjsp8vw4d0m25fb7 
   CONSTRAINT     ]   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7;
       public            postgres    false    215            �           2606    16646 "   users uk_6dotkott2kjsp8vw4d0m25fb7 
   CONSTRAINT     ^   ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);
 L   ALTER TABLE ONLY public.users DROP CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7;
       public            postgres    false    215            �           2606    16639    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    16711    users_roles users_roles_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);
 F   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT users_roles_pkey;
       public            postgres    false    224    224            �           2606    16717 '   users_roles fk2o0jvgh89lemvvo17cbqvdxaa    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa;
       public          postgres    false    3218    215    224            �           2606    16682     dish fk811bobnhmhp7jugam1e344ubq    FK CONSTRAINT     �   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT fk811bobnhmhp7jugam1e344ubq FOREIGN KEY (manufacturer_id) REFERENCES public.manufacturer(id);
 J   ALTER TABLE ONLY public.dish DROP CONSTRAINT fk811bobnhmhp7jugam1e344ubq;
       public          postgres    false    217    219    3220            �           2606    16740 '   bundle_dish fkejqnwx9iv5fgku7p8c7cf4f8f    FK CONSTRAINT     �   ALTER TABLE ONLY public.bundle_dish
    ADD CONSTRAINT fkejqnwx9iv5fgku7p8c7cf4f8f FOREIGN KEY (bundle_id) REFERENCES public.bundle(id);
 Q   ALTER TABLE ONLY public.bundle_dish DROP CONSTRAINT fkejqnwx9iv5fgku7p8c7cf4f8f;
       public          postgres    false    226    3230    227            �           2606    16712 '   users_roles fkj6m8fwv7oqv74fcehir1a9ffy    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy FOREIGN KEY (role_id) REFERENCES public.roles(id);
 Q   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy;
       public          postgres    false    223    224    3226            �           2606    16735 '   bundle_dish fkndk08gi402h4neraa8oskh9ev    FK CONSTRAINT     �   ALTER TABLE ONLY public.bundle_dish
    ADD CONSTRAINT fkndk08gi402h4neraa8oskh9ev FOREIGN KEY (dish_id) REFERENCES public.dish(id);
 Q   ALTER TABLE ONLY public.bundle_dish DROP CONSTRAINT fkndk08gi402h4neraa8oskh9ev;
       public          postgres    false    3222    219    227            �           2606    16694 '   reservation fkrea93581tgkq61mdl13hehami    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fkrea93581tgkq61mdl13hehami FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.reservation DROP CONSTRAINT fkrea93581tgkq61mdl13hehami;
       public          postgres    false    221    3218    215            A   @   x�3�4г���,�PPSO-.��Sp*�K�IU�2K:����$BE����A��E0�=... 5�      B   3   x���  �w3R�����X� QA��Q��i<�$&�f���q�$��      :   
  x��X�r��>CO1�X�e&�+&'J��]�^��n*N������g��c*��{Ω<D�&~�|=P�*���(b�����_ws0�s��a?fW���4l8��qc�f6��Ձ)���'��V��QJ�X�w���Nh��L5�X^��ʘI^Ʉ����K��Y%R�S��ۦza��P�R&��JYX�1Y%E�¾�Ŋ*���g�IV�%֥=��z��	UY�
�,
n��eS�[
��Z��a��������OBO&�`p6k˵uW[����9���3v� �����Kcl)*�������*yp��r˶��U"����0l�u����yk�o�Y!�e��=�?+��E�Q�e�C��4֣�
��"O���K]H�3L�%���(������D��)��3a=2�}��^�����������>L�3Bi��ĺ<�
�!�5��l�E�b2_s+X-�Q�B7XkA��;X�� �� �iE ;j��E4��Y�����v��`����(m7H��:��}�����^_}X݇˻`8��f�`x6�rXr�"�ŋv�i R<`�����Ik�ʅ�߄e�}�Ȧ_ǡV\�hJ�rnض���Nm��""
�T!�@�C+Ӳ� �#Ҳ��ldA𴅈&�B�J4ۂ&,���E����i���ES�`5�&�E4��8v��K
�+�I�*E ���!^ZUw-��bZ�;�;.��}4>�'���,�� /�v�4� -io�BAz���QiF	?)�-�Ƣ��y�w^t�P5;�Ц@��mF�f��t	j���-�wL����|��^�h6�<����?��]�X�rѺcu�L���UY!Z��ʥP�D�:$����[h�s閜���4bϗ�P�"!� -ORO7��z�ۏ���^ >Aɂ�y�p�$y�i��0�3ACȄ+������Bo����<9���˦���܉s�h<"���K��ZΖ�y�U�H�A��'��c�]��$��i�uqՍ�o�� �:�Z(����D8�F�
���$�{���YA'jE"�+��H��'+��,{�FK��γ���7���>A"��� ��x��>��o:` �P0hX�I��Y�L-D����'d��hK��UGQ�5TTd��G�}�ADE|r4� �j�e��I�I����Q���  :"�.h�:S�B�F��d�)i�Ƌ���lLA���E�V��)�VԅGU�Z��|�<�t@�R�:�?���x�(�� 4�P�Ǜ0w���#NR&q�R��0�
	`|�q��ҵJ���j<�8&�W!>bX�Ť�`)Rٔ!�t�h�&��!	�#ב���B�=˳b;��Q�Vr�k�;l5@Y��إ���L`�J�dQ�(�&�>�(Y�}.q���'�R�q���v�7�gƠ��ȧbsTӍ&'\�޽��{A<�pQO�9�Ӑ�c�o4/�>d����q����������]!�� �T~^ Ui r|�A�ۊ�8OB��[dH��IT��_����d��c�3��לf��u�C�����4q?���t��B�P�*��ӣ�ԃZ�M�.y�l.>|O��4q:���A����{�Ծ�)��	Y	���! @W���-o~�M�Z
�vL� @���1����m���z�J�k�.��x@s��!s�n��5�
줛��%�Z�Nsj���h�EZ���9� ����/�<{�������kGG��{?��9����Sz�c��lx�	�N<�r��ܙ'�
��C��8�)���;�1�s2v+H��-��L@�= ��G�U�ހ	Bu�/�釳A?���!��e�t[G�D8~Jnj��L�vgǍ2]w�V�����mzLA������W@����hh��4A[bK��o+�^����{��`N=a�6�(hME5�������
��QŨݽ�u�T�0�tC���ƣcB���Qe�ZI��h+���S���5	�j�D����Ѣ`�>)�����f)��]�������ŀ��p4�Am�:U!�=��+��(^�Xxڵ������](��y���2Y���y������5�%�1���#���J�*���N��M�<���;�����J0Ͷ�INc1}���K��%�{���ϯ���x!^Ľn���L�)M��k�������k�PvR�|h��4Cb��d�ۯ�aYR���	���~ u�X �`[�V=�[v� �'L���e���u�6����.tW<�	_#�ۂ�� �E�h���qYyh��f���#q$�M��i��L�T����Wp]��Ĥ���@���'��	2��El�?rcy���uXK�D�m@,D�	$/�aSb�*@=+k/�G��A�#2^a&C+[4=���V�V�+���yM��J%�|��:�.n��B�,�cLƠ� �q�5c�����ߌQ�,'���h4f�;�f~�&�V�;G޷TT���7q����: k��BC�놆BNcT����:�����^���RC�	\ό��1�ҍ/r�A����Zx�^m>��"�������qo�z��p4`�h�q�):;;�ۂ
      8   �  x���Ak�@�����i�chKJ!��-%94���K!h���P����6fw��@�͞yz��F�/�ߋw�z#�ý'�[RE�	�*�tԷp��{d8x!��  �t:��#���@��O<C���z�Y�S��&�X���Z�����[�C�=�������s�
z�����V��B�KEY`e��Z�s�:M�⒨�*4T�0I`��ܲ�-����83�Ў�1�Y^��0leh��s$���Q�!������Ի�~f����h'������O1���|.���0��z^�W\b�a��m;��{���{��Z�F���X��>�$凢	��
)%��Lo������5Ra�sD1j��Cfp�*�M��ΞVռ��WS5j�d+�j�m#lAZ���(��"ʩ>#�+l�����Y��y�)��o�O��c��t��.RV>���|Ҟ��]^~�˲�:�      <      x������ � �      >   6   x�3���q�wt����4�2�pC�]�8�,���xwW?���)W� �W�      6   ,  x�U��r�0 @�u��A����(���ML�R^���g�۳�Wy�(�I-�{rC�W�@���3�z��'�6�T]U��m�R_��SƖƝ�I��meD-��`��jXHc��2|��_=D}���PV�Cw��*=��FO����z�#π�
��u�-�]��}�x��$�9��̞潿��4�7.�J2�_�"�f�_
2�a�t��h��j	�M-�r. �r��u�4��b�d���Z@�,�2�xyr���T7���Ϊ��Fnt�6oU����Z�X5,�-}BI�~ ]�]      ?      x�3�4�2bNc m�ed�q� 5��     