CREATE PROCEDURE SP_ALL_DEPARTAMENTOS
AS
	SELECT * FROM DEPT
GO
create procedure SP_EMPLEADOS_DEPARTAMENTOS_OUT
(@nombre NVARCHAR(50), @suma int out, @media int out, @personas int out)
AS
	DECLARE @iddept int
	SELECT @iddept = DEPT_NO from DEPT
	where DNOMBRE = @nombre
	--La consulta del procedimiento
	select * from EMP where DEPT_NO=@iddept
	--Rellenamos las variables de salida
	select @suma = SUM(SALARIO), @media = AVG(SALARIO), @personas = COUNT(EMP_NO)
	from EMP
	where DEPT_NO = @iddept
GO
execute SP_ALL_DEPARTAMENTOS;

declare @suma int;
declare @media int;
declare @personas int;
exec SP_EMPLEADOS_DEPARTAMENTOS_OUT 'CONTABILIDAD',@suma output,@media output,@personas output;