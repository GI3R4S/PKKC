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
        <xsl:apply-templates select="/root/SłuchawkiWPromocji"/>
        <xsl:apply-templates select="/root/SłuchawkiBezPromocji"/>
        <xsl:apply-templates select="/root/Podsumowanie"/>
    </xsl:template>


    <xsl:template match="/root/SłuchawkiWPromocji">
        <xsl:text>&#x9;Słuchawki w promocji</xsl:text>
        <xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:for-each select="/root/SłuchawkiWPromocji/Słuchawki">
            <xsl:value-of select="concat('&#x9;&#x9;&#x9;', ./Nazwa, '&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Poprzednia cena:&#xa;&#x9;', ./PoprzedniaCena,'&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Aktualna cena:&#xa;&#x9;', ./AktualnaCena,'&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Waluta:&#xa;&#x9;', ./AktualnaCena/@Waluta,'&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Nazwa marki:&#xa;&#x9;', ./NazwaMarki,'&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Kraj pochodzenia:&#xa;&#x9;', ./KrajPochodzenia,'&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Opis:&#xa;&#x9;', ./Opis,'&#xa;')"/>
            <xsl:text>&#xa;</xsl:text>
            <xsl:text>################################################################################################</xsl:text>
            <xsl:text>&#xa;&#xa;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#xa;&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="/root/SłuchawkiBezPromocji">
        <xsl:text>&#x9;Słuchawki bez promocji</xsl:text>
        <xsl:text>&#xa;&#xa;</xsl:text>
        <xsl:for-each select="/root/SłuchawkiBezPromocji/Słuchawki">
            <xsl:value-of select="concat('&#x9;&#x9;&#x9;', ./Nazwa, '&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Aktualna cena:&#xa;&#x9;', ./AktualnaCena,'&#xa;&#xa;')"/>
			<xsl:value-of select="concat('Waluta:&#xa;&#x9;', ./AktualnaCena/@Waluta,'&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Nazwa marki:&#xa;&#x9;', ./NazwaMarki,'&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Kraj pochodzenia:&#xa;&#x9;', ./KrajPochodzenia,'&#xa;&#xa;')"/>
            <xsl:value-of select="concat('Opis:&#xa;&#x9;', ./Opis,'&#xa;')"/>
            <xsl:text>&#xa;</xsl:text>
            <xsl:text>################################################################################################</xsl:text>
            <xsl:text>&#xa;&#xa;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#xa;&#xa;</xsl:text>

    </xsl:template>

    <xsl:template match="/root/Podsumowanie">
        <xsl:text>&#x9;Podsumowanie</xsl:text>
        <xsl:text>&#xa;&#xa;</xsl:text>

        <xsl:text>&#x9;Typ konstrukcji&#xa;&#xa;</xsl:text>
        <xsl:value-of select="concat('Półotwarte: ', /root/Podsumowanie/TypKonstrukcji/Półotwarte, '&#xa;')"/>
        <xsl:value-of select="concat('Zamknięte: ', /root/Podsumowanie/TypKonstrukcji/Zamknięte, '&#xa;')"/>
        <xsl:text>&#xa;&#xa;</xsl:text>

        <xsl:text>&#x9;Waluta&#xa;&#xa;</xsl:text>
        <xsl:value-of select="concat('Złotówki: ', /root/Podsumowanie/Waluta/złotówki, '&#xa;')"/>
        <xsl:value-of select="concat('Dolary:&#160;&#160; ', /root/Podsumowanie/Waluta/dolary, '&#xa;')"/>
        <xsl:value-of select="concat('Euro:&#160;&#160;&#160;&#160; ', /root/Podsumowanie/Waluta/euro, '&#xa;')"/>
        <xsl:text>&#xa;&#xa;</xsl:text>

        <xsl:text>&#x9;Promocja&#xa;&#xa;</xsl:text>
        <xsl:value-of select="concat('W promocji&#160;&#160;: ', /root/Podsumowanie/Promocja/WPromocji, '&#xa;')"/>
        <xsl:value-of select="concat('Bez promocji: ', /root/Podsumowanie/Promocja/BezPromocji, '&#xa;')"/>
        <xsl:text>&#xa;&#xa;</xsl:text>

        <xsl:text>&#x9;Liczebność produktów wg marki&#xa;&#xa;</xsl:text>
        <xsl:for-each select="/root/Podsumowanie/ProduktyMarek/ProduktyMarki">
            <xsl:value-of select="concat(./@NazwaMarki, ': ', ./., '&#xa;')"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>