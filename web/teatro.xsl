<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat" />
<xsl:template match='/reservaeventos'>
<html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="teatro.xml">Teatro</a>
			<a href="restaurante.xml">Restaurante</a>
			<a href="festival.xml">Festival</a>
		</header>
		
		<main class="principal">
			<section class="teatro">
				<h1>PROXIMAS OBRAS DE TEATRO</h1>
					<ul>
						<!-- Seleccionamos las obras -->
						<xsl:for-each select="teatro">
							<!-- Las ordenamos por fecha de más reciente a menos -->
							<xsl:sort select="fechahora/@dia" order="descending" />
									<!-- comprobamos que se corresponde al periodo señalado, enero del 2023 -->
									<xsl:variable name="fecha" select="fechahora/@dia"/>
									<xsl:variable name="año" select="substring($fecha, 1, 4)"/>
									<xsl:variable name="mes" select="substring($fecha, 6, 2)"/>
									<xsl:if test="$año = '2023' and $mes= '01'">
										<li>
											<!-- doble if, porque carece de else -->
												<xsl:if test="precio&lt;20"><u><xsl:value-of select="fechahora/@dia"/>: <xsl:value-of select="obra"/></u></xsl:if>
												<xsl:if test="precio&gt;=20"><xsl:value-of select="fechahora/@dia"/>: <xsl:value-of select="obra"/></xsl:if>
										</li>
									</xsl:if>
						</xsl:for-each>
					</ul>
			</section>
		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>

</xsl:stylesheet>