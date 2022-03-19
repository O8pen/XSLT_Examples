<?xml version="1.0" encoding="utf-8"?>
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
                
                <table border="1">
                    <xsl:copy-of select="$header" />                    
                    <xsl:for-each select="catalog/cd">
                        <xsl:sort select="title"/>
                        <xsl:if test="position()=last()">
                            <tr>
                                <td><xsl:value-of select="title"/></td>
                                <td><xsl:value-of select="artist"/></td>
                            </tr>
                        </xsl:if>                        
                    </xsl:for-each>
                </table>
                <!-- <xsl:if test="artist='Bonnie Tyler'">
                     <h1><xsl:value-of select="title"/></h1>
                     </xsl:if> -->
                <!-- <h1><xsl:value-of select="//country[. eq 'USA']/../title"/></h1> -->
                <!-- <xsl:for-each select="catalog/cd/country='USA'/"> 
                     <xsl:if test="country='USA'">
                     <h1><xsl:value-of select="title"/></h1>
                     </xsl:if> 
                     </xsl:for-each> -->
                <!-- <xsl:for-each select="catalog/cd/anan/baban='2'">
                     <h1><xsl:value-of select="amcan"/></h1>
                     </xsl:for-each> -->
                <xsl:for-each select="//cd">
                    <xsl:choose>
                        <xsl:when test="country='USA'">
                            <h1><xsl:value-of select="price"/></h1>
                        </xsl:when>
                        <xsl:when test="country='UK'">
                            <h1><xsl:value-of select="year"/></h1>
                        </xsl:when>
                        <xsl:otherwise>
                            <h1>lol</h1>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                
                <h1>___________x</h1>  
                
                <xsl:for-each select="//baban[text()='22222']">                    
                    <h1><xsl:value-of select="../amcan"/></h1>  
                    <h1>aaa</h1>  
                </xsl:for-each>
                
                <h1>___________</h1>  
                
                <h1><xsl:value-of select="//*[text()='22222']/amcan"/></h1>
                
                <h1><xsl:value-of select="sum(catalog/cd/year)"/></h1>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="catalog/div">
        <xsl:apply-templates select="divdiv"/>
        <xsl:apply-templates select="asd"/>      
        <h1>___________</h1>  
        <!-- <h1><xsl:value-of select="fn:abs(divdiv/value) + fn:abs(asd/value)"/></h1> -->
        <h1><xsl:value-of select="floor(divdiv/value + asd/value)"/></h1>
    </xsl:template>
    
    <xsl:template match="divdiv">
        <h1><xsl:value-of select="test"/></h1>
        <h2><xsl:value-of select="value"/></h2>        
    </xsl:template>
    
    <xsl:template match="asd">
        <h1><xsl:value-of select="test"/></h1>
        <h2><xsl:value-of select="value"/></h2>
    </xsl:template>
    
</xsl:stylesheet>