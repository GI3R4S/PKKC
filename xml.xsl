<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
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
                    <xsl:for-each select="/zawartość/marki/marka">
                        <xsl:element name="ProduktyMarki">
                            <xsl:attribute name="NazwaMarki">
                                <xsl:value-of select="./."/>
                            </xsl:attribute>
                            <xsl:variable name="id_marki">
                                <xsl:value-of select="./@id_marki"/>
                            </xsl:variable>
                            <xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[@markaID=$id_marki])"/>
                        </xsl:element>
                    </xsl:for-each>
                </ProduktyMarek>
                <DługośćKabla>
                    <Krótkie>
                        <xsl:value-of select="count(/zawartość/listaPrzedmiotów/przedmiot[długośćKabla&lt;'1.5'])"/>
                    </Krótkie>
                    <Długie>
                        <xsl:value-of
                                select="count(/zawartość/listaPrzedmiotów/przedmiot) - count(/zawartość/listaPrzedmiotów/przedmiot[długośćKabla&lt;'1.5'])"/>
                    </Długie>
                </DługośćKabla>
                <DataWygenerowania>
                    <xsl:value-of select="current-dateTime()"/>
                </DataWygenerowania>
				<ŚredniaCena>
					<Złotówki>
						<xsl:value-of select="format-number((sum(/zawartość/listaPrzedmiotów/przedmiot/cena[@waluta='zł'and @promocja='NIE']) 
												div count(/zawartość/listaPrzedmiotów/przedmiot/cena[@waluta='zł'and @promocja='NIE'])), '#.00')"/>
					</Złotówki>
					<Euro>
						<xsl:value-of select="sum(/zawartość/listaPrzedmiotów/przedmiot/cena[@waluta='€' and @promocja='NIE']) 
												div count(/zawartość/listaPrzedmiotów/przedmiot/cena[@waluta='€'and @promocja='NIE'])"/>
					</Euro>
					<Dolary>
						<xsl:value-of select="sum(/zawartość/listaPrzedmiotów/przedmiot/cena[@waluta='$'and @promocja='NIE']) 
												div count(/zawartość/listaPrzedmiotów/przedmiot/cena[@waluta='$'and @promocja='NIE'])"/>
					</Dolary>

				</ŚredniaCena>
				
				
            </Podsumowanie>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/zawartość/listaPrzedmiotów/przedmiot[cena/@promocja='TAK']">
        <xsl:element name="Słuchawki">
            <xsl:element name="Nazwa">
                <xsl:value-of select="nazwa"/>
            </xsl:element>
            <xsl:element name="PoprzedniaCena">
				<xsl:attribute name="Waluta">
					<xsl:value-of select="cena/@waluta"/>
				</xsl:attribute>
                <xsl:value-of select="cena"/>
            </xsl:element>
            <xsl:element name="AktualnaCena">
				<xsl:attribute name="Waluta">
					<xsl:value-of select="cena/@waluta"/>
				</xsl:attribute>
                <xsl:value-of
                        select='format-number((cena * ((100 - cena/@rabat) div 100)),"#.00")'/>
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
				<xsl:attribute name="Waluta">
					<xsl:value-of select="cena/@waluta"/>
				</xsl:attribute>
                <xsl:value-of select="cena"/>
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