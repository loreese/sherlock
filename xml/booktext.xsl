<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compact"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    The Sign of the Four
                    <link rel="stylesheet" type="text/css" href="../css/booktxt.css"/>
                </title>
            </head>
            <body>              
                <div>
                    <h2>Contents</h2>
                <ul>
                    <xsl:apply-templates select="//ch" mode="toc"/>
                </ul>
                </div>
                 <hr/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ch" mode="toc">
        
        <li>
            <a href="#{@no}">  <xsl:apply-templates select="@no"/>
            <xsl:text>. </xsl:text>                        
            <xsl:apply-templates select="title" mode="toc"/>
            </a>
        </li>
       
    </xsl:template>
    <xsl:template match="ch">
        <div>
        <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    </xsl:stylesheet>