<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>


    <xsl:template match="text()">
        <xsl:if test="normalize-space(.)">
            <xsl:value-of select="concat(normalize-space(.), '')"/>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="/">

    </xsl:template>


    <xsl:template match="/root/SłuchawkiWPromocji">
        <xsl:text>Słuchawki w promocji</xsl:text>
    </xsl:template>

    <xsl:template match="/root/SłuchawkiBezPromocji">

    </xsl:template>

    <xsl:template match="/root/Podsumowanie">

    </xsl:template>
</xsl:stylesheet>