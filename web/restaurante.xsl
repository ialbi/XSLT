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
		
		<main>
			<!-- variable literal para poder mostrar los datos del restaurante segun su nombre -->
			<xsl:variable name="restaurante">El clarete</xsl:variable>
			<h1><a target="_blank"> <xsl:attribute name='href'> <xsl:value-of select="restaurante[nombrerestaurante=$restaurante]/informacion"/></xsl:attribute><xsl:value-of select="restaurante[nombrerestaurante=$restaurante]/nombrerestaurante"/></a> - <xsl:value-of select="restaurante[nombrerestaurante=$restaurante]/ciudad"/></h1>
			<!-- Recorremos los menus -->
			<xsl:for-each select="restaurante[nombrerestaurante=$restaurante]/menu">
				<article class="restaurante">
					<h3><xsl:value-of select="@tipo"/></h3>
						<xsl:for-each select="plato">
							<p><xsl:value-of select="."/></p>
						</xsl:for-each>
						
				</article>
			</xsl:for-each>

		</main>

		<footer>
			<address>&#169; 2020 desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>

</xsl:template>

</xsl:stylesheet>