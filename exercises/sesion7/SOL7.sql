/* SOLUCI�N A LOS ENUNCIADOS DE LA SESION 7: CONSULTAS AL CATALOGO */

/* 1.  Consultas al CATALOGO */

/* a. Tablas de datos que existen en la base de datos */

select owner, table_name, num_rows
from all_tables
order by 1, 2;

/*    b. Campos de la tabla PRESTAMO */

select column_name, data_type, data_length
from all_tab_columns
where table_name='PRESTAMO'
and owner='UNIV';

/*    c. Tablas que incluyen el campo CODIGO */

select t.owner, t.table_name
from all_tab_columns c, all_tables t
where t.table_name=c.table_name
  and t.owner=c.owner
  and column_name='CODIGO'
order by 1, 2;

/*    d. Tipo del campo ANO_FALL de la tabla AUTOR */

select data_type, data_length
from all_tab_columns
where column_name='ANO_FALL'
  and table_name='AUTOR'
  and owner='UNIV';

/*    e. Nombre de los �ndices creados y de las tablas a las que corresponden */

select index_name, table_name, table_owner
from all_indexes
order by 2,3;


/*    f. Campos en que se basan las claves del apartado e) */

select i.owner, i.table_name, i.index_name, column_name
from all_indexes i, all_ind_columns ic
where i.index_name=ic.index_name
  and i.owner=ic.index_owner
order by 1, 2, 3, 4;



/* 2. Consultar el cat�logo del sistema para obtener la siguiente informaci�n: */

/*    a. Nombre de todas las tablas y vistas creadas por el usuario */

select object_name, object_type, created
from user_objects
where object_type in ('TABLE', 'VIEW');

/*    b. Caracter�sticas principales de estas tablas y vistas */

select t.table_name, column_name, data_type
from user_tables t, user_tab_columns c
where t.table_name=c.table_name
order by 1;


/*    c. Nombre y caracter�sticas de las vistas */

select owner, view_name, text
from all_views
where owner=user
order by 1, 2;

/*    d. Escriba algunos comentarios para las tablas/vistas y campos creados en las sesiones anteriores 
		 sobre tablas/vistas de las que seamos propietarios (OWNER). Verifique que han sido incluidos dichos comentarios. */

COMMENT ON TABLE PRESTAMOSACTIVOS IS 'Vista creada en los enunciados de la sesi�n de Vistas';
select * from all_tab_comments where owner=user; 

COMMENT ON COLUMN PRESTAMOSACTIVOS.COD_LECTOR IS 'Es el Codigo del Lector que ha hecho el prestamo';
select * from all_col_comments where owner=user; 


/*    e. Elimine dichas vistas y verifique que lo ha hecho */

DROP view PRESTAMOSACTIVOS;
/* Repetir con cada nombre de vista que se obtenga con la siguiente consulta 
   hasta que al realizarla no se obtenga ning�n resultado */
select view_name from user_views;


/*    f. Descripci�n de los sin�nimos definidos */

select synonym_name, table_name
from all_synonyms
where owner=user;

/*    g. Elimine dichos sin�nimos y verifique que lo ha hecho */

DROP synonym MIDISPONE;
/* Repetir con cada nombre de sin�nimo que se obtenga con la siguiente consulta 
   hasta que al realizarla no se obtenga ning�n resultado */
select synonym_name from user_synonyms;

/*    h. Elimine las tablas de las que es propietario y verifique que lo ha hecho */

DROP table AUTORESP;
/* Repetir con cada nombre de tabla que se obtenga con la siguiente consulta 
   hasta que al realizarla no se obtenga ning�n resultado */
select table_name from user_tables;

/* 3. Consultar el cat�logo del sistema para obtener la siguiente informaci�n: */

/*    a. Nombre de de los disparadores creados por el usuario */
select trigger_name from user_triggers;

/*    b. Eliminar dichos disparadores */
drop trigger UPD_MIPRES;
/* Repetir con cada nombre de trigger que se obtenga con la siguiente consulta 
   hasta que al realizarla no se obtenga ning�n resultado */
select trigger_name from user_triggers;