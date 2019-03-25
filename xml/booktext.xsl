<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- zme: When we transform XML to HTML, we need to account for all namespaces
    with our input and output files. Our input file isn't in a namespace, but HTML is
    in a namespace. Insert xmlns="http://www.w3.org/1999/xhtml" into your root element,
    and you'll get output. Also, be sure to view your output in a broswer and *also* save
    it and open it in <oXygen/> to make sure that the HTML output you wrote is valid.
    If it's invalid, it's not guaranteed to render properly! Regarding one of your questions with
    the HTML namespace: it is always the same exact URL. You shouldn't see or write any
    namespace declarations that have anything other than http://www.w3.org/1999/xhtml
    -->
    
    <!--<xsl:output indent="yes" method="xml" doctype-system="about:legacy-compact"/>-->
    <xsl:output indent="yes" method="xml" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                
                <title>
                   The Sign of the Four
                    <link rel="stylesheet" type="text/css" href="../css/booktxt.css"/> 
                </title>
                <!-- zme: the <link> element can't occur inside a <title> element and should
                    be moved directly below the <head> element. These sorts of HTML errors won't
                    be flagged in XSLT, since XSLT doesn't validate HTML code. You'll need to open
                    your HTML file in <oXygen/> to catch these sorts of errors.
                -->
            </head>
            
            <body>  
                <h1>Sherlock Holmes: The Sign of the Four</h1>
                  <div>
                      <!--#include virtual="../ssi/navbar.xhtml" -->                     
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
            
            <!-- zme: Review our tutorial on AVTs and internal linking. You
                wrote the first component of our AVT linking approach correctly here,
                but the @href isn't pointing to any chapter as of now, since your chapter
                <div> elements don't have an @id that is equal to one of the @href attributes
                you encode here. Remember that an @href attribute value *is* the same as its
                corresponding <div> paragraph, except that the @href has a leading pound sign (#),
                to indicate that it's jumping to that part of the page. @href="#paraID" and @id="paraID"
                -->
            
        </li>
       
    </xsl:template>
    <xsl:template match="ch">
        <div>
        <xsl:apply-templates/>
        </div>
        
        <!-- When we want to associate a specific group of HTML elements together,
        we unify them with a @class value attribute. We use this most often because it 
        allows us to unify different iterations of the same sort of element and style them
        uniformly. For example, we could have many <div class="text"> and <div class="analysis">
        elements in our text. We use the @id value when we want to give that element a *unique*
        identifier, which is what we want to do when we write internal linking in our code - like
        you're doing here. If we wanted to write <div> elements so that every <div> that contains
        text from the book had a shared class value, but a unique identifier, it could look like this:
        
        <div id="ch-07" class="text">
        
        All these <div> elements can share that class value, but you can't duplicate an @id
        value in HTML.
        
        To style elements according to class or id value in CSS, it looks like this:
        
        div.text{
             style-property: here;
        }
        
        div#ch-07{
             style-property: here;
        }
        -->
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="q">
        <q><xsl:apply-templates/></q>
    </xsl:template>
  
    <xsl:template match="/subq">
        <xsl:text>&apos;</xsl:text><xsl:apply-templates/><xsl:text>&apos;</xsl:text>
    </xsl:template>
    </xsl:stylesheet>