<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="yscale" select="10"/>
    <xsl:template match="/">
        <div class="descBar">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1500 550">
                <g transform="translate(120,500)">
                    <line x1="0" y1="0" x2="800" y2="0" stroke="black" stroke-width="2"/>
                    <line x1="0" y1="0" x2="0" y2="-450" stroke="black" stroke-width="2"/>
                    <xsl:apply-templates select="//book"/>

                </g>
            </svg>
        </div>
    </xsl:template>
    <xsl:template match="book" xmlns="http://www.w3.org/2000/svg">
        <!-- Sherlock's primitive values -->
        <xsl:variable name="sh-prim-pos" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'pos' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-prim-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'ambig' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-prim-neg" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'neg' and ancestor::q[@speaker = 'Sherlock']])"/>
        <rect x="100" y="-{$yscale  + 25 *  $sh-prim-pos}" height="{$yscale * $sh-prim-pos}"
            width="20" fill="green" stroke="black" stroke-width=".5"/>
        <rect x="100" y="-{$yscale + 55 * $sh-prim-ambig}" height="{$yscale * $sh-prim-ambig}"
            width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="100" y="-{$yscale   * $sh-prim-neg}" height="{$yscale * $sh-prim-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Watson's primitive values -->
        <xsl:variable name="wat-prim-pos" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'pos'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-prim-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'ambig'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-prim-neg" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'neg'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <rect x="150" y="-{$yscale  + 25 *  $wat-prim-pos}" height="{$yscale * $wat-prim-pos}"
            width="20" fill="green" stroke="black" stroke-width=".5"/>
        <rect x="150" y="-{$yscale + 33 * $wat-prim-ambig}" height="{$yscale * $wat-prim-ambig}"
            width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="150" y="-{$yscale   * $wat-prim-neg}" height="{$yscale * $wat-prim-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Sherlock's violent values -->
        <xsl:variable name="sh-vio-pos" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'pos' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-vio-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'ambig' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-vio-neg" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'neg' and ancestor::q[@speaker = 'Sherlock']])"/>
        <rect x="250" y="-{$yscale  + 25 *  $sh-vio-pos}" height="{$yscale * $sh-vio-pos}"
            width="20" fill="green" stroke="black" stroke-width=".5"/>
        <rect x="250" y="-{$yscale + 16 * $sh-vio-ambig}" height="{$yscale * $sh-vio-ambig}"
            width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="250" y="-{$yscale   * $sh-vio-neg}" height="{$yscale * $sh-vio-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Watson's violent values -->
        <xsl:variable name="wat-vio-pos" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'pos'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-vio-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'ambig'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-vio-neg" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'neg'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <rect x="300" y="-{$yscale  + 24 *  $wat-vio-pos}" height="{$yscale * $wat-vio-pos}"
            width="20" fill="green" stroke="black" stroke-width=".5"/>
        <rect x="300" y="-{$yscale + 16 * $wat-vio-ambig}" height="{$yscale *  $sh-vio-ambig}"
            width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="300" y="-{$yscale   * $wat-vio-neg}" height="{$yscale * $wat-vio-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Sherlock's exotic values -->
        <xsl:variable name="sh-ex-pos" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'pos' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-ex-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'ambig' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-ex-neg" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'neg' and ancestor::q[@speaker = 'Sherlock']])"/>
        <rect x="400" y="-{$yscale  + 20 *  $sh-ex-pos}" height="{$yscale * $sh-ex-pos}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="400" y="-{$yscale + 60 * $sh-ex-ambig}" height="{$yscale * $sh-ex-ambig}"
            width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="400" y="-{$yscale   * $sh-ex-neg}" height="{$yscale * $sh-ex-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Watson's exotic values -->
        <xsl:variable name="wat-ex-pos" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'pos'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-ex-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'ambig'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-ex-neg" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'neg'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <rect x="450" y="-{$yscale  + 16 *  $wat-ex-pos}" height="{$yscale * $wat-ex-pos}"
            width="20" fill="green" stroke="black" stroke-width=".5"/>
        <rect x="450" y="-{$yscale + 10 * $wat-ex-ambig}" height="{$yscale * $wat-ex-ambig}"
            width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="450" y="-{$yscale   * $wat-ex-neg}" height="{$yscale * $wat-ex-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Sherlock's none values -->
        <xsl:variable name="sh-none-pos" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'pos' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-none-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'ambig' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-none-neg" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'neg' and ancestor::q[@speaker = 'Sherlock']])"/>
        <rect x="550" y="-{$yscale  + 11 *  $sh-none-pos}" height="{$yscale * $sh-none-pos}"
            width="20" fill="green" stroke="black" stroke-width=".5"/>
        <rect x="550" y="-{$yscale + 1 * $sh-none-ambig}" height="{$yscale * $sh-none-ambig}"
            width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="550" y="-{$yscale   * $sh-none-neg}" height="{$yscale * $sh-none-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Watson's none values -->
        <xsl:variable name="wat-none-pos" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'pos'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-none-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'ambig'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-none-neg" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'neg'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <rect x="600" y="-{$yscale  *  $wat-none-pos}" height="{$yscale * $wat-none-pos}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="600" y="-{$yscale + 20 * $wat-none-ambig}" height="{$yscale * $wat-none-ambig}"
            width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="600" y="-{$yscale   * $wat-none-neg}" height="{$yscale * $wat-none-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>

        <!-- <text x="80" y="80" text-anchor="start">
            blue=neg
            yellow=ambigious
            green=pos
        </text> -->
        <text x="135" y="50" text-anchor="middle"> Primitive </text>
        <text x="280" y="50" text-anchor="middle"> Violent </text>
        <text x="435" y="50" text-anchor="middle"> Exotic </text>
        <text x="590" y="50" text-anchor="middle"> Undetermined </text>
        <text x="110" y="30" text-anchor="middle">S</text>
        <text x="160" y="30" text-anchor="middle">W</text>
        <text x="260" y="30" text-anchor="middle">S</text>
        <text x="310" y="30" text-anchor="middle">W</text>
        <text x="410" y="30" text-anchor="middle">S</text>
        <text x="460" y="30" text-anchor="middle">W</text>
        <text x="560" y="30" text-anchor="middle">S</text>
        <text x="610" y="30" text-anchor="middle">W</text>
    </xsl:template>
</xsl:stylesheet>
