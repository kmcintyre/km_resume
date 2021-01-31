<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>

  <xsl:variable name="image_folder" select="'/Users/vn50qos/km_resume/in/images/'" />

  <xsl:template match="resume">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simple" page-height="11in" page-width="8.5in" margin-top="1in" margin-bottom="1in" margin-left="1in" margin-right="1in">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="simple">
        <fo:flow flow-name="xsl-region-body">
		<fo:block font-size="10pt" font-family="Times">

		<fo:table table-layout="fixed">
			<fo:table-column column-width="4.5in"/>
			  <fo:table-column column-width="2.0in"/>

            <fo:table-body>
		    <fo:table-row>
				<fo:table-cell border-style="solid" border-right="0" border-left="0" border-top="0" border-bottom="0">
					<fo:block margin-top="58">
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<xsl:apply-templates select="contact"/>
				</fo:table-cell>
			</fo:table-row>
		    <fo:table-row>
				<fo:table-cell number-columns-spanned="2">
					<xsl:apply-templates select="header"/>
				</fo:table-cell>
			</fo:table-row>
		  </fo:table-body>
      	</fo:table>
		</fo:block>
		</fo:flow>
      </fo:page-sequence>

    </fo:root>
  </xsl:template>

  <xsl:template match="br">
    <fo:block margin-left="10" padding-top="8">
    </fo:block>
  </xsl:template>

  <xsl:template match="header">
	<fo:block margin-left="10">
		<fo:block padding-top="10" padding-bottom="3" margin-left="10" margin-right="20">
		  	<xsl:apply-templates select="*"/>
	  	</fo:block>
	</fo:block>
  </xsl:template>

  <xsl:template match="contact">
					<fo:block text-align="center" margin-right="15">
				        <fo:block line-height="1.75" font-weight="bold">
				          <xsl:value-of select="name"/>
				        </fo:block>
				        <fo:block>
				          <xsl:value-of select="address1"/>
				        </fo:block>
				        <fo:block>
				          <xsl:value-of select="address2"/>
				        </fo:block>
				        <fo:block>
				          <xsl:value-of select="phone"/>
				        </fo:block>
				        <fo:block>
						<fo:basic-link external-destination="url('mailto:kevin70@yahoo.com')"
				               text-decoration="underline"
				               color="blue">
					          <xsl:value-of select="email"/>
						</fo:basic-link>
				        </fo:block>
					</fo:block>
  </xsl:template>

  <xsl:template match="linkto">
		<fo:basic-link>
			<xsl:attribute name="external-destination">url('https://<xsl:value-of
				select="@url" />')</xsl:attribute>
			<fo:inline color="#0000CC">
				<xsl:value-of select="." />
			</fo:inline>
		</fo:basic-link>
	</xsl:template>

</xsl:stylesheet>
