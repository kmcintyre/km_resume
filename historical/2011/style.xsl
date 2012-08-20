<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>

  <xsl:template match="resume">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simple" page-height="11in" page-width="8.5in" margin-top="1in" margin-bottom=".85in" margin-left="1in" margin-right="1in">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="simple">
        <fo:flow flow-name="xsl-region-body">        
		<fo:block font-size="10pt" font-family="Times">
		
		<fo:table table-layout="fixed">
			  <fo:table-column column-width="1.8in"/>
              <fo:table-column column-width="4.7in"/>              		
		      

            <fo:table-body>
		    <fo:table-row>
				<fo:table-cell>				                       
					<xsl:apply-templates select="contact"/>					
					<xsl:apply-templates select="skill"/>
				</fo:table-cell>		    
				<fo:table-cell border-style="solid" border-right="0" border-left="0" border-top="0" border-bottom="0">
					<fo:block margin-top="58" margin-left="25" margin-right="25">								
						<xsl:apply-templates select="header"/>		          									
					</fo:block>
				</fo:table-cell>			 
				
				
				
			</fo:table-row>
		  </fo:table-body>
      	</fo:table>
        <fo:table table-layout="fixed">
        <fo:table-column column-width="6.5in"/>
        <fo:table-body>
		    <fo:table-row>
			    <fo:table-cell>
			        <fo:block line-height="2.0" letter-spacing="4pt" padding-top="10">
					Professional Experience
					</fo:block>
					
					
						<xsl:apply-templates select="job"/>
					
				</fo:table-cell>
			</fo:table-row>			
		    <fo:table-row>
			    <fo:table-cell>		            
		      
				<fo:block line-height="2.0" letter-spacing="4pt">
				Education
				</fo:block>
		
				          <fo:table table-layout="fixed">
			              <fo:table-column column-width="2.166in"/>
						  <fo:table-column column-width="2.166in"/>
						  <fo:table-column column-width="2.166in"/>
	
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
	<fo:block margin-left="10">        
		<fo:block line-height="2.4" letter-spacing="4pt">
	    	<xsl:value-of select="title"/>
	    </fo:block>
		<fo:block padding-bottom="3" margin-left="10" margin-right="20">	
		  	<xsl:apply-templates select="description"/>
	  	</fo:block>
	</fo:block>
  </xsl:template>
  
  <xsl:template match="career">
	<xsl:apply-templates select="highlight"/>	
  </xsl:template>
  
  
  <xsl:template match="skill">
	<fo:block text-align="left" margin-left="0" padding-top=".5" border-style="solid" border-right="0" border-left="0" border-top="0" border-bottom=".0">
		<fo:block font-weight="bold" line-height="1.75">
        	<xsl:value-of select="@title"/>
		</fo:block>
		<fo:block margin-left="10" color="#666666" margin-right="10">
			<xsl:value-of select="list"/>
		</fo:block>
	</fo:block> 
  </xsl:template>
  
    <xsl:template match="job">
    
    <fo:block keep-together="always">
    
            <fo:table table-layout="fixed">
            
            
            <fo:table-column column-width="2.166in"/>
		  	<fo:table-column column-width="2.166in"/>
		  	<fo:table-column column-width="2.166in"/>
            <fo:table-body>
		    <fo:table-row>
             <fo:table-cell padding-top="4" padding-bottom="4">
				 <fo:block font-weight="bold">
				 <xsl:value-of select="title"/>
				 </fo:block>
			 </fo:table-cell>
                   <fo:table-cell text-align="center" padding-top="2" padding-bottom="2">
				 <fo:block font-style="italic">
					<xsl:value-of select="company"/>
				 </fo:block>
			 </fo:table-cell>
                   <fo:table-cell text-align="right" padding-top="4" padding-bottom="4">
				 <fo:block margin-right="10">
					<xsl:value-of select="stay"/>
				 </fo:block>
			 </fo:table-cell>
		    </fo:table-row>
		    <fo:table-row>
                   <fo:table-cell number-columns-spanned="3">
	                   <fo:block 	                   		
	                   				text-align="justify" 
	                   				margin-left="30" margin-right="30" padding-bottom="4" line-height="1.25">
		                   <xsl:apply-templates select="descriptions"/>                   			
                   		</fo:block>
			 		</fo:table-cell>
		    </fo:table-row>
		  </fo:table-body>
            </fo:table>    
            </fo:block>         
  </xsl:template>

  <xsl:template match="work">
		<fo:table-cell>
			<xsl:apply-templates select="url"/>
		</fo:table-cell>
   </xsl:template>

  <xsl:template match="url">
		<fo:block>
			<fo:basic-link text-decoration="underline" color="#0000CC">
				<xsl:attribute name="external-destination">url('http://<xsl:value-of select="."/>')</xsl:attribute>
		       	<xsl:value-of select="."/>
			</fo:basic-link>
		</fo:block>
   </xsl:template>
   

  <xsl:template match="contact">
					<fo:block text-align="center" margin-right="5">
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

  <xsl:template match="description">
	<fo:block text-align="justify" padding-right="0" padding-left="0" padding-top="3.5" padding-bottom="3.5">
          <xsl:value-of select="."/>
	</fo:block> 
  </xsl:template>
  
  <xsl:template match="descriptions">
  	<fo:inline>
	  	<xsl:apply-templates select="*"/>   
  	</fo:inline>
  </xsl:template>
  
  <xsl:template match="stuff">
	<xsl:value-of select="."/>
  </xsl:template>
  
  <xsl:template match="linkto">
		<fo:basic-link text-decoration="underline" color="#0000CC">
			<xsl:attribute name="external-destination">url('http://<xsl:value-of select="@url"/>')</xsl:attribute>
		    <xsl:value-of select="."/>
		</fo:basic-link>
  </xsl:template>
      
  <xsl:template match="highlight">
    	<fo:block text-align="justify" padding-right="0" padding-left=".1" padding-top=".1" padding-bottom=".1">
    	<fo:inline font-style="italic">
		    <xsl:value-of select="@company"/>
		</fo:inline>
	    <xsl:value-of select="."/>		
	    </fo:block>
  </xsl:template>

</xsl:stylesheet>
