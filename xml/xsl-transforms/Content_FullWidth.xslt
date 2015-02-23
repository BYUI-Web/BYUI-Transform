<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="xml" indent="yes"/>
  <xsl:template match="Content_FullWidth">
    <xsl:variable select="@ID" name="xid"></xsl:variable>
    <xsl:variable select="@Name" name="name"></xsl:variable>

    <!--*** Ingeniux CMS 8.0.143 - http://www.ingeniux.com ***-->
    <Content ID="{$xid}" Name="{$name}" Layout="byuidefault.xsl" IsComponent="false">
      <Title type="string" label="Title" readonly="false" hidden="false" required="true">
        <xsl:value-of select="Title"/>
      </Title>
      <Abstract type="string" label="Abstract" readonly="false" hidden="false" required="true">
        <xsl:value-of select="Abstract"/>
      </Abstract>

      <IsResponsive type="boolean" label="Mobile Ready (responsive)" readonly="false" hidden="false" required="false">false</IsResponsive>

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

      <!--default social media values-->
      <xPower Type="GroupStart" GroupStart="" Name="SocialMedia" label="Social Media" readonly="false" hidden="false" required="false" Expanded="false">
        <SocialTitle type="string" label="Title" readonly="false" hidden="false" required="false"></SocialTitle>
        <SocialDescription type="string" label="Description" readonly="false" hidden="false" required="false"></SocialDescription>
        <SocialImage type="imagefile" label="Image" readonly="false" hidden="false" required="false" Expanded="false" Width="" Height="" Border="" HSpace="" VSpace="" Alignment=""></SocialImage>
        <SocialVideo type="mediafile" label="Video" readonly="false" hidden="false" required="false" Expanded="false"></SocialVideo>
        <SocialAudio type="string" label="Audio" readonly="false" hidden="false" required="false"></SocialAudio>
        <SocialSeeAlso type="string" label="See Also" readonly="false" hidden="false" required="false"></SocialSeeAlso>
      </xPower>

      <!--default page options values-->
      <xPower Type="GroupStart" GroupStart="" Name="PageOptions" label="Page Options" readonly="false" hidden="false" required="false" Expanded="false">
        <HideTitle type="boolean" label="Hide Title" readonly="false" hidden="false" required="false">true</HideTitle>
        <Hideleftnavigation type="boolean" label="Hide Navigation" readonly="false" hidden="false" required="false">true</Hideleftnavigation>
      </xPower>

      <!--custom body copy-->
      <BodyCopy type="dhtml" label="Body Copy" readonly="false" hidden="false" required="false" Height="">
        <xsl:value-of select="BodyCopy"/>
      </BodyCopy>

      <!--empty page components-->
      <xPower Type="GroupStart" GroupStart="" Name="PageComponents" label="Page Components" readonly="false" hidden="false" required="false" Expanded="true">
        <xPower Type="List" List="xpowercomponent_Optional" Name="OptionalColumnComponent" label="Optional Column Components" readonly="false" hidden="false" required="false" Expanded="true" Component="" CompTypes="FacebookComponent;Image;ColumnTextComponent;Media;Quote;LeftColumnImageComponent">
        </xPower>
        <xPower Type="Component" Component="" Name="QuickLinksColumn1" label="QuickLinks Column 1" readonly="false" hidden="false" required="false" CompTypes="QuickLinksComponent" Expanded="false"/>
        <xPower Type="Component" Component="" Name="QuickLinksColumn2" label="QuickLinks Column 2" readonly="false" hidden="false" required="false" CompTypes="QuickLinksComponent" Expanded="false"/>
        <xPower Type="Component" Component="" Name="QuickLinksColumn3" label="QuickLinks Column 3" readonly="false" hidden="false" required="false" CompTypes="QuickLinksComponent" Expanded="false"/>
      </xPower>

      <!--highlighted links-->
      <xPower Type="Component" Component="" Name="HighlightedLinks" label="Highlighted Links" readonly="false" hidden="false" required="false" CompTypes="HighlightedLinksComponent" Expanded="false"/>

      <!--content snippets-->
      <xPower Type="List" List="xpowercomponent_ContentSnippet" Name="ContentSnippet" label="Content Snippet" readonly="false" hidden="false" required="false" Expanded="false" Component="" CompTypes="ContentSnippet">
        <xPower Type="Component" Component="" Name="ContentSnippet" readonly="false" hidden="false" required="false" Expanded="false" CompTypes="ContentSnippet"/>
      </xPower>

      <!---Ancestor Navigation and Site Control-->
      <xPower Type="Navigation" StartPage="{xPower[@Name='AncestorNavigation']/@StartPage}" MaxDepth="" MaxNodes="" GenerationOrder="down" Navigation="Ancestors" Query="" Name="AncestorNavigation" label="Ancestor Navigation" readonly="true" hidden="true" required="false" Expanded="false"/>
      <xPower Type="Component" Component="{xPower[@Name='SiteControl']/@Component}" Name="SiteControl" label="Site Control" readonly="true" hidden="false" required="false" CompTypes="SiteControl" Expanded="false"/>
    </Content>

  </xsl:template>
</xsl:stylesheet>
