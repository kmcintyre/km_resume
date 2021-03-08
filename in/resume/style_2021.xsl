<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">

	<xsl:variable name="image_folder" select="'images_folder'" />

	<xsl:output method="xml" version="1.0" omit-xml-declaration="no"
		indent="yes" />

	<xsl:template match="resume">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" >
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simple"
					page-height="11in" page-width="8.5in" margin-top=".75in"
					margin-bottom=".75in" margin-left=".75in" margin-right=".75in">
					<fo:region-body />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<fo:page-sequence master-reference="simple">
				<fo:flow flow-name="xsl-region-body">
					<fo:block font-size="11pt" font-family="Helvetica">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="2.0in" />
							<fo:table-column column-width="5.0in" />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<xsl:apply-templates select="contact" />
										<xsl:apply-templates select="skill" />
									</fo:table-cell>
									<fo:table-cell>
										<fo:block margin-top="25" margin-left="20" margin-right="20" margin-bottom="20">
											<xsl:apply-templates select="header" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
						<fo:table table-layout="fixed">
							<fo:table-column column-width="7in" />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block line-height="2.4" letter-spacing="3pt">
											Career Highlights
										</fo:block>
										<xsl:apply-templates select="highlight"/>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block line-height="2.4" letter-spacing="3pt">
											Timeline
										</fo:block>
										<xsl:apply-templates select="job" />
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell padding-top="20px">
										<fo:block line-height="2.0" letter-spacing="3pt">
											Education
										</fo:block>
										<fo:table table-layout="fixed">
											<fo:table-column column-width="2.333in" />
											<fo:table-column column-width="2.333in" />
											<fo:table-column column-width="2.333in" />
											<fo:table-body>
												<fo:table-row>
													<fo:table-cell>
														<fo:block font-weight="bold">
															BS in Mathematics
														</fo:block>
													</fo:table-cell>
													<fo:table-cell text-align="center">
														<fo:block>
															University California, San Diego
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
											</fo:table-body>
										</fo:table>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="header">
		<fo:block margin-left="20" margin-bottom="5">
			<fo:block line-height="2.4" letter-spacing="3pt">
				<xsl:value-of select="@title" />
			</fo:block>
			<xsl:apply-templates select="*" />
		</fo:block>
	</xsl:template>

	<xsl:template match="skill">
		<fo:block text-align="left" margin-left="0" padding-left="5" padding-right="10" border-left="0"
			border-style="solid" border-right-width="1" border-right-style="solid" border-top="0"
			border-bottom="0">
			<fo:block font-weight="bold" line-height="1.50" font-size="11.5pt">
				<xsl:value-of select="@title" />
			</fo:block>
			<fo:block margin-left="10" margin-right="10" font-size="10.1pt">
				<xsl:value-of select="list" />
			</fo:block>
		</fo:block>
	</xsl:template>

	<xsl:template match="job">
		<fo:block text-align="justify" line-height="1.18" padding-top="3" margin-right="14" margin-left="2">
			<xsl:apply-templates select="*"/>
		</fo:block>
	</xsl:template>

  <xsl:template match="tenure">
	<fo:block padding-top="5px" padding-bottom="10px">
		<fo:table table-layout="fixed">
			<fo:table-column column-width="1in" />
			<fo:table-column column-width="2.75in" />
			<fo:table-column column-width="2.25in" />
			<fo:table-column column-width="1in" />
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell display-align="center">
						<fo:block font-weight="lighter">
							<xsl:value-of select="begin"/>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block font-style="italic">
							<fo:external-graphic
								height=".4in"
								width=".4in"
								content-height="scale-to-fit"
								content-width="scale-to-fit"
								vertical-align="middle"
								padding-right="8px"
								>
								<xsl:attribute name="src">
									url(file://<xsl:value-of select="$image_folder"/><xsl:value-of select="@image" />)
								</xsl:attribute>
							</fo:external-graphic>
							<xsl:value-of select="company" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell display-align="center">
						<fo:block font-weight="bold">
							<xsl:value-of select="title" />
						</fo:block>
					</fo:table-cell>
					<fo:table-cell display-align="center">
						<fo:block font-weight="lighter">
							<xsl:value-of select="end"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</fo:block>
	</xsl:template>

	<xsl:template match="url">
		<fo:block>
			<fo:basic-link text-decoration="underline" color="#0000CC">
				<xsl:attribute name="external-destination">url('http://<xsl:value-of
					select="." />')</xsl:attribute>
				<xsl:value-of select="." />
			</fo:basic-link>
		</fo:block>
	</xsl:template>

	<xsl:template match="contact">
		<fo:block text-align="center">
			<fo:external-graphic
				height="2cm" width="2cm"
				content-height="scale-to-fit" content-width="scale-to-fit">
				<xsl:attribute name="src">
					url(file://<xsl:value-of select="$image_folder"/>me.png)
				</xsl:attribute>
			</fo:external-graphic>
		</fo:block>
		<fo:block text-align="center" padding-bottom="4" padding-top="4">
			<fo:block line-height="2" font-weight="bold">
				<xsl:value-of select="name" />
			</fo:block>
			<fo:block font-size="10.1pt">
				<xsl:value-of select="address"/>
			</fo:block>
			<fo:block font-size="10.1pt">
				<xsl:value-of select="address2"/>
			</fo:block>
			<fo:block font-size="10.1pt">
				<xsl:value-of select="phone"/>
			</fo:block>
			<fo:block  font-size="10.1pt">
			</fo:block>
			<fo:block font-size="10.1pt" padding-top="5" padding-left="2" padding-right="2">
				<fo:basic-link
					external-destination="url('mailto:kevin70@yahoo.com')">
					<fo:external-graphic
						padding-right="2.5"
						padding-left="2.5"
						height=".6cm" width=".6cm"
						content-height="scale-to-fit" content-width="scale-to-fit"
						>
						<xsl:attribute name="src">
							url(file://<xsl:value-of select="$image_folder"/>email.png)
						</xsl:attribute>
					</fo:external-graphic>
				</fo:basic-link>
				<fo:basic-link
					external-destination="url('http://www.linkedin.com/in/kmsoftware/')">
					<fo:external-graphic
						padding-right="2.5"
						padding-left="2.5"
						height=".6cm" width=".6cm"
						content-height="scale-to-fit" content-width="scale-to-fit"
						>
						<xsl:attribute name="src">
							url(file://<xsl:value-of select="$image_folder"/>linkedin.png)
						</xsl:attribute>
					</fo:external-graphic>
				</fo:basic-link>
				<fo:basic-link
					external-destination="url('http://github.com/kmcintyre')">
					<fo:external-graphic
						padding-right="2.5"
						padding-left="2.5"
						height=".6cm" width=".6cm"
						content-height="scale-to-fit" content-width="scale-to-fit"
						>
						<xsl:attribute name="src">
							url(file://<xsl:value-of select="$image_folder"/>github.png)
						</xsl:attribute>
					</fo:external-graphic>
				</fo:basic-link>
			</fo:block>
			<fo:block  font-size="10.1pt" padding-bottom="10">
				<fo:basic-link padding-left=".5mm" external-destination="url('http://www.linkedin.com/in/kmsoftware')"
					text-decoration="underline" color="#0000CC" >
					<xsl:value-of select="linkedin" />
				</fo:basic-link>
			</fo:block>
		</fo:block>
	</xsl:template>

	<xsl:template match="highlight">
		<fo:table table-layout="fixed">
			<fo:table-column column-width="1.0in" />
			<fo:table-column/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding-left="5" padding-right="5" padding-top="5" padding-bottom="5">
						<fo:block>
							<fo:external-graphic
								height=".75in"
								width=".75in"
								content-height="scale-to-fit"
								content-width="scale-to-fit"
								>
								<xsl:attribute name="src">
									url(file://<xsl:value-of select="$image_folder"/><xsl:value-of select="@image" />)
								</xsl:attribute>
							</fo:external-graphic>
							</fo:block>
					</fo:table-cell>
					<fo:table-cell display-align="center">
						<fo:block>
							<xsl:value-of select="." />
						</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
	</xsl:template>

	<xsl:template match="break">
		<fo:block padding-left="0" padding-top="3" padding-bottom="3">
			<xsl:value-of select="." />
		</fo:block>
	</xsl:template>

	<xsl:template match="description">
		<fo:block padding-right="2"
			padding-left="0" padding-top="4" padding-bottom="4">
				<xsl:value-of select="." />
		</fo:block>
	</xsl:template>

	<xsl:template match="workpic">
		<fo:block padding-right="2"
			padding-left="0" padding-top="4">
			<fo:external-graphic
				height="2in"
				width="4in"
				content-height="scale-to-fit"
				content-width="scale-to-fit"
				>
				<xsl:attribute name="src">
					url(file://<xsl:value-of select="$image_folder"/><xsl:value-of select="@image" />)
				</xsl:attribute>
			</fo:external-graphic>
		</fo:block>
	</xsl:template>

	<xsl:template match="linkto">
		<fo:basic-link>
			<xsl:attribute name="external-destination">url('http://<xsl:value-of
				select="@url" />')</xsl:attribute>
			<fo:inline color="#0000CC">
				<xsl:value-of select="." />
			</fo:inline>
		</fo:basic-link>
	</xsl:template>

</xsl:stylesheet>
