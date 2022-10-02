create database campeonatoPaulista

USE campeonatoPaulista

CREATE TABLE times 
(
	codigoTime INT NOT NULL,
	NomeTime VARCHAR(50) NOT NULL,
	Cidade VARCHAR(100) NOT NULL,
	Estadio VARCHAR(70) NOT NULL,
	ordenado INT DEFAULT(1) CHECK(ordenado=1 OR ordenado=0) NOT NULL
	PRIMARY KEY(codigoTime)
)

CREATE tABLE grupos
(
	grupo CHAR(1) CHECK(grupo='A' OR grupo='B'OR grupo='C' OR grupo='D') NOT NULL,
	codigoTime INT NOT NULL
	CONSTRAINT FK_codigoTime FOREIGN KEY (codigoTime) REFERENCES times(codigoTime)
)

create TABLE jogos
(
	id INT  IDENTITY,
	timeA INT,
	timeb INT,
	Rodada INT,
	dataRod DATE,
	golsTimeA INT,
	golsTimeB INT
	PRIMARY KEY(id)
)

select * from grupos
select * from times

INSERT INTO times VALUES
(1,'Santos','Santos', 'Vila Belmiro',1),
(2,'Palmeiras','São Paulo','Allianz Parque',1),
(3,'Corinthians','São Paulo','Neo Química Arena',1),
(4,'São Paulo','São Paulo','Morumbi',1),
(5,'Ponte Preta','Campinas','Moisés Lucarelli',1),
(6,'Guarani','Campinas','Brinco de Ouro',1),
(7,'São Bento','Sorocaba','Walter Ribeiro',1),
(8,'Novorizontino','Novo Horizonte','Jorge Ismael de Biasi',1),
(9,'Ponte Preta','Campinas', 'Moisés Lucarelli',1),
(10,'Mirassol','Mirassol','José Maria de Campos Maia',1),
(11,'Ferroviária','Araraquara','Fonte Luminosa',1),
(12,'Red Bull Bragantino','Bragança Paulista','Nabi Abi Chedid',1),
(13,'São Caetano','São Caetano do Sul','Anacleto Campanella',1),
(14,'Botafogo-SP','Ribeirão Preto','Santa Cruz',1),
(15,'Ituano','Itu','Novelli Júnior',1),
(16,'Inter de Limeira','Limeira','Limeirão',1)

CREATE PROCEDURE SP_Grupo(@num SMALLINT, @retorno CHAR(1) OUTPUT)
AS

	IF (@num = 1) 
	BEGIN
		SET @retorno = 'A'
	END 

	IF (@num = 2) 
	BEGIN
		SET @retorno = 'B'
	END 

	IF (@num = 3) 
	BEGIN
		SET @retorno = 'C'
	END 

	IF (@num = 4) 
	BEGIN
		SET @retorno = 'D'
	END 


CREATE PROCEDURE SP_DivideTime_INS
AS
	UPDATE times SET ordenado = 1 

	DECLARE @cont INT
	SET @cont = 1
	DECLARE @saida CHAR(1)
	DECLARE @cod INT

	/* ----- ADICIONAR OS 4 PRIMEIROS TIMES ------ */
	WHILE @cont < 5
	BEGIN

		SET @cod = (SELECT codigoTime from times WHERE codigoTime = @cont)
		EXEC SP_Grupo @cont, @saida OUTPUT

		INSERT INTO grupos VALUES (@saida, @cod)
		UPDATE times SET ordenado = 0 WHERE codigoTime = @cod

		set @cont = @cont + 1
	END

	PRINT '4 primeiros inseridos com sucesso'

	SET @cont = 1

	/* ----- ADICIONAR OS OUTROS 12 TIMES ------ */
	DECLARE @grupo INT

	WHILE @cont < 13
	BEGIN

		DECLARE @aleatorioTime INT
		DECLARE @aleatorioGrupo INT

		SET @aleatorioTime = (ABS(CHECKSUM(NewId())) % 12 ) + 5
		SET @aleatorioGrupo = (ABS(CHECKSUM(NewId())) % 4 ) + 1

		SET @cod = (SELECT codigoTime from times WHERE codigoTime = @aleatorioTime AND ordenado = 1)

		DECLARE @saidaN char(1)
		EXEC SP_Grupo @aleatorioGrupo, @saidaN OUTPUT
		print @saidaN 


		IF ( (@cod IS NULL) OR (@cod='') )
		BEGIN
			PRINT 'o numero selecionado não está disponivel'
			SET @cont = @cont + 0
		END 
		ELSE
		BEGIN
			DECLARE @tamanho INT
			SET @tamanho = (SELECT COUNT(grupo) FROM grupos WHERE grupo = @saidaN)

			IF @tamanho >= 4
			BEGIN	
				PRINT 'o grupo já está cheio'
				SET @cont = @cont + 0
			END
			ELSE
			BEGIN
				UPDATE times SET ordenado = 0 WHERE codigoTime = @cod
				INSERT INTO grupos VALUES (@saidaN, @cod)
				SET @cont = @cont + 1
			END
		END
	END

	



