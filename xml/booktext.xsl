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
                   The Sign of the Four 
                    
                </title>
              </head>
            <body>
                <section>
                    <div id="head">
                        <h2 class="title"> Orientalism in the Victorian Imagination</h2>
                    </div>
                </section>
                <section>
                    <div id="booktitle">
                <h1 id="title">The Sign of the Four</h1>
                    </div>
                <div class="toc">
                <h2 id="tblcon">Table of contents</h2>
                <ul>
                    <xsl:apply-templates select="/ch" mode="toc"/>
                </ul>
                <hr/>
                <h2 id="chapters">Chapters</h2>
                <xsl:apply-templates/>
                </div>
                </section>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ch" mode="toc">
        <li>
            <a href="#ch {@no}">
                <xsl:apply-templates select="title" mode="toc"/>
                <xsl:text>. </xsl:text>
               
            </a>         
        </li>
    </xsl:template>
    <xsl:template match="title" mode="toc">
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
