<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="xml" encoding="utf-8"/>

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="root"
                                       page-height="297mm" page-width="210mm"
                                       margin-top="20" margin-bottom="40" margin-left="50" margin-right="50">
                    <fo:region-body margin="30,10"/>
                    <fo:region-before extent="5"/>
                    <fo:region-after extent="5"/>
                    <fo:region-start extent="5"/>
                    <fo:region-end extent="5"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="root">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block text-align="center" font-family="Times New Roman" font-size="20px">
                        <xsl:text>Dokument pomocniczy</xsl:text>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center" font-family="Times New Roman" font-size="10px">
                        <xsl:text>strona </xsl:text>
                        <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <xsl:apply-templates select="/root/SłuchawkiWPromocji"/>
                    <xsl:apply-templates select="/root/SłuchawkiBezPromocji"/>
                    <xsl:apply-templates select="/root/Podsumowanie"/>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>


    <xsl:template match="/root/SłuchawkiWPromocji">
        <fo:block page-break-before="always" font-size="16px" text-align="left" font-family="Times New Roman">
            <fo:block text-align="center" margin="20" font-weight="bold">
                <xsl:text>Słuchawki w promocji</xsl:text>
                <xsl:text>&#xD;&#xA;</xsl:text>
            </fo:block>
            <fo:block>
				<fo:block-container display-align="center">
					<fo:table border="solid black" width="100%">
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Nazwa</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Poprzednia cena</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Aktualna cena</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Waluta</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Nazwa marki</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Kraj pochodzenia</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Opis</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>

						<fo:table-body>
							<xsl:for-each select="/root/SłuchawkiWPromocji/Słuchawki">
								<fo:table-row border="solid black">
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./Nazwa"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./PoprzedniaCena"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./AktualnaCena"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./AktualnaCena/@Waluta"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./NazwaMarki"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./KrajPochodzenia"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block text-align="center" font-size="10px">
											<xsl:value-of select="./Opis"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</fo:block-container>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="/root/SłuchawkiBezPromocji">
        <fo:block page-break-before="always" font-size="16px" text-align="left" font-family="Times New Roman">
            <fo:block text-align="center" margin="20" font-weight="bold">
                <xsl:text>Słuchawki bez promocji</xsl:text>
                <xsl:text>&#xD;&#xA;</xsl:text>
            </fo:block>
            <fo:block>
                <fo:block-container display-align="center">
					<fo:table border="solid black" width="100%">
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Nazwa</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Aktualna cena</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Waluta</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Nazwa marki</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Kraj pochodzenia</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black">
									<fo:block font-size="14px" font-weight="bold" text-align="center">Opis</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>

						<fo:table-body>
							<xsl:for-each select="/root/SłuchawkiBezPromocji/Słuchawki">
								<fo:table-row border="solid black">
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./Nazwa"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./AktualnaCena"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./AktualnaCena/@Waluta"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./NazwaMarki"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block font-size="14px" text-align="center">
											<xsl:value-of select="./KrajPochodzenia"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border="solid black">
										<fo:block text-align="center" font-size="10px">
											<xsl:value-of select="./Opis"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</fo:block-container>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="/root/Podsumowanie">
        <fo:block page-break-before="always" font-size="16px" text-align="left" font-family="Times New Roman">
            <fo:block text-align="center" margin="20" font-weight="bold">
                <xsl:text>Podsumowanie</xsl:text>
                <xsl:text>&#xD;&#xA;</xsl:text>
            </fo:block>
        </fo:block>
        <fo:block margin-top="10%" font-size="14px" font-weight="bold" text-align="left" font-family="Times New Roman">
            <xsl:text>Typ konstrukcji:</xsl:text>
        </fo:block>

        <fo:table width="100%" font-size="12px" text-align="left" font-family="Times New Roman">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>

            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            Zamknięte
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            <xsl:value-of select="/root/Podsumowanie/TypKonstrukcji/Zamknięte"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            Półotwarte
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            <xsl:value-of select="/root/Podsumowanie/TypKonstrukcji/Półotwarte"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>

        <fo:block margin-top="10%" font-size="14px" font-weight="bold" text-align="left" font-family="Times New Roman">
            <xsl:text>Waluta:</xsl:text>
        </fo:block>

        <fo:table width="100%" font-size="12px" text-align="left" font-family="Times New Roman">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>

            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            Złotówki
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            <xsl:value-of select="/root/Podsumowanie/Waluta/złotówki"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            Dolary
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            <xsl:value-of select="/root/Podsumowanie/Waluta/dolary"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            Euro
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            <xsl:value-of select="/root/Podsumowanie/Waluta/euro"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>

        <fo:block margin-top="10%" font-size="14px" font-weight="bold" text-align="left" font-family="Times New Roman">
            <xsl:text>Promocja:</xsl:text>
        </fo:block>

        <fo:table width="100%" font-size="12px" text-align="left" font-family="Times New Roman">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>

            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            W promocji
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            <xsl:value-of select="/root/Podsumowanie/Promocja/WPromocji"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            Bez promocji
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block text-align="left">
                            <xsl:value-of select="/root/Podsumowanie/Promocja/BezPromocji"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>

        <fo:block margin-top="10%" font-size="14px" font-weight="bold" text-align="left" font-family="Times New Roman">
            <xsl:text>Marki:</xsl:text>
        </fo:block>

        <fo:table width="100%" font-size="12px" text-align="left" font-family="Times New Roman">
            <fo:table-header>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>

            <fo:table-body>
                <xsl:for-each select="/root/Podsumowanie/ProduktyMarek/ProduktyMarki">
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block text-align="left">
                                <xsl:value-of select="./@NazwaMarki"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block text-align="left">
                                <xsl:value-of select="./."/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>


</xsl:stylesheet>


