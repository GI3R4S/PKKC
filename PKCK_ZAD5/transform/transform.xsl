<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output method="text"/>

    <xsl:template match="text()">
        <xsl:if test="normalize-space(.)">
            <xsl:value-of select="concat(normalize-space(.), '')"/>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="/">
        <xsl:apply-templates select="/zawartość/daneDokumentu"/>
        <xsl:apply-templates select="/zawartość/marki"/>
        <xsl:apply-templates select="/zawartość/listaPrzedmiotów"/>
    </xsl:template>


    <xsl:template match="/zawartość/daneDokumentu">
        <xsl:text>&#x9;Dane dokumentu</xsl:text>
        <xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:value-of select="concat('&#xa; Opis:&#x9;', /zawartość/daneDokumentu/opisDokumentu)"/>
        <xsl:text>&#xa;Autorzy:</xsl:text>
        <xsl:for-each select="/zawartość/daneDokumentu/autorzy/autor">
            <xsl:text>&#xa;&#xa;Autor </xsl:text><xsl:value-of select="position()"/>.
            <xsl:value-of select="concat('&#xa; Imię:&#x9;', ./imie)"/>
            <xsl:value-of select="concat('&#xa; Nazwisko:&#x9;', ./nazwisko)"/>
            <xsl:value-of select="concat('&#xa; Pseudonim:&#x9;', ./pseudonim)"/>
        </xsl:for-each>
        <xsl:value-of select="concat('&#xa;&#xa;&#xa; dataUtworzenia:&#x9;', /zawartość/daneDokumentu/dataUtworzenia)"/>
        <xsl:value-of select="concat('&#xa; dataModyfikacji:&#x9;', /zawartość/daneDokumentu/dataModyfikacji)"/>

        <xsl:text>&#xa;&#xa;################################################################################################</xsl:text>
        <xsl:text>&#xa;&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="/zawartość/marki">
        <xsl:text>&#xa;&#xd;&#x9;Marki</xsl:text>
        <xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:for-each select="/zawartość/marki/marka">
            <xsl:value-of select="concat('&#xa;&#xa;', ./.)"/>
            <xsl:value-of select="concat('&#xa;- id_marki:&#x9;', ./@id_marki)"/>
            <xsl:value-of select="concat('&#xa;- krajPochodzenia:&#x9;', ./@krajPochodzenia)"/>
            <xsl:value-of select="concat('&#xa;- rokPowstania:&#x9;', ./@rokPowstania)"/>
            <xsl:text>&#xa;&#xa;################################################################################################</xsl:text>

        </xsl:for-each>

        <xsl:text>&#xa;&#xa;################################################################################################</xsl:text>
        <xsl:text>&#xa;&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="/zawartość/listaPrzedmiotów">
        <xsl:text>&#xa;&#xd;&#x9;Lista przedmiotów</xsl:text>
        <xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:for-each select="/zawartość/listaPrzedmiotów/przedmiot">
            <xsl:value-of select="concat('&#xa;&#xa;', ./nazwa)"/>
            <xsl:value-of select="concat('&#xa;- przedmiotID:&#x9;', ./@przedmiotID)"/>
            <xsl:value-of select="concat('&#xa;- markaID:&#x9;', ./@markaID)"/>
            <xsl:value-of select="concat('&#xa;- cena:&#x9;', ./cena, ' ', ./cena/@waluta, '&#x9;Promocja:&#x9;', ./cena/@promocja)"/>
            <xsl:value-of select="concat('&#xa;- typKonstrukcji:&#x9;', ./typKonstrukcji)"/>
            <xsl:value-of select="concat('&#xa;- średnicaMembrany:&#x9;', ./średnicaMembrany, ./średnicaMembrany/@jednostka)"/>
            <xsl:value-of select="concat('&#xa;- pasmoPrzenoszeniaSłuchawek:&#x9;', 'Od ', ./pasmoPrzenoszeniaSłuchawek/minimum,
             ./pasmoPrzenoszeniaSłuchawek/minimum/@jednostka, ' do ', ./pasmoPrzenoszeniaSłuchawek/maximum, ./pasmoPrzenoszeniaSłuchawek/maximum/@jednostka)"/>
            <xsl:value-of select="concat('&#xa;- impedancjaSłuchawek:&#x9;', ./impedancjaSłuchawek, ./impedancjaSłuchawek/@jednostka)"/>
            <xsl:value-of select="concat('&#xa;- czułośćSłuchawek:&#x9;', ./czułośćSłuchawek, ./czułośćSłuchawek/@jednostka)"/>
            <xsl:value-of select="concat('&#xa;- wbudowanyMikrofon:&#x9;', ./wbudowanyMikrofon)"/>
            <xsl:value-of select="concat('&#xa;- kolor:&#x9;', ./kolor)"/>
            <xsl:value-of select="concat('&#xa;- długośćKabla:&#x9;', ./długośćKabla, ./długośćKabla/@jednostka)"/>

            <xsl:text>&#xa;&#xa;################################################################################################</xsl:text>

        </xsl:for-each>

        <xsl:text>&#xa;&#xa;################################################################################################</xsl:text>
        <xsl:text>&#xa;&#xa;</xsl:text>
    </xsl:template>


</xsl:stylesheet>