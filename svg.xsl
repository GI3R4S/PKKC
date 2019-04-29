<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="1.0"
                xmlns:xlink="http://www.w3.org/1999/xlink">

    <xsl:output method="xml" media-type="image/svg" encoding="utf-8" doctype-public="-//W3C//DTD SVG 1.1//EN"
                doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>

    <xsl:template match="/">
        <svg:svg width="940" height="600" font-family="Calibri">
            <svg:desc>Sklep ze słuchawkami statystyki</svg:desc>
            <defs>
                <linearGradient id="grad1" x1="0%" y1="0%" x2="0%" y2="100%">
                    <stop offset="0%" style="stop-color:rgb(255,240,220);stop-opacity:1"/>
                    <stop offset="100%" style="stop-color:rgb(235,220,200);stop-opacity:1"/>
                </linearGradient>
            </defs>

            <svg:rect x="3" y="3" width="934" height="594" fill="url(#grad1)" stroke="black" stroke-width="3"/>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOverNameTypKonstrukcji(evt) {
                        var numbers = document.getElementById("typKonstrukcji");
                        numbers.setAttribute("visibility", "visible");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOutNameTypKonstrukcji(evt) {
                        var numbers = document.getElementById("typKonstrukcji");
                        numbers.setAttribute("visibility", "hidden");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOverNameWaluta(evt) {
                        var numbers = document.getElementById("waluta");
                        numbers.setAttribute("visibility", "visible");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOutNameWaluta(evt) {
                        var numbers = document.getElementById("waluta");
                        numbers.setAttribute("visibility", "hidden");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOverNamePromocja(evt) {
                        var numbers = document.getElementById("promocja");
                        numbers.setAttribute("visibility", "visible");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOutNamePromocja(evt) {
                        var numbers = document.getElementById("promocja");
                        numbers.setAttribute("visibility", "hidden");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOverNameMarki(evt) {
                        var numbers = document.getElementById("marki");
                        numbers.setAttribute("visibility", "visible");
                    }]]>
            </script>

            <script type="text/ecmascript">
                <![CDATA[
                    function onMouseOutNameMarki(evt) {
                        var numbers = document.getElementById("marki");
                        numbers.setAttribute("visibility", "hidden");
                    }]]>
            </script>

            <svg:text x="50%" y="20" font-size="24" fill="black" font-weight="bold" text-anchor="middle">
                Sklep ze słuchawkami statystyki
            </svg:text>

            <xsl:apply-templates select="/root/Podsumowanie"/>
        </svg:svg>
    </xsl:template>

    <xsl:template match="/root/Podsumowanie">
        <svg:text id="typKonstrukcjiText" x="120" y="68" font-size="18" fill="black" font-weight="bold" text-anchor="middle" onmouseover="onMouseOverNameTypKonstrukcji(evt)"
                  onmouseout="onMouseOutNameTypKonstrukcji(evt)"
        >Typ konstrukcji
        </svg:text>
        <svg:g id="typKonstrukcji" visibility="hidden">
            <svg:rect x="8" y="90" height="160" width="200" fill="none" stroke="black" stroke-width="4"/>
            <svg:text x="60" y="240" font-size="16" fill="black" font-weight="bold" text-anchor="middle">Półotwarte
            </svg:text>
            <svg:text x="160" y="240" font-size="16" fill="black" font-weight="bold" text-anchor="middle">Zamknięty
            </svg:text>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="0"/>
                    <xsl:value-of select="50+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/TypKonstrukcji/Półotwarte"/>
                    <xsl:value-of select="220 - $ile * 5 - 5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>black</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="/root/Podsumowanie/TypKonstrukcji/Półotwarte"/>
            </xsl:element>
            <svg:rect>
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="0"/>
                    <xsl:value-of select="50 + (100 * $poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/TypKonstrukcji/Półotwarte"/>
                    <xsl:value-of select="220 - $ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    10
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:variable name="ile" select="/root/Podsumowanie/TypKonstrukcji/Półotwarte"/>
                    <xsl:value-of select="$ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    fill:black
                </xsl:attribute>
            </svg:rect>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="1"/>
                    <xsl:value-of select="50+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/TypKonstrukcji/Zamknięte"/>
                    <xsl:value-of select="220 - $ile * 5 - 5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>black</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="/root/Podsumowanie/TypKonstrukcji/Zamknięte"/>
            </xsl:element>
            <svg:rect>
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="1"/>
                    <xsl:value-of select="50+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/TypKonstrukcji/Zamknięte"/>
                    <xsl:value-of select="220 - $ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    10
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:variable name="ile" select="/root/Podsumowanie/TypKonstrukcji/Zamknięte"/>
                    <xsl:value-of select="$ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    fill:black
                </xsl:attribute>
            </svg:rect>
        </svg:g>

        <svg:text id="walutaText" x="400" y="68" font-size="18" fill="black" font-weight="bold" text-anchor="middle" onmouseover="onMouseOverNameWaluta(evt)"
                  onmouseout="onMouseOutNameWaluta(evt)">Waluta
        </svg:text>
        <svg:g id="waluta" visibility="hidden" >
            <svg:rect x="260" y="90" height="160" width="280" fill="none" stroke="black" stroke-width="4"/>
            <svg:text x="300" y="240" font-size="16" fill="black" font-weight="bold" text-anchor="middle">Złotówki
            </svg:text>
            <svg:text x="400" y="240" font-size="16" fill="black" font-weight="bold" text-anchor="middle">Dolary
            </svg:text>
            <svg:text x="500" y="240" font-size="16" fill="black" font-weight="bold" text-anchor="middle">Euro
            </svg:text>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="0"/>
                    <xsl:value-of select="300+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Waluta/złotówki"/>
                    <xsl:value-of select="220 - $ile * 5 - 5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>black</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="/root/Podsumowanie/Waluta/złotówki"/>
            </xsl:element>
            <svg:rect>
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="0"/>
                    <xsl:value-of select="300+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Waluta/złotówki"/>
                    <xsl:value-of select="220 - $ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    10
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Waluta/złotówki"/>
                    <xsl:value-of select="$ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    fill:black
                </xsl:attribute>
            </svg:rect>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="1"/>
                    <xsl:value-of select="300+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Waluta/dolary"/>
                    <xsl:value-of select="220 - $ile * 5 - 5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>black</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="/root/Podsumowanie/Waluta/dolary"/>
            </xsl:element>
            <svg:rect>
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="1"/>
                    <xsl:value-of select="300+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Waluta/dolary"/>
                    <xsl:value-of select="220 - $ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    10
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Waluta/dolary"/>
                    <xsl:value-of select="$ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    fill:black
                </xsl:attribute>
            </svg:rect>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="2"/>
                    <xsl:value-of select="300+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Waluta/euro"/>
                    <xsl:value-of select="220 - $ile * 5 - 5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>black</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="/root/Podsumowanie/Waluta/euro"/>
            </xsl:element>
            <svg:rect>
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="2"/>
                    <xsl:value-of select="300+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Waluta/euro"/>
                    <xsl:value-of select="220 - $ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    10
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Waluta/euro"/>
                    <xsl:value-of select="$ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    fill:black
                </xsl:attribute>
            </svg:rect>
        </svg:g>

        <svg:text id="promocjaText" x="750" y="68" font-size="18" fill="black" font-weight="bold" text-anchor="middle" onmouseover="onMouseOverNamePromocja(evt)"
                  onmouseout="onMouseOutNamePromocja(evt)">Promocja
        </svg:text>
        <svg:g id="promocja" visibility="hidden">
            <svg:rect x="650" y="90" height="160" width="200" fill="none" stroke="black" stroke-width="4"/>
            <svg:text x="700" y="240" font-size="16" fill="black" font-weight="bold" text-anchor="middle">Promocyjne
            </svg:text>
            <svg:text x="800" y="240" font-size="16" fill="black" font-weight="bold" text-anchor="middle">Bez promocji
            </svg:text>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="0"/>
                    <xsl:value-of select="700+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Promocja/WPromocji"/>
                    <xsl:value-of select="220 - $ile * 5 - 5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>black</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="/root/Podsumowanie/Promocja/WPromocji"/>
            </xsl:element>
            <svg:rect>
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="0"/>
                    <xsl:value-of select="700+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Promocja/WPromocji"/>
                    <xsl:value-of select="220 - $ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    10
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Promocja/WPromocji"/>
                    <xsl:value-of select="$ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    fill:black
                </xsl:attribute>
            </svg:rect>
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="1"/>
                    <xsl:value-of select="700+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Promocja/BezPromocji"/>
                    <xsl:value-of select="220 - $ile * 5 - 5"/>
                </xsl:attribute>
                <xsl:attribute name="fill">
                    <xsl:text>black</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="font-size">
                    <xsl:text>16</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="/root/Podsumowanie/Promocja/BezPromocji"/>
            </xsl:element>
            <svg:rect>
                <xsl:attribute name="x">
                    <xsl:variable name="poz" select="1"/>
                    <xsl:value-of select="700+(100*$poz)"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Promocja/BezPromocji"/>
                    <xsl:value-of select="220 - $ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="width">
                    10
                </xsl:attribute>
                <xsl:attribute name="height">
                    <xsl:variable name="ile" select="/root/Podsumowanie/Promocja/BezPromocji"/>
                    <xsl:value-of select="$ile * 5"/>
                </xsl:attribute>
                <xsl:attribute name="style">
                    fill:black
                </xsl:attribute>
            </svg:rect>
        </svg:g>

        <svg:text id="markiText" x="450" y="290" font-size="18" fill="black" font-weight="bold" text-anchor="middle" onmouseover="onMouseOverNameMarki(evt)"
                  onmouseout="onMouseOutNameMarki(evt)">Marki
        </svg:text>
        <svg:g id="marki" visibility="hidden">
            <svg:rect x="4" y="296" height="280" width="932" fill="none" stroke="black" stroke-width="4"/>
            <xsl:for-each select="/root/Podsumowanie/ProduktyMarek/ProduktyMarki">
                <xsl:variable name="i" select="position()"/>
                <xsl:element name="svg:text">
                    <xsl:attribute name="x">
                        <xsl:value-of select="5 + 56 * $i - 56"/>
                    </xsl:attribute>
                    <xsl:attribute name="y">
                        570
                    </xsl:attribute>
                    <xsl:attribute name="font-size">9</xsl:attribute>
                    <xsl:attribute name="fill">black</xsl:attribute>
                    <xsl:attribute name="font-weight">bold</xsl:attribute>
                    <xsl:attribute name="text-anchor">left</xsl:attribute>
                    <xsl:value-of select="./@NazwaMarki"/>
                </xsl:element>

                <xsl:element name="svg:text">
                    <xsl:attribute name="x">
                        <xsl:value-of select="15 + 56 * $i - 56"/>
                    </xsl:attribute>
                    <xsl:attribute name="y">
                        <xsl:variable name="ile" select="./."/>
                        <xsl:value-of select="550 - $ile * 60 - 5"/>
                    </xsl:attribute>
                    <xsl:attribute name="fill">
                        <xsl:text>black</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="font-size">
                        <xsl:text>9</xsl:text>
                    </xsl:attribute>
                    <xsl:attribute name="text-anchor">middle</xsl:attribute>
                    <xsl:value-of select="./."/>
                </xsl:element>

                <svg:rect>
                    <xsl:attribute name="x">
                        <xsl:value-of select="10 + 56 * $i - 56"/>
                    </xsl:attribute>
                    <xsl:attribute name="y">
                        <xsl:variable name="ile" select="./."/>
                        <xsl:value-of select="550 - $ile * 60"/>
                    </xsl:attribute>
                    <xsl:attribute name="width">
                        10
                    </xsl:attribute>
                    <xsl:attribute name="height">
                        <xsl:variable name="ile" select="./."/>
                        <xsl:value-of select="$ile * 60"/>
                    </xsl:attribute>
                    <xsl:attribute name="style">
                        fill:black
                    </xsl:attribute>
                </svg:rect>
            </xsl:for-each>
        </svg:g>

    </xsl:template>
</xsl:stylesheet>