<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs" version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="yscale" select="10"/>
    <xsl:template match="/">
        <div class="descBar">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 800">
                <g transform="translate(120,500)">
                    <line x1="0" y1="0" x2="840" y2="0" stroke="black" stroke-width="2"/>
                    <line x1="0" y1="0" x2="0" y2="-450" stroke="black" stroke-width="2"/>
                    <xsl:apply-templates select="//ch"/>
                </g>
            </svg>
        </div>
    </xsl:template>
    <xsl:template match="ch" xmlns="http://www.w3.org/2000/svg">
        <!-- occident values -->
        <xsl:variable name="pos" select="position()-1"/>
        <xsl:variable name="barWidth" select="30"/>
        <xsl:variable name="barInt" select="70"/>
        <xsl:variable name="occ-pos" as="xs:integer"
            select="count(descendant::*[@att='pos' and ancestor::desc[@host='occident']]) "/>
       <xsl:variable name="occ-ambig" as="xs:integer"
            select="count(descendant::*[@att='ambig' and ancestor::desc[@host='occident']]) "/>
        <xsl:variable name="occ-neg" as="xs:integer"
            select="count(descendant::*[@att='neg' and ancestor::desc[@host='occident']]) "/>
        <rect x="{$pos * $barInt }" y="-{($occ-pos * $yscale)}" height="{($occ-pos * $yscale)}"
            width="20" fill="red" stroke="black" stroke-width=".5"/>
        <rect x="{$pos * $barInt}" y="-{($occ-pos + $occ-ambig) * $yscale}" height="{($occ-ambig * $yscale)}"
            width="20" fill="orange" stroke="black" stroke-width=".5"/>
        <rect x="{$pos * $barInt}" y="-{($occ-pos + $occ-ambig + $occ-neg) * $yscale}" height="{($occ-neg * $yscale)}"
            width="20" fill="yellow" stroke="black" stroke-width=".5"/>
        <!-- orient values -->
        <xsl:variable name="ori-pos" as="xs:integer"
            select="count(descendant::*[@att='pos' and ancestor::desc[@host='orient']]) "/>
        <xsl:variable name="ori-ambig" as="xs:integer"
            select="count(descendant::*[@att='ambig' and ancestor::desc[@host='orient']]) "/>
        <xsl:variable name="ori-neg" as="xs:integer"
            select="count(descendant::*[@att='neg' and ancestor::desc[@host='orient']]) "/> 
        <rect x="{($pos * $barInt) + 20 }" y="-{($ori-pos * $yscale)}" height="{($ori-pos * $yscale)}"
            width="20" fill="green" stroke="black" stroke-width=".5"/>
       <rect x="{($pos * $barInt) + 20}" y="-{($ori-pos + $ori-ambig) * $yscale}" height="{($ori-ambig * $yscale)}"
            width="20" fill="blue" stroke="black" stroke-width=".5"/> 
       <rect x="{($pos * $barInt) + 20}" y="-{($ori-pos + $ori-ambig + $ori-neg) * $yscale}" height="{($ori-neg * $yscale)}"
            width="20" fill="violet" stroke="black" stroke-width=".5"/> 
        <text x="80" y="60" text-anchor="middle">
            2
        </text>
        <text x="170" y="60" text-anchor="middle">
            3
        </text>
        <text x="220" y="60" text-anchor="middle">
            4
        </text>
        <text x="300" y="60" text-anchor="middle">
            5
        </text>
        <text x="380" y="60" text-anchor="middle">
            6
        </text>
        <text x="460" y="60" text-anchor="middle">
            7
        </text>
        <text x="520" y="60" text-anchor="middle">
            8
        </text>
        <text x="600" y="60" text-anchor="middle">
            9
        </text>
        <text x="660" y="60" text-anchor="middle">
            10
        </text>
        <text x="720" y="60" text-anchor="middle">
            11
        </text>
        <text x="800" y="60" text-anchor="middle">
            12
        </text>
        <text x="300" y="100" text-anchor="middle">
            West
        </text>       
        <text x="300" y="120" text-anchor="middle">
            Red = Positive
        </text>       
        <text x="300" y="130" text-anchor="middle">
            Orange = Ambiguous
        </text>     
        <text x="300" y="140" text-anchor="middle">
            Yellow= Negative
        </text>
        <text x="550" y="100" text-anchor="middle">
            East
        </text>
        <text x="550" y="120" text-anchor="middle">
            Green = Positive
        </text>
        <text x="550" y="130" text-anchor="middle">
            Blue = Ambiguous
        </text>
        <text x="550" y="140" text-anchor="middle">
            Violet = Negative
        </text>
        <text x="0" y="60" text-anchor="middle">
            CH
        </text>
        <line x1="0" y1="-50" x2="850" y2="-50" stroke="gray" stroke-width="2"
            stroke-dasharray="1,5"/>
        <text x="-25" y="-50" text-anchor="middle">
            5
        </text>
        <line x1="0" y1="-100" x2="850" y2="-100" stroke="gray" stroke-width="2"
            stroke-dasharray="1,5"/>
        <text x="-30" y="-100" text-anchor="middle">
            10
        </text>
        <line x1="0" y1="-150" x2="850" y2="-150" stroke="gray" stroke-width="2"
            stroke-dasharray="1,5"/>
        <text x="-30" y="-150" text-anchor="middle">
            15
        </text>
        <line x1="0" y1="-200" x2="850" y2="-200" stroke="gray" stroke-width="2"
            stroke-dasharray="1,5"/>
        <text x="-30" y="-200" text-anchor="middle">
            20
        </text>
        <line x1="0" y1="-250" x2="850" y2="-250" stroke="gray" stroke-width="2"
            stroke-dasharray="1,5"/>
        <text x="-30" y="-250" text-anchor="middle">
            25
        </text>
        <line x1="0" y1="-300" x2="850" y2="-300" stroke="gray" stroke-width="2"
            stroke-dasharray="1,5"/>
        <text x="-30" y="-300" text-anchor="middle">
            30
        </text>
        <line x1="0" y1="-350" x2="850" y2="-350" stroke="gray" stroke-width="2"
            stroke-dasharray="1,5"/>
        <text x="-30" y="-350" text-anchor="middle">
            35
        </text>
        <line x1="0" y1="-400" x2="850" y2="-400" stroke="gray" stroke-width="2"
            stroke-dasharray="1,5"/>
        <text x="-30" y="-400" text-anchor="middle">
            40
        </text>
    </xsl:template>
</xsl:stylesheet>