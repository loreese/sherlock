<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <link rel="stylesheet" type="text/css" href="../css/booktxt.css"/>
                <title> The Sign of the Four Text </title>
            </head>
            <body>
                <xsl:comment>#include virtual="../ssi/navbar.xhtml" </xsl:comment>
                <h1>Detecting Orientalism in Sherlock Holmes</h1>
                <h1 class="subhead">The Sign of the Four</h1>
                <div id="toc">
                    <h2>Table of contents</h2>
                    <ul>
                        <xsl:apply-templates select="//ch" mode="toc"/>
                    </ul>
                </div>
                <div class="flexbox">
                    <div class="text">
                        <xsl:apply-templates select="//book"/>
                    </div>
                    <!--<div class="text-menu">
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed venenatis
                            pretium dolor in porta. Aenean auctor nibh ac tellus porta, hendrerit
                            dapibus sem egestas. Vestibulum eget sollicitudin erat, non rutrum
                            libero. Quisque quis velit eget enim convallis maximus. Donec lacinia
                            eros massa, sit amet pharetra purus porta sed. Class aptent taciti
                            sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
                            Duis rutrum placerat tempus. Vivamus vel nunc nulla. Curabitur posuere
                            iaculis quam non bibendum.</p>
                    </div>-->
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="ch" mode="toc">
        <li>
            <!-- zme: removing the whitespace character from the @href value -->

            <a href="#ch{@no}">
                <xsl:apply-templates select="@no" mode="toc"/>
                <xsl:text>. </xsl:text>
                <xsl:apply-templates select="chTitle" mode="toc"/>
            </a>
        </li>
    </xsl:template>
    <xsl:template match="chTitle" mode="toc">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- zme: commenting out this seemingly redundant book template (see
    line 58-62 for template still in use) -->

    <!--    <xsl:template match="book">
      <h2 id="ch {@no}">
          <xsl:apply-templates select="@no"/></h2>
    </xsl:template> 
-->

    <!-- zme: commenting out this chTitle template to put it in each chapter
    header on line 74 to replicate its design in the table of contents-->

    <!--<xsl:template match="chTitle">
            <h3><xsl:apply-templates/></h3>
    </xsl:template>-->

    <!-- End modal XSLT -->

    <xsl:template match="ch">

        <!-- zme: adding an @id value for the table of content @href attributes to link to
        for each chapter (see line 30) -->
        <!-- zme: adding plain text and the chapter title to precede each chapter's text, like
    it's formatted in the toc-->
        <h3 id="ch{@no}">
            <xsl:value-of select="@no"/>
            <xsl:text>. </xsl:text>
            <xsl:value-of select="chTitle"/>
        </h3>

        <!-- zme: changing the @href value to back link it to <div id="toc"> at the top
        of the page-->

        <h3>
            <a href="#toc">[Back to top]</a>
        </h3>
        <xsl:apply-templates/>
    </xsl:template>

    <!-- zme: adding an empty chTitle template to remove its duplicated rendering before
    each chapter (see line 73 for its rendering on the web page) -->

    <xsl:template match="chTitle"/>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="q">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>
    <xsl:template match="subq">
        <span class="subq {@id}">
            <xsl:text>'</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>'</xsl:text>
        </span>
    </xsl:template>
</xsl:stylesheet>
