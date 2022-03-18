<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="header">
        <tr bgcolor="#9acd32">
            <th align="left">Title</th>
            <th align="left">Artist</th>
        </tr>
    </xsl:variable>
    
    <xsl:template match="/">
        <html>
            <body>
                <h2>My CD Collection</h2>
                <xsl:apply-templates select="catalog/div"/> 
                
                <!-- <xsl:copy-of select="$header" /> -->
                <p>Titles:
                    <xsl:for-each select="catalog/cd">
                        <xsl:value-of select="title"/>
                        <xsl:if test="position()!=last()">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                        <xsl:if test="position()=last()-1">
                            <xsl:text> and </xsl:text>
                        </xsl:if>
                        <xsl:if test="position()=last()">
                            <xsl:text>!</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </p>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="catalog/div">
        <xsl:apply-templates select="divdiv"/>
        <xsl:apply-templates select="asd"/>
    </xsl:template>
    
    <xsl:template match="divdiv">
        <h1><xsl:value-of select="value"/></h1>
        <h1><xsl:value-of select="test"/></h1>
    </xsl:template>
    
    <xsl:template match="asd">
        <h2><xsl:value-of select="value"/></h2>
        <h2><xsl:value-of select="test"/></h2>
    </xsl:template>   
    
</xsl:stylesheet>