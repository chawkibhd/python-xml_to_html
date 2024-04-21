<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Template pour l'élément CD -->
    <xsl:template match="CD">
        <html>
            <head>
                <title>Liste des artistes et albums</title>
                <!-- Add Bootstrap CSS -->
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
                </link>  
            </head>
            <body>
                
                <center><p> Ce travail a été réaliser par Belhaddad chawki et Mehdid samy</p>
                </center>  
                <div class="container">
                    <h1 class="text-center">Liste des artistes et albums</h1>
                    <xsl:apply-templates select="artiste" />
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- Template pour l'élément artiste -->
    <xsl:template match="artiste">
        <xsl:call-template name="afficherArtiste">
            <xsl:with-param name="nom" select="@nom" />
            <xsl:with-param name="biographie" select="biographie"/>
            <xsl:with-param name="ville" select="@ville"/>
            <xsl:with-param name="site" select="site/@url"/>
        </xsl:call-template>
        
        <div class="container">
            <table  class="table"  BORDER="3" style="margin-left: auto; margin-right: auto; border-color:green;" >
                <thead>
                    <tr>
                        <th style="border-color:green;">Album</th>
                        <th style="border-color:green;">Chansons</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates select="../album[ref-artiste/@ref = current()/@no]" />
                    
                </tbody>
            </table>
        </div>
        <hr style="color: red; border-width: 2px; margin-right: 100px; margin-left: 100px; margin-bottom: 60px; margin-top: 60px; border-style: dashed;"/>
    </xsl:template>
    
    <xsl:template name="afficherArtiste">
        <xsl:param name="nom" />
        <xsl:param name="biographie"/>
        <xsl:param name="ville"/>
        <xsl:param name="site"/>
        
        <h2 style="color: red">Nom: <xsl:value-of select="$nom"/></h2>
        <h2>Biographie: <xsl:value-of select="$biographie"/></h2>
        <h2>Ville: <xsl:value-of select="$ville"/></h2>
        <h2>Site: <a href="{$site}"><xsl:value-of select="$site" /></a></h2>
        <h2>productions:</h2>
    </xsl:template>
    
    <!-- Template pour l'élément album -->
    <xsl:template match="album">
        <tr style="border-color:green;">
            <td width="25%" style="border-color:green;">
                <xsl:value-of select="titre" />
            </td>
            <td style="border-color:green;">
                <xsl:apply-templates select="chansons/chanson" />
            </td>
        </tr>
    </xsl:template>
    
    <!-- Template pour l'élément chanson -->
    <xsl:template match="chanson">
        <p>
            <xsl:value-of select="." />
        </p>
    </xsl:template>
    
</xsl:stylesheet>