CREATE PROCEDURE SP_Verifica(@time INT, @rodada INT, @retorno varchar(10) output)
AS
	DECLARE @codigo INT

	set @codigo = (select Rodada from jogos where timeb = @time AND Rodada = @rodada)

	if (@codigo is null)
	begin
		set @retorno = 'ok'
	end
	else
	begin
		set @retorno = 'nao'
	end 


	EXEC SP_DivideTime_INS
	select * from grupos ORDER BY grupo
	select * from times






CREATE PROCEDURE SP_FormarJogo
AS
	DECLARE @possibilidade INT
	SET @possibilidade = 1

	DECLARE @grupoTimeA CHAR(1)
	DECLARE @grupoTimeB CHAR(1)
	DECLARE @inicio INT
	SET @inicio = 0

		IF (@possibilidade = 1)
		BEGIN
			SET @grupoTimeA = 'A'
			SET @grupoTimeB = 'B'
			EXEC SP_Rodadas @grupoTimeA, @grupoTimeB, @inicio 
			set @possibilidade = @possibilidade + 1
		END

		IF (@possibilidade = 2)
		BEGIN
			SET @grupoTimeA = 'C'
			SET @grupoTimeB = 'D'
			EXEC SP_Rodadas @grupoTimeA, @grupoTimeB, @inicio
			set @possibilidade = @possibilidade + 1
		END 

		SET @inicio = @inicio + 4

		IF (@possibilidade = 3)
		BEGIN
			SET @grupoTimeA = 'A'
			SET @grupoTimeB = 'C'

			EXEC SP_Rodadas @grupoTimeA, @grupoTimeB, @inicio
			set @possibilidade = @possibilidade + 1
		END

		IF (@possibilidade = 4)
		BEGIN
			SET @grupoTimeA = 'B'
			SET @grupoTimeB = 'D'
			EXEC SP_Rodadas @grupoTimeA, @grupoTimeB, @inicio
			set @possibilidade = @possibilidade + 1
		END

		SET @inicio = @inicio + 4

		IF (@possibilidade = 5)
		BEGIN
			SET @grupoTimeA = 'A'
			SET @grupoTimeB = 'D'
			EXEC SP_Rodadas @grupoTimeA, @grupoTimeB, @inicio
			set @possibilidade = @possibilidade + 1
		END

		IF (@possibilidade = 6)
		BEGIN
			SET @grupoTimeA = 'B'
			SET @grupoTimeB = 'C'
			EXEC SP_Rodadas @grupoTimeA, @grupoTimeB, @inicio
			set @possibilidade = @possibilidade + 1
		END 


	

