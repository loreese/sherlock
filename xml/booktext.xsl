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
                <link rel="stylesheet" type="text/css" href="../css/sherlock.css"/>
                <title>
                   The Sign of the Four Text   
                </title>
              </head>
            <body>
                <header>
                    <h1>Detecting Orientalism in Sherlock Holmes</h1>
                </header>
                <xsl:comment>#include virtual="../ssi/navbar.xhtml" </xsl:comment> 
                        <h2 class="title"> Orientalism in the Victorian Imagination</h2>
                <h1 id="booktitle">The Sign of the Four</h1>  
                <div id="toc" class="center">
                <h2>Table of contents</h2>
                <ul id="tbl">
                    <xsl:apply-templates select="//ch" mode="toc"/>
                </ul>
               <hr/>
                    <xsl:apply-templates/>
                </div>    
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ch" mode="toc">
        <li id="tblc">
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
    </xsl:template>
    <!-- End modal XSLT -->
    
    <xsl:template match="ch">
        <h3 id="ch-{@no}"><xsl:value-of select="@no"/></h3>
       <a href="#title">[Back to top]</a>
            <xsl:apply-templates/>   
    </xsl:template>
   <div class="book">
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
        </div>
    </xsl:stylesheet>
