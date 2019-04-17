<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="yscale" select="10"/>
    <xsl:template match="/">
        <svg>
            <g transform="translate(120,600)">
                <line x1="0" y1="0" x2="800" y2="0" stroke="black" stroke-width="2"/>
                <line x1="0" y1="0" x2="0" y2="-450" stroke="black" stroke-width="2"/>
                <xsl:apply-templates select="//book"/>

            </g>
        </svg>
    </xsl:template>
    <xsl:template match="book">
        <!-- Sherlock's primitive values -->
        <xsl:variable name="sh-prim-pos" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'pos' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-prim-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'ambig' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-prim-neg" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'neg' and ancestor::q[@speaker = 'Sherlock']])"/>
        <rect x="100" y="-{$yscale  + 25 *  $sh-prim-pos}"
            height="{$yscale * $sh-prim-pos}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="100" y="-{$yscale + 55 * $sh-prim-ambig}"
            height="{$yscale * $sh-prim-ambig}" width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="100" y="-{$yscale   * $sh-prim-neg}" height="{$yscale * $sh-prim-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Watson's primitive values -->
        <xsl:variable name="wat-prim-pos" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'pos'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-prim-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'ambig'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-prim-neg" as="xs:integer"
            select="count(descendant::*[@type = 'prim' and @att = 'neg'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <rect x="150" y="-{$yscale  + 25 *  $wat-prim-pos}"
            height="{$yscale * $wat-prim-pos}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="150" y="-{$yscale + 33 * $wat-prim-ambig}"
            height="{$yscale * $wat-prim-ambig}" width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="150" y="-{$yscale   * $wat-prim-neg}" height="{$yscale * $wat-prim-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Sherlock's violent values -->
        <xsl:variable name="sh-vio-pos" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'pos' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-vio-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'ambig' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-vio-neg" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'neg' and ancestor::q[@speaker = 'Sherlock']])"/>
        <rect x="250" y="-{$yscale  + 25 *  sum(($sh-vio-pos, $sh-vio-ambig, $sh-vio-neg))}"
            height="{$yscale * sum(($sh-vio-pos, $sh-vio-ambig, $sh-vio-neg))}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="250" y="-{$yscale + 16 * sum(($sh-vio-neg, $sh-vio-ambig))}"
            height="{$yscale * sum(($sh-vio-neg, $sh-vio-ambig))}" width="20" fill="yellow" stroke="black" stroke-width=".5"/> 
        <rect x="250" y="-{$yscale   * $sh-vio-neg}" height="{$yscale * $sh-vio-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Watson's violent values -->
        <xsl:variable name="wat-vio-pos" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'pos'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-vio-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'ambig'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-vio-neg" as="xs:integer"
            select="count(descendant::*[@type = 'violent' and @att = 'neg'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <rect x="300" y="-{$yscale  + 24 *  sum(($wat-vio-pos, $wat-vio-ambig, $wat-vio-neg))}"
            height="{$yscale * sum(($wat-vio-pos, $wat-vio-ambig, $wat-vio-neg))}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="300" y="-{$yscale + 16 * sum(($wat-vio-neg, $wat-vio-ambig))}"
            height="{$yscale * sum(($sh-vio-neg, $sh-vio-ambig))}" width="20" fill="yellow" stroke="black" stroke-width=".5"/> 
        <rect x="300" y="-{$yscale   * $wat-vio-neg}" height="{$yscale * $wat-vio-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Sherlock's exotic values -->
        <xsl:variable name="sh-ex-pos" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'pos' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-ex-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'ambig' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-ex-neg" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'neg' and ancestor::q[@speaker = 'Sherlock']])"/>    
        <rect x="400" y="-{$yscale  + 20 *  $sh-ex-pos}"
            height="{$yscale * $sh-ex-pos}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="400" y="-{$yscale + 60 * $sh-ex-ambig}"
            height="{$yscale * $sh-ex-ambig}" width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="400" y="-{$yscale   * $sh-ex-neg}" height="{$yscale * $sh-ex-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Watson's exotic values -->
        <xsl:variable name="wat-ex-pos" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'pos'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-ex-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'ambig'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-ex-neg" as="xs:integer"
            select="count(descendant::*[@type = 'exotic' and @att = 'neg'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <rect x="450" y="-{$yscale  + 16 *  $wat-ex-pos}"
            height="{$yscale * $wat-ex-pos}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="450" y="-{$yscale + 10 * $wat-ex-ambig}"
            height="{$yscale * $wat-ex-ambig}" width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="450" y="-{$yscale   * $wat-ex-neg}" height="{$yscale * $wat-ex-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Sherlock's none values -->
        <xsl:variable name="sh-none-pos" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'pos' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-none-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'ambig' and ancestor::q[@speaker = 'Sherlock']])"/>
        <xsl:variable name="sh-none-neg" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'neg' and ancestor::q[@speaker = 'Sherlock']])"/>
        <rect x="550" y="-{$yscale  + 11 *  $sh-none-pos}"
            height="{$yscale * $sh-none-pos}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="550" y="-{$yscale + 1 * $sh-none-ambig}"
            height="{$yscale * $sh-none-ambig}" width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="550" y="-{$yscale   * $sh-none-neg}" height="{$yscale * $sh-none-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        <!-- Watson's none values -->
        <xsl:variable name="wat-none-pos" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'pos'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-none-ambig" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'ambig'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <xsl:variable name="wat-none-neg" as="xs:integer"
            select="count(descendant::*[@type = 'none' and @att = 'neg'][ancestor::q[@speaker = 'Watson'] or not(ancestor::q)])"/>
        <rect x="600" y="-{$yscale  *  $wat-none-pos}"
            height="{$yscale * $wat-none-pos}" width="20"
            fill="green" stroke="black" stroke-width=".5"/>
        <rect x="600" y="-{$yscale + 20 * $wat-none-ambig}"
            height="{$yscale * $wat-none-ambig}" width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <rect x="600" y="-{$yscale   * $wat-none-neg}" height="{$yscale * $wat-none-neg}" width="20"
            fill="blue" stroke="black" stroke-width=".5"/>
        
        <text x="60" y="60" text-anchor="start">
            blue=neg
            yellow=ambigious
            green=pos
        </text>
    </xsl:template>
</xsl:stylesheet>
