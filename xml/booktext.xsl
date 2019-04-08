<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <link rel="stylesheet" type="text/css" href="../css/booktxt.css"/>
                <title>
                   The Sign of the Four Text   
                </title>
              </head>
            <body>
                <header>
                    <h1>Detecting Orientalism in Sherlock Holmes</h1>
                </header>
                <xsl:comment>#include virtual="../ssi/navbar.xhtml" </xsl:comment> 
                        <h2 class="subtitle"> Orientalism in the Victorian Imagination</h2>
                <h1>The Sign of the Four</h1>  
                <div id="toc">
                    <h2>Table of contents</h2>
                <ul>
                    <xsl:apply-templates select="//ch" mode="toc"/>
                </ul>
                 <xsl:apply-templates/>
                </div>    
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="ch" mode="toc">
        <li>
            <a href="#ch{@no}">
                <xsl:apply-templates select="@no"/>
                <xsl:text>. </xsl:text>
                <xsl:apply-templates select="chTitle" mode="toc"/>
            </a>         
        </li>
    </xsl:template>
    <xsl:template match="chTitle">
      <h3><xsl:apply-templates select="@no"/></h3>
          <xsl:apply-templates/>
        <h3><xsl:apply-templates select="chTitle"/></h3>
    </xsl:template>
    <!-- End modal XSLT -->
   
    <xsl:template match="ch">
        <h3><xsl:value-of select="@no"/></h3>
       <a href="#ch-{@no}">[Back to top]</a>
            <xsl:apply-templates/>   
    </xsl:template>
   
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="q">
        <q><xsl:apply-templates/></q>
    </xsl:template>
    <xsl:template match="subq">
        <span class="subq {@id}"><xsl:text>&apos;</xsl:text><xsl:apply-templates/><xsl:text>&apos;</xsl:text></span>
    </xsl:template>
    
    </xsl:stylesheet>
