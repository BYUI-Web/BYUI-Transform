<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>
  <xsl:variable select="@ID" name="xid"></xsl:variable>
  <xsl:variable select="@Name" name="name"></xsl:variable>
  
  <xsl:template match="Content">
    <AcademicDiscoveryCenterArticle ID="{@ID}" Name="{@Name}" IsComponent="false" Layout="byuidefault.xsl">
    </AcademicDiscoveryCenterArticle>
  </xsl:template>
</xsl:stylesheet>
