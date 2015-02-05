<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">
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

						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="1.75in" />
							<fo:table-column column-width="5.25in" />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<xsl:apply-templates select="contact" />
										<xsl:apply-templates select="skill" />
									</fo:table-cell>
									<fo:table-cell border-style="solid" border-right="0"
										border-left="0" border-top="0" border-bottom="0">
										<fo:block margin-top="32" margin-left="20" margin-right="20" margin-bottom="5">
											<xsl:apply-templates select="header" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>

						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="7in" />
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block line-height="2.0" letter-spacing="4pt"
											border-left-width="1"
											border-right-width="1"
											border-top-width="1"
											border-bottom-width="1"											
											border-left-style="solid"
											border-right-style="solid"
											border-top-style="solid"
											border-bottom-style="solid"																																	
											padding-top="35" margin-bottom="12" background-image="/home/kevin/git/km_resume/in/projects.png" background-repeat="no-repeat">											 											
										</fo:block>

										<xsl:apply-templates select="project" />

									</fo:table-cell>
								</fo:table-row>							
								<fo:table-row>
									<fo:table-cell>
										<fo:block line-height="2.0" letter-spacing="4pt"
											padding-top="35" margin-bottom="6" background-image="/home/kevin/git/km_resume/in/pro.png" background-repeat="no-repeat">											 											
										</fo:block>

										<xsl:apply-templates select="job" />

										<!-- 

										<xsl:apply-templates select="job[1]" />
										<xsl:apply-templates select="job[2]" />
										<xsl:apply-templates select="job[3]" />
										<xsl:apply-templates select="job[4]" />
										<xsl:apply-templates select="job[5]" />
										
										-->

									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>

										<fo:block line-height="2.0" letter-spacing="4pt">
											Education
										</fo:block>

										<fo:table table-layout="fixed" width="100%">
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
													<fo:table-cell>
														<fo:block text-align="right" margin-right="10">
															6/1994
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
		<fo:block margin-left="20">
			<fo:block line-height="2.4" letter-spacing="4pt">
				<xsl:value-of select="title" />
			</fo:block>
			<xsl:apply-templates select="description" />
			<xsl:apply-templates select="lead" />
		</fo:block>
	</xsl:template>

	<xsl:template match="career">
		<xsl:apply-templates select="highlight" />
	</xsl:template>
	
	<xsl:template match="skill">
		<fo:block text-align="left" margin-left="0" padding-top="2" padding-left="5" padding-right="10" border-left="0"
			border-style="solid" border-right-width="1" border-right-style="solid" border-top="0"
			border-bottom=".0">
			<fo:block font-weight="bold" line-height="1.50" font-size="11.5pt">
				<xsl:value-of select="@title" />
			</fo:block>
			<fo:block margin-left="10" margin-right="10" font-size="10.1pt">
				<xsl:value-of select="list" />
			</fo:block>
		</fo:block>
	</xsl:template>

	<xsl:template match="project">

		<fo:block>
			<fo:table table-layout="fixed" width="100%">
				<fo:table-column column-width="2.333in" />
				<fo:table-column column-width="2.333in" />
				<fo:table-column column-width="2.333in" />
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding-top="5" padding-bottom="5">
							<fo:block font-weight="bold">
								<xsl:value-of select="title" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-top="2"
							padding-bottom="2">
							<fo:block font-style="italic">							
							<fo:basic-link>
								<xsl:attribute name="external-destination">url('http://<xsl:value-of select="company" />')</xsl:attribute>
									<fo:inline color="#0000CC">
										<xsl:value-of select="company" />
									</fo:inline>
								</fo:basic-link>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-top="4"
							padding-bottom="4">
							<xsl:choose>
							<xsl:when test="string-length(stay) &gt; 10">
								<fo:block margin-right="10">
									<xsl:value-of select="stay"/>
								</fo:block>
							</xsl:when>
							<xsl:otherwise>
								<fo:block margin-right="40">
									<xsl:value-of select="stay"/>
								</fo:block>							
							</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<fo:block text-align="justify" margin-left="30" margin-right="30"
			padding-bottom="4" line-height="1.25">
			<xsl:apply-templates select="story" />
		</fo:block>
	</xsl:template>

	<xsl:template match="job">

		<fo:block>
			<fo:table table-layout="fixed" width="100%">
				<fo:table-column column-width="2.333in" />
				<fo:table-column column-width="2.333in" />
				<fo:table-column column-width="2.333in" />
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding-top="5" padding-bottom="5">
							<fo:block font-weight="bold">
								<xsl:value-of select="title" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="center" padding-top="2"
							padding-bottom="2">
							<fo:block font-style="italic">
								<xsl:value-of select="company" />
							</fo:block>
						</fo:table-cell>
						<fo:table-cell text-align="right" padding-top="4"
							padding-bottom="4">
							<xsl:choose>
							<xsl:when test="string-length(stay) &gt; 10">
								<fo:block margin-right="10">
									<xsl:value-of select="stay"/>
								</fo:block>
							</xsl:when>
							<xsl:otherwise>
								<fo:block margin-right="40">
									<xsl:value-of select="stay"/>
								</fo:block>							
							</xsl:otherwise>
							</xsl:choose>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<fo:block text-align="justify" margin-left="30" margin-right="30"
			padding-bottom="4" line-height="1.25">
			<xsl:apply-templates select="story" />
		</fo:block>
	</xsl:template>

	<xsl:template match="work">
		<fo:table-cell>
			<xsl:apply-templates select="url" />
		</fo:table-cell>
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
		<fo:block text-align="center" padding-bottom="4">
			<fo:block line-height="2" font-weight="bold">
				<xsl:value-of select="name" />
			</fo:block>
			<fo:block font-size="10.1pt">
				<xsl:value-of select="address1"/>
			</fo:block>
			<fo:block font-size="10.1pt">
				<xsl:value-of select="address2"/>
			</fo:block>
			<fo:block font-size="10.1pt">
				<xsl:value-of select="phone"/>
			</fo:block>
			<fo:block  font-size="10.1pt">
				<fo:basic-link external-destination="url('mailto:kevin70@yahoo.com')"
					text-decoration="underline" color="#0000CC" >
					<xsl:value-of select="email" />
				</fo:basic-link>
			</fo:block>
			<fo:block  font-size="10.1pt" padding-bottom="10">
				web:<fo:basic-link padding-left=".5mm" external-destination="url('http://nwice.com')"
					text-decoration="underline" color="#0000CC" >
					<xsl:value-of select="web" />
				</fo:basic-link>
			</fo:block>			
		</fo:block>
	</xsl:template>
	<xsl:template match="lead">
		<fo:block margin-right="8" margin-left="12" padding-top="8" padding-bottom="8">
			<xsl:value-of select="." />
		</fo:block>
	</xsl:template>
	
	<xsl:template match="description">	
		<fo:block text-align="justify" padding-right="2"
			padding-left="0" padding-top="5" padding-bottom="5">
			<xsl:value-of select="." />
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
