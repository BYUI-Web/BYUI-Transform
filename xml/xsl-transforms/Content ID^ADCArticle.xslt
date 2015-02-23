<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="xml" indent="yes"/>
 
  <!--*** Ingeniux CMS 8.0.143 - http://www.ingeniux.com ***-->
  <xsl:template match="Content">
    <xsl:variable select="@ID" name="xid"></xsl:variable>
    <AcademicDiscoveryCenterArticle ID="{$xid}" Name="{@Name}" IsComponent="false" Layout="byuidefault.xsl">
      <Title type="string" label="Title" readonly="false" hidden="false" required="true">
        <xsl:value-of select="Title"/>
      </Title>

      <Abstract type="string" label="Abstract" readonly="false" hidden="false" required="true">
        <xsl:value-of select="Abstract"/>
      </Abstract>

      <Subtitle type="string" label="Subtitle" readonly="false" hidden="false" required="false"></Subtitle>

      <xPower Type="Component" Name="Navigation" label="Navigation" readonly="false" hidden="false" required="false" Component="" CompTypes="" Expanded="false"/>

      <!--if the page was new enough to have an SEOGroup section, just copy it. Else insert the default config.-->
      <xsl:if test="xPower[@Name='SEOGroup']">
        <xsl:copy-of select="xPower[@Name='SEOGroup']"/>
      </xsl:if>
      <xsl:if test="xPower[@Name='SEOGroup']">
        <xPower Type="GroupStart" GroupStart="" Name="SEOGroup" label="SEO Group" readonly="false" hidden="false" required="false" Expanded="false">
          <BrowserBarTitle type="string" label="Browser Bar Title" readonly="false" hidden="false" required="false"></BrowserBarTitle>
          <MetaDescription type="string" label="Meta Description" readonly="false" hidden="false" required="false"></MetaDescription>
          <NoFollow type="boolean" label="No Follow" readonly="false" hidden="true" required="false">false</NoFollow>
          <NoIndex type="boolean" label="No Index" readonly="false" hidden="true" required="false">false</NoIndex>
          <NoODP type="boolean" label="No ODP" readonly="false" hidden="true" required="false">false</NoODP>
          <Priority type="enumeration" values="0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0" label="Priority" readonly="false" hidden="true" required="false">0.5</Priority>
        </xPower>
      </xsl:if>

      <!--Default Social Media Values-->
      <xPower Type="GroupStart" Name="SocialMedia" label="Social Media" readonly="false" hidden="false" required="false" Expanded="false" GroupStart="">
        <SocialTitle type="string" label="Title" readonly="false" hidden="false" required="false"/>
        <SocialDescription type="string" label="Description" readonly="false" hidden="false" required="false"/>
        <SocialImage type="imagefile" label="Image" readonly="false" hidden="false" required="false" Expanded="false" Width="" Height="" Border="" HSpace="" VSpace="" Alignment=""/>
        <SocialVideo type="mediafile" label="Video" readonly="false" hidden="false" required="false" Expanded="false"/>
        <SocialAudio type="string" label="Audio" readonly="false" hidden="false" required="false"/>
        <SocialSeeAlso type="string" label="See Also" readonly="false" hidden="false" required="false"/>
      </xPower>

      <BodyCopy type="dhtml" label="Article Body" readonly="false" hidden="false" required="false" Height="">
        <xsl:value-of select="BodyCopy"/>
      </BodyCopy>

      <!--content snippets-->
      <xPower Type="List" List="xpowercomponent_ContentSnippet" Name="ContentSnippet" label="Content Snippet" readonly="false" hidden="false" required="false" Expanded="false" Component="" CompTypes="ContentSnippet">
        <xPower Type="Component" Component="" Name="ContentSnippet" readonly="false" hidden="false" required="false" Expanded="false" CompTypes="ContentSnippet"/>
      </xPower>

      <xPower Type="Navigation" Name="DeptEvents" label="Define Your Events Folder" readonly="false" hidden="false" required="false" Expanded="false" Navigation="Children" GenerationOrder="down" StartPage="" MaxNodes="" MaxDepth="" Query=""/>
      <xPower Type="Navigation" Name="AncestorNavigation" label="Ancestor Navigation" readonly="true" hidden="true" required="false" Expanded="false" Navigation="Ancestors" GenerationOrder="down" StartPage="{xPower[@Name='AncestorNavigation']/@StartPage}" MaxNodes="" MaxDepth="" Query=""/>
      <xPower Type="Component" Name="SiteControl" label="Site Control" readonly="true" hidden="false" required="false" Component="{xPower[@Name='SiteControl']/@Component}" CompTypes="SiteControl" Expanded="false"/>
    </AcademicDiscoveryCenterArticle>
  </xsl:template>
</xsl:stylesheet>
