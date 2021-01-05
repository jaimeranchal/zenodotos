<!-- Extraido de: https://www.tei-c.org/Vault/Talks/OUCS/2006-02/talk-transform.pdf -->
<xsl:stylesheet version="1.0">
    <!-- Ejemplo -->
    <xsl:template match="tei:div">
        <!-- transformación aquí -->
    </xsl:template>
    <xsl:template match="tei:p">
    </xsl:template>

    <!-- TÉCNICA 1 -->
    <!-- Crea un html con todo el xml -->
    <xsl:template match="/">
        <html>
            <xsl:apply-templates/>
        </html>
    </xsl:template>

    <!-- Ignoramos el <teiHeader> -->
    <xsl:template match="tei:TEI">
        <xsl:apply-templates select="tei:text"/>
    </xsl:template>

    <!-- Procesa por separado <front> y <body> -->
    <xsl:template match="tei:text">
        <h1>Cabecera</h1>
        <xsl:apply-templates select="tei:front"/>
        <h1>Cuerpo</h1>
        <xsl:apply-templates select="tei:body"/>
    </xsl:template>

    <!-- TÉCNICA 2 --> 
    <!-- Plantilla para párrafos y encabezados -->
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:div">
        <h2>
            <xsl:value-of select="tei:head"/>
        </h2>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:div/tei:head"/>

    <!-- TÉCNICA 3 --> 
    <!-- Listas según el atributo "type" -->
    <xsl:template match="tei:list">
        <xsl:choose>
            <xsl:when test="@type=’ordered’">
                <ol>
                    <xsl:apply-templates/>
                </ol>
            </xsl:when>
            <xsl:when test="@type=’unordered’">
                <ul>
                    <xsl:apply-templates/>
                </ul>
            </xsl:when>
            <xsl:when test="@type=’gloss’">
                <dl>
                    <xsl:apply-templates/>
                </dl>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- TÉCNICA 4 --> 
    <!-- TÉCNICA 5 --> 
    <!-- TÉCNICA 6 --> 
    <!-- TÉCNICA 7 --> 
    <!-- TÉCNICA 8 --> 
    <!-- TÉCNICA 9 --> 
</xsl:stylesheet>
