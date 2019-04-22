<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:date="http://exslt.org/dates-and-times" xmlns:xs="http://www.w3.org/1999/XSL/Transform"
                extension-element-prefixes="date">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" media-type="text/xml" omit-xml-declaration="no"
                indent="yes"/>


    <xsl:key use="@id_przedmiotu" name="PrzedmiotyKey" match="/zawartość/listaPrzedmiotów/przedmiot"/>
    <xsl:key use="@id_marki" name="MarkiKey" match="/zawartość/marki/marka"/>


    <xsl:template match="/">
        <xsl:element name="root">
            <xsl:element name="SłuchawkiWPromocji">
                <xsl:apply-templates select="/zawartość/listaPrzedmiotów/przedmiot[cena/@promocja='TAK']">
                    <xsl:sort select="nazwa"/>
                </xsl:apply-templates>
            </xsl:element>
            <xsl:element name="SłuchawkiBezPromocji">
                <xsl:apply-templates select="/zawartość/listaPrzedmiotów/przedmiot[cena/@promocja='NIE']">
                    <xsl:sort select="nazwa"/>
                </xsl:apply-templates>
            </xsl:element>
            <Podsumowanie>
                <TypKonstrukcji>
                    <Półotwarte>
                        <xsl:value-of
                                select="count(/zawartość/listaPrzedmiotów/przedmiot[typKonstrukcji='Nauszne półotwarte'])"/>
                    </Półotwarte>
                    <Zamknięte>
                        <xsl:value-of
                                select="count(/zawartość/listaPrzedmiotów/przedmiot[typKonstrukcji='Nauszne zamknięte'])"/>
                    </Zamknięte>
                </TypKonstrukcji>
                <Waluta>
                    <złotówki>
                        <xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot/cena[@waluta='zł'])"/>
                    </złotówki>
                    <dolary>
                        <xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot/cena[@waluta='$'])"/>
                    </dolary>
                    <euro>
                        <xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot/cena[@waluta='€'])"/>
                    </euro>
                </Waluta>
                <Promocja>
                    <WPromocji>
                        <xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot/cena[@promocja='TAK'])"/>
                    </WPromocji>
                    <BezPromocji>
                        <xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot/cena[@promocja='NIE'])"/>
                    </BezPromocji>
                </Promocja>
                <ProduktyMarek>
                    <Razer><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='razer'])"/></Razer>
                    <ISK><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='isk'])"/></ISK>
                    <SteelSeries><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='steelseries'])"/></SteelSeries>
                    <Creative><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='creative'])"/></Creative>
                    <Hyperx><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='hyperx'])"/></Hyperx>
                    <Corsair><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='corsair'])"/></Corsair>
                    <Lioncast><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='lioncast'])"/></Lioncast>
                    <SuperLux><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='superlux'])"/></SuperLux>
                    <Philips><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='philips'])"/></Philips>
                    <JBL><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='jbl'])"/></JBL>
                    <Pioneer><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='pioneer'])"/></Pioneer>
                    <SpeedLink><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='speedlink'])"/></SpeedLink>
                    <HP><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='hp'])"/></HP>
                    <AudioTechnica><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='audiotechnica'])"/></AudioTechnica>
                    <Marshall><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='marshall'])"/></Marshall>
                    <Patriot><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='patriot'])"/></Patriot>
                    <Logitech><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID='logitech'])"/></Logitech>
                </ProduktyMarek>
                <DługośćKabla>
                    <Krótkie><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[długośćKabla&lt;'1.5'])"/></Krótkie>
                    <Długie><xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot) - count(/zawartość/listaPrzedmiotów/przedmiot[długośćKabla&lt;'1.5'])"/></Długie>
                </DługośćKabla>
            </Podsumowanie>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/zawartość/listaPrzedmiotów/przedmiot[cena/@promocja='TAK']">
        <xsl:element name="słuchawki">
            <xsl:element name="Nazwa">
                <xsl:value-of select="nazwa"/>
            </xsl:element>
            <xsl:element name="PoprzedniaCena">
                <xsl:value-of select="concat(cena,' ', cena/@waluta)"/>
            </xsl:element>
            <xsl:element name="AktualnaCena">
                <xsl:value-of
                        select='concat(format-number((cena * ((100 - cena/@rabat) div 100)),"#.00")," ", cena/@waluta)'/>
            </xsl:element>
            <xsl:variable name="Marka" select="key('MarkiKey', @markaID)"></xsl:variable>
            <xsl:element name="NazwaMarki">
                <xsl:value-of select="$Marka/@id_marki"/>
            </xsl:element>
            <xsl:element name="KrajPochodzenia">
                <xsl:value-of select="$Marka/@krajPochodzenia"/>
            </xsl:element>
            <xsl:element name="Opis">
                <xsl:value-of
                        select="concat('Słuchawki ', nazwa, ' to słuchawki ', typKonstrukcji, '. Pasmo przenoszenia od ', pasmoPrzenoszeniaSłuchawek/minimum, ' ', pasmoPrzenoszeniaSłuchawek/minimum/@jednostka, ' do ', pasmoPrzenoszeniaSłuchawek/maximum, ' ', pasmoPrzenoszeniaSłuchawek/maximum/@jednostka, '. Impedancja wynosi ', impedancjaSłuchawek, ' ',impedancjaSłuchawek/@jednostka, ', czułość ', czułośćSłuchawek, czułośćSłuchawek/@jednostka, ', koloru ', kolor, ', posiadają kabel długości ', długośćKabla, ' ', długośćKabla/@jednostka, '. Wbudowany mikrofon: ', wbudowanyMikrofon)"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/zawartość/listaPrzedmiotów/przedmiot[cena/@promocja='NIE']">
        <xsl:element name="Słuchawki">
            <xsl:element name="Nazwa">
                <xsl:value-of select="nazwa"/>
            </xsl:element>
            <xsl:element name="AktualnaCena">
                <xsl:value-of select="concat(cena,' ', cena/@waluta)"/>
            </xsl:element>
            <xsl:variable name="Marka" select="key('MarkiKey', @markaID)"></xsl:variable>
            <xsl:element name="NazwaMarki">
                <xsl:value-of select="$Marka/@id_marki"/>
            </xsl:element>
            <xsl:element name="KrajPochodzenia">
                <xsl:value-of select="$Marka/@krajPochodzenia"/>
            </xsl:element>
            <xsl:element name="Opis">
                <xsl:value-of
                        select="concat('Słuchawki ', nazwa, ' to słuchawki ', typKonstrukcji, '. Pasmo przenoszenia od ', pasmoPrzenoszeniaSłuchawek/minimum, ' ', pasmoPrzenoszeniaSłuchawek/minimum/@jednostka, ' do ', pasmoPrzenoszeniaSłuchawek/maximum, ' ', pasmoPrzenoszeniaSłuchawek/maximum/@jednostka, '. Impedancja wynosi ', impedancjaSłuchawek, ' ',impedancjaSłuchawek/@jednostka, ', czułość ', czułośćSłuchawek, czułośćSłuchawek/@jednostka, ', koloru ', kolor, ', posiadają kabel długości ', długośćKabla, ' ', długośćKabla/@jednostka, '. Wbudowany mikrofon: ', wbudowanyMikrofon)"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>


</xsl:stylesheet>