CREATE PROCEDURE SP_Rodadas(@GrupoManda CHAR(1), @GrupoVisit CHAR(1), @incio INT)
AS
	DECLARE @timeManda INT
	DECLARE @timeVisit INT

	DECLARE @contManda INT
	DECLARE @contVisit INT

	SET @contManda = 0
	SET @contVisit = 0

	WHILE @contManda < 4
	begin
		 
		SET @timeManda = (SELECT TOP (1) codigoTime from grupos WHERE grupo = @GrupoManda AND
			(codigoTime not in (SELECT TOP (@contManda) codigoTime FROM grupos WHERE grupo = @GrupoManda order by grupo, codigoTime)) order by grupo, codigoTime)
		print 'escolheu o mandante ' + cast(@timeManda as varchar(12))

		SET @contVisit = 0
		DECLARE @incioAUX INT
		set @incioAUX = @incio
		
		DECLARE @cont INT
		SET @cont = 0

		WHILE @contVisit < 4
		BEGIN
			if (@cont < 4)
			begin	
				
				print 'contvisit: ' + cast(@contVisit as varchar(12)) 
				print 'cont: ' + cast(@cont as varchar(12)) 

				set @timeVisit = 0
				SET @timeVisit = (SELECT TOP (1) codigoTime from grupos WHERE grupo = @GrupoVisit AND
				(codigoTime not in (SELECT TOP (@cont) codigoTime FROM grupos WHERE grupo = @GrupoVisit
				order by grupo, codigoTime)) order by grupo, codigoTime)

				print 'escolheu o visitante ' + cast(@timeVisit as varchar(12))


				DECLARE @resposta varchar(10) 
				DECLARE @incioAUX2 INT
				set @incioAUX2 = @incioAUX + 1

				print 'verificar->' + cast(@timeVisit as varchar(12)) + ' - ' + cast (@incioAUX2 as varchar(12)) 

				exec SP_Verifica  @timeVisit,  @incioAUX2, @resposta output

				print @resposta


				if (@resposta = 'nao')
				begin
					print 'entrou no nao'
					set @cont = @cont + 1
				end
				ELSE
				BEGIN
					print 'entrou no sim'
					set @contVisit = @contVisit + 1
					set @incioAUX = @incioAUX + 1 
					print 'inserir->' + cast(@timeManda as varchar(12)) + ' - ' + cast(@timeVisit as varchar(12)) + ' - ' + cast(@incioAUX as varchar(12))
					insert into jogos values (@timeManda, @timeVisit, @incioAUX, null, null, null)
					set @cont = @cont + 1
				end
			end
			else 
			begin
				print 'vai zerar o cont'
				set @cont = 0
			end
		
		END

		set @contManda = @contManda + 1
	end

	

	EXEC SP_FormarJogo
	select * from jogos order by Rodada
-------------------  fim da procedure ------------------

create PROCEDURE SP_DatasRodadas
AS
	DECLARE @dataJogo DATE
	SET @dataJogo = '2021-02-27' --comeca no domingo

	DECLARE @rodada INT
	SET @rodada = 1

	WHILE (@rodada < 13)
	BEGIN
		IF ( (@rodada % 2) <> 0)
		BEGIN	
			SET @dataJogo = (select dateadd(day,4,@dataJogo))
			UPDATE jogos SET dataRod = @dataJogo WHERE Rodada = @rodada;
		END

		IF ((@rodada % 2) = 0)
		BEGIN
			SET @dataJogo = (select dateadd(day,3,@dataJogo))
			UPDATE jogos SET dataRod = @dataJogo WHERE Rodada = @rodada;
		END

		SET @rodada = @rodada + 1
	END


CREATE FUNCTION fn_jogos(@data date)
RETURNS @table TABLE(
nomeTimeA VARCHAR(50),
nomeTimeB VARCHAR(50),
rodada INT,
id INT
)
AS
BEGIN
	INSERT INTO @table (nomeTimeA,nomeTimeB,rodada, id)
		select tm.NomeTime,tm2.NomeTime, jg.Rodada, jg.id
	from jogos jg 
	INNER JOIN times tm ON jg.timeA = tm.codigoTime
	INNER JOIN times tm2 ON jg.timeB = tm2.codigoTime
	WHERE dataRod =	@data

	RETURN 
END

select * from fn_jogos ('2019-03-03')

EXEC SP_DatasRodadas
	select * from jogos order by Rodada
    select * from jogos 

	select * from grupos order by grupo, codigoTime
	select * from jogos ORDER BY Rodada

	exec SP_FormarJogo

DECLARE @resposta varchar(10) 
exec SP_Verifica  3, 5, @resposta output
print @resposta


