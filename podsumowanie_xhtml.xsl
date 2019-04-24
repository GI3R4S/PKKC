<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" version="1.0" encoding="utf-8"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="/">
        <xsl:element name="html">
            <xsl:copy-of select="document('')/xsl:stylesheet/namespace::*[not(local-name() = 'xsl')]"/>
            <xsl:attribute name="xml:lang">pl</xsl:attribute>
            <xsl:attribute name="lang">pl</xsl:attribute>

            <xsl:element name="head">
                <xsl:element name="meta">
                    <xsl:attribute name="name">
                        <xsl:text>description</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:text>Uproszczony wykaz </xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="meta">
                    <xsl:attribute name="name">
                        <xsl:text>author</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:text>Dawid Gierowski, Marcin Kwapisz</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="meta">
                    <xsl:attribute name="http-equiv">
                        <xsl:text>content-type</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:text>text/html;charset=UTF-8</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="title">
                    <xsl:text>Raport XHTML</xsl:text>
                </xsl:element>
            </xsl:element>

            <xsl:element name="body">
                <xsl:apply-templates select="/root/SłuchawkiWPromocji"/>
                <xsl:apply-templates select="/root/SłuchawkiBezPromocji"/>
                <xsl:apply-templates select="/root/Podsumowanie"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/root/SłuchawkiWPromocji">
        <xsl:element name="div">
            <xsl:attribute name="class">
                <xsl:text>słuchawkiWPromocji</xsl:text>
            </xsl:attribute>
            <xsl:element name="h1">
                <xsl:text>Słuchawki w promocji</xsl:text>
            </xsl:element>
            <xsl:element name="table">
                <xsl:attribute name="border">
                    <xsl:text>1</xsl:text>
                </xsl:attribute>
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>Nazwa</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>PoprzedniaCena</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>AktualnaCena</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>NazwaMarki</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>KrajPochodzenia</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Opis</xsl:text>
                    </xsl:element>
                </xsl:element>

                <xsl:for-each select="/root/SłuchawkiWPromocji/Słuchawki">
                    <xsl:element name="tr">
                        <xsl:element name="td">
                            <xsl:value-of select="./Nazwa"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./PoprzedniaCena"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./AktualnaCena"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./NazwaMarki"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./KrajPochodzenia"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./Opis"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/root/SłuchawkiBezPromocji">
        <xsl:element name="div">
            <xsl:element name="h1">
                <xsl:text>Słuchawki bez promocji</xsl:text>
            </xsl:element>
            <xsl:element name="table">
                <xsl:attribute name="border">
                    <xsl:text>1</xsl:text>
                </xsl:attribute>
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>Nazwa</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>AktualnaCena</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>NazwaMarki</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>KrajPochodzenia</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Opis</xsl:text>
                    </xsl:element>
                </xsl:element>

                <xsl:for-each select="/root/SłuchawkiBezPromocji/Słuchawki">
                    <xsl:element name="tr">
                        <xsl:element name="td">
                            <xsl:value-of select="./Nazwa"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./AktualnaCena"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./NazwaMarki"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./KrajPochodzenia"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./Opis"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/root/Podsumowanie">
        <xsl:element name="div">
            <xsl:element name="h1">
                <xsl:text>Podsumowanie</xsl:text>
            </xsl:element>


            <xsl:text>Typ konstrukcji</xsl:text>
            <xsl:element name="ul">
                <xsl:element name="li">
                    <xsl:text>Półotwarte:   </xsl:text>
                    <xsl:value-of select="/root/Podsumowanie/TypKonstrukcji/Półotwarte"/>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:text>Zamknięte:    </xsl:text>
                    <xsl:value-of select="/root/Podsumowanie/TypKonstrukcji/Zamknięte"/>
                </xsl:element>
            </xsl:element>

            <xsl:text>Waluta</xsl:text>
            <xsl:element name="ul">
                <xsl:element name="li">
                    <xsl:text>Złotówki:   </xsl:text>
                    <xsl:value-of select="/root/Podsumowanie/Waluta/złotówki"/>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:text>Dolary:    </xsl:text>
                    <xsl:value-of select="/root/Podsumowanie/Waluta/dolary"/>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:text>Euro:    </xsl:text>
                    <xsl:value-of select="/root/Podsumowanie/Waluta/euro"/>
                </xsl:element>
            </xsl:element>

            <xsl:text>Promocja</xsl:text>
            <xsl:element name="ul">
                <xsl:element name="li">
                    <xsl:text>W promocji:   </xsl:text>
                    <xsl:value-of select="/root/Podsumowanie/Promocja/WPromocji"/>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:text>Bez promocji:    </xsl:text>
                    <xsl:value-of select="/root/Podsumowanie/Promocja/BezPromocji"/>
                </xsl:element>
            </xsl:element>

            <xsl:text>Produkty marek</xsl:text>
            <xsl:element name="ul">
                <xsl:for-each select="/root/Podsumowanie/ProduktyMarek/ProduktyMarki">
                    <xsl:element name="li">
                        <xsl:value-of select="./@NazwaMarki"/>
                        <xsl:text>:     </xsl:text>
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>
