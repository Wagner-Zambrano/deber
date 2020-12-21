
/*1*/
select ciudad , COUNT (ciudad) as citas_ciegas from usuario
group by ciudad having COUNT (ciudad) > 1;
/*2*/
SELECT        dbo.usuario.genero, dbo.usuario.ciudad , COUNT (genero) AS CITAS_CIUDAD
FROM            dbo.citas INNER JOIN
                         dbo.usuario ON dbo.citas.codigo = dbo.usuario.codigo
GROUP BY dbo.usuario.genero, dbo.usuario.ciudad
HAVING  COUNT (genero)>1


/*3*/
SELECT        TOP (100) PERCENT COUNT(descripcion) AS numero, descripcion, motivo
FROM            dbo.estado
WHERE        (descripcion = 'fallida')
GROUP BY motivo, descripcion
HAVING        (COUNT(descripcion) > '1')


/*4*/
select descripcion , COUNT (descripcion) as citas_ciegas from estado
group by descripcion having COUNT (descripcion) > 1;