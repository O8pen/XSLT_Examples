<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- <xsl:stylesheet version="2.0"
         xmlns="urn:iso:std:iso:20022:tech:xsd:pain.001.001.03"
         xpath-default-namespace="urn:iso:std:iso:20022:tech:xsd:pain.001.001.03"
         xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         exclude-result-prefixes="xsi"> -->
    <!-- <xsl:stylesheet version="3.0"
         xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> -->
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
                        <xsl:value-of select="title"/>
                        <xsl:if test="position()=last()">
                            <tr>
                                <td><xsl:value-of select="title"/></td>
                                <td><xsl:value-of select="artist"/></td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </table>
